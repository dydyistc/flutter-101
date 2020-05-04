class Student {
  String name;
  int age;

  Student.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  @override
  String toString() {
    return 'name: $name, age: $age';
  }
}

class BasicList {
  List<Student> students;

  BasicList.fromJson(List<dynamic> json)
    : students = json.map((i) => Student.fromJson(i)).toList();

  @override
  String toString() {
    return '$students';
  }
}

class BasicMap {
  int code;
  String result;

  BasicMap.fromJson(Map<String, dynamic> json)
    : code = json['code'],
      result = json['result'];

  @override
  String toString() {
    return 'code: $code, result: $result';
  }
}

class BasicMapWithList {
  int code;
  String result;
  List<String> data;

  BasicMapWithList.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        data = List<String>.from(json['data']);

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}

class BasicMapWithListModel {
  int code;
  String result;
  List<Student> data;

  BasicMapWithListModel.fromJson(Map<String, dynamic> json)
    : code = json['code'],
      result = json['result'],
      data = List.from(json['data']).map((i) => Student.fromJson(i)).toList();

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}

class BasicMapWithModel {
  int code;
  String result;
  Student data;

  BasicMapWithModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        data = Student.fromJson(json['data']);

  @override
  String toString() {
    return 'code: $code, result: $result, data: ${data.toString()}';
  }
}