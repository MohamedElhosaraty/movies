/// **الفئة الأساسية للأخطاء في التطبيق**
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}
