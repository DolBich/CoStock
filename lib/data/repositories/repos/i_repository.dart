abstract class IRepository {}

mixin MockRepoDelay {
  static const Duration delayDuration = Duration(milliseconds: 600);

  Future<void> delay() => Future.delayed(delayDuration);
}