# flutter101

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## JSON 解析

> 参考文章：
>
> [Json转Dart Model类](https://book.flutterchina.club/chapter11/json_model.html)
>
> [[译]在 Flutter 中解析复杂的 JSON](https://juejin.im/post/5b5d782ae51d45191c7e7fb3)
>
> [flutter_dojo json](https://github.com/xuyisheng/flutter_dojo/blob/master/lib/category/backend/json.dart)



#### 手动解析：

定义 `Model`，自己写 `fromJson` 解析方法 并实现，如：

```dart
class User {
  String name;
  String email;

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
}
```



#### 自动解析：

1. 使用官方推荐的 [json_serializable](https://pub.dev/packages/json_serializable) 包，它可以自动生成解析代码。在 `pubspec.yaml` 中添加如下依赖：

  ```yaml
  dependencies:
    json_annotation: ^2.0.0
  
  dev_dependencies:
    build_runner: ^1.0.0
    json_serializable: ^2.0.0
  ```

2. 使用如下方式创建 `Model` 类，如  `User Model` ：

  ```dart
  import 'package:json_annotation/json_annotation.dart';
  
  // user.g.dart 将在我们运行生成命令后自动生成，与当前文件 user.dart 在相同目录下。
  part 'user.g.dart';
  
  ///这个标注是告诉生成器，这个类是需要生成Model类的
  @JsonSerializable()
  
  class User{
    String name;
    String email;
  
    // 运行自动生成的方法时 需要有一个初始化器
    User(this.name, this.email);
    
    // 定义好 fromJson 方法，_$UserFromJson() 方法将在我们运行生成命令后自动生成
    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  }
  ```

  可以使用 `@JsonSerializable` 来标注类，使用 `@JsonKey` 来标注字段，详见 [Annotation values](https://pub.dev/packages/json_serializable#annotation-values) ，如：

  ```dart
  // 标记此字段必须存在，否则解析会报错。
  @JsonKey(required: false)
  String gender;
  ```

3. 完成前2步后，运行代码生成程序，生成 `user.g.dart` 文件

   - 一次性生成。在根目录下运行:

     ```shell
     flutter packages pub run build_runner build
     ```

   - 持续生成。它会监视我们项目中文件的变化并自动生成（如果有时生成不及时，试验发现按 `cmd + s` 也会触发改动生效），在根目录下运行：

     ```shell
     flutter packages pub run build_runner watch
     ```





## 网络请求



**注意：**在拦截器 `interceptor` 中把 `DioError` 转换为 `HttpError` 抛出是无效的，如果这样做，最终请求得到的是包装了 `HttpError` 的 `DioError` 对象。

**因为：** Dio 发起的请求在返回 future 给业务层之前， catch 了错误（ `dio.dart` 文件907行 ），并把它包装成 DioError 对象（ `dio.dart` 文件1121行）

 第907行：

```dart
// Normalize errors, we convert error to the DioError
return future.then<Response<T>>((data) {
  return assureResponse<T>(data);
}).catchError((err) {
  if (err == null || _isErrorOrException(err)) {
    throw assureDioError(err, requestOptions);
  }
  return assureResponse<T>(err, requestOptions);
});
```

第1121行：

```dart
DioError assureDioError(err, [RequestOptions requestOptions]) {
  DioError dioError;
  if (err is DioError) {
    dioError = err;
  } else {
    dioError = DioError(error: err);
  }
  dioError.request = dioError.request ?? requestOptions;
  return dioError;
}
```



