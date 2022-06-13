import 'dart:convert';

TResult tResultFromJson(String str) => TResult.fromJson(json.decode(str));

String tResultToJson(TResult data) => json.encode(data.toJson());

class TResult {
  List<String>? messages;
  dynamic result;
  bool? success;


  TResult({
    this.messages,
    this.result,
    this.success,
  });


  factory TResult.fromJson(Map<String, dynamic> json) =>
      TResult(
          messages: List<String>.from(json["Messages"].map((x) => x)),
          result: json["Result"],
          success: json["Success"]
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Messages'] = this.messages;
    data['Result'] = this.result;
    data['Success'] = this.success;
    return data;
  }
}