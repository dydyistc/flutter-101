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



**注意**：在拦截器 `interceptor` 中把 `DioError` 转换为 `HttpError` 抛出是无效的，如果这样做，最终请求得到的是包装了 `HttpError` 的 `DioError` 对象。

**因为**：Dio 发起的请求在返回 future 给业务层之前，catch了错误( `dio.dart` 文件907行)，并把它包装成 `DioError`对象( `dio.dart` 文件1121行)。

 `dio.dart`  *第907行：*

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

`dio.dart` 第1121行：*

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





## 动画

> 参考文章：
>
> [Flutter实战 - 第九章 动画](https://book.flutterchina.club/chapter9/intro.html)
>
> [Flutter实战 - 进度指示器](https://book.flutterchina.club/chapter3/progress.html)



#### 简介：

Flutter 对动画进行了抽象，一个完整的动画，主要涉及以下5个角色：

- **Animation**: 是一个抽象类，保存动画的插值和状态。
- **Curve**: 描述动画的过程，如 匀速、匀加速等。
- **Controller**: 控制动画，如：启动 `forward()` 、停止 `stop()`、反向播放 `reverse()`。
- **Tween**: 定义动画值区间，从输入范围到输出范围的映射。
- **Ticker**: 添加屏幕刷新的回调，使用 `Ticker` (而不是 `Timer` ) 来驱动动画会防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源，锁屏后屏幕会停止刷新，所以 `Ticker` 就不会再触发。



需要注意：

- `AnimationController` 派生自 `Animation<double>` ，不同的是它具有控制动画的方法。
- `Ticker` 是一个抽象类，Widget中只有单个 animation controller 时，使用 `SingleTickerProviderStateMixin`；有多个 animation controller 时，使用 `TickerProviderStateMixin`。



#### 进度指示器：

1. 线性、条状进度条：`LinearProgressIndicator`
2. 圆形进度条：`CircularProgressIndicator`

它俩可设置的属性是一样的，如：

```dart
LinearProgressIndicator({
  double value,
  Color backgroundColor,
  Animation<Color> valueColor,
  ...
})
```

- `value`：当前的进度，取值范围为[0,1]；如果 `value` 为 `null` 则指示器会执行一个循环动画（模糊进度）。
- `backgroundColor`：指示器的背景色。
- `valueColor`: 指示器的进度条颜色；该值类型是 `Animation`，这允许我们对进度条的颜色指定动画。如果想固定进度条的颜色，可以使用 `AlwaysStoppedAnimation`。

设置大小：

这两个指示器是取父容器的尺寸作为绘制的边界，可以通过尺寸限制类Widget，如 `ConstrainedBox`、`SizedBox` 来指定尺寸。



#### 路由转场动画：

命名路由 + 转场动画，推荐使用统一路由管理库 [fluro](https://github.com/theyakka/fluro) ，Flutter原生好像暂不支持这种。



#### Hero 动画：

示例中给 Hero动画页的child 包装了一层 SizedBox，因为发现如果不固定转场元素的大小，在动画结束时会突变到最终大小，导致动画元素闪一下(Hero动画第一页未固定大小，从第二页返回时可看到)。