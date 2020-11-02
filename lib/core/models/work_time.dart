import 'dart:convert';

WorkTime workTimeFromJson(String str) => WorkTime.fromJson(json.decode(str));

String workTimeToJson(WorkTime data) => json.encode(data.toJson());

class WorkTime {
    WorkTime({
        this.workTime,
    });

    List<WorkTimeElement> workTime;

    factory WorkTime.fromJson(Map<String, dynamic> json) => WorkTime(
        workTime: List<WorkTimeElement>.from(json["work_time"].map((x) => WorkTimeElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "work_time": List<dynamic>.from(workTime.map((x) => x.toJson())),
    };
}

class WorkTimeElement {
    WorkTimeElement({
        this.close,
        this.id,
        this.open,
    });

    String close;
    String id;
    String open;

    factory WorkTimeElement.fromJson(Map<String, dynamic> json) => WorkTimeElement(
        close: json["close"],
        id: json["id"],
        open: json["open"],
    );

    Map<String, dynamic> toJson() => {
        "close": close,
        "id": id,
        "open": open,
    };
}
