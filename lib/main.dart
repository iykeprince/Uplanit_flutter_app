import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_supplier/core/bloc/onboard_bloc.dart';
import 'package:uplanit_supplier/core/services/authentication_service.dart';
import 'package:uplanit_supplier/core/services/onboard_service.dart';
import 'package:uplanit_supplier/core/viewmodels/category_provider.dart';
import 'package:uplanit_supplier/core/viewmodels/event_type_provider.dart';
import 'package:uplanit_supplier/ui/views/auth/login/login.dart';
import 'package:uplanit_supplier/ui/views/business_profile/business_profile.dart';
import 'package:uplanit_supplier/ui/views/launcher/launcher.dart';
import 'package:uplanit_supplier/ui/views/onboard/all_done.dart';
import 'core/enums/api_response_type.dart';
import 'core/models/onboard.dart';
import 'core/repository/api.dart';
import 'core/utils/custom_router.dart';
import 'core/utils/locator.dart';
import 'core/viewmodels/auth_model.dart';
import 'core/viewmodels/onboard_model.dart';
import 'core/viewmodels/signin_model.dart';
import 'ui/views/onboard/account_setup_one.dart';
import 'ui/views/onboard/account_setup_two.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => locator<AuthenticationService>()),
        Provider<OnboardService>(create: (_) => OnboardService()),
        ChangeNotifierProvider(create: (_) => AuthModel()),
        ChangeNotifierProvider<SigninModel>(create: (_) => SigninModel()),
        ChangeNotifierProvider<OnboardModel>(create: (_) => OnboardModel()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (_) => CategoryProvider()),
        ChangeNotifierProvider<EventTypeProvider>(
            create: (_) => EventTypeProvider()),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
        // StreamProvider<ApiResponse<Onboard>>(
        //   initialData: ApiResponse<Onboard>.initialize(Onboard(
        //     loading: true,
        //     auth: false,
        //     profile: null,
        //     categories: null,
        //     eventTypes: null,
        //   )),
        //   lazy: true,
        //   create: (context) =>
        // ),
      ],
      child: MaterialApp(
        title: 'Uplanit Supplier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
        onGenerateRoute: CustomRouter.onGenerateRoute,
      ),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  static const String ROUTE = '/';
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  OnboardBloc _onboardBloc;
  @override
  void initState() {
    _onboardBloc = OnboardBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();

    return Scaffold(
      body: firebaseUser == null
          ? Launcher()
          : StreamBuilder<ApiResponse<Onboard>>(
              stream: _onboardBloc.onboardServiceStream,
              builder: (BuildContext context,
                  AsyncSnapshot<ApiResponse<Onboard>> snapshot) {
                if (snapshot.hasData) {
                print('Stream message: ${snapshot.data.message}');
                  ApiResponseStatus status = snapshot.data.status;
                  if (status == ApiResponseStatus.LOADING)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (status == ApiResponseStatus.COMPLETED) {
                    Onboard onboard = snapshot.data.data;
                    print('onboard profile: ${onboard.profile}');
                    print('onboard categories: ${onboard.categories}');
                    print('onboard eventTypes: ${onboard.eventTypes}');
                    if (onboard.profile == null)
                      return AccountSetupOne();
                    else if (onboard.categories == null)
                      return AccountSetupTwo();
                    else if (onboard.eventTypes == null)
                      return AccountSetupTwo(
                        isShowDialog: true,
                      );
                    else
                      return BusinessProfile();
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}