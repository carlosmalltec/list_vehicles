import 'dart:convert';

FailureNetwork failureNetworkFromMap(String str) => FailureNetwork.fromMap(json.decode(str));

String failureNetworkToMap(FailureNetwork data) => json.encode(data.toMap());

class FailureNetwork {
  FailureNetwork({
    required this.message,
    required this.code,
    required this.file,
    required this.line,
  });

  String message;
  int code;
  String file;
  int line;

  factory FailureNetwork.fromMap(Map<String, dynamic> json) => FailureNetwork(
    message: json["message"],
    code: json["code"],
    file: json["file"],
    line: json["line"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "code": code,
    "file": file,
    "line": line,
  };
}