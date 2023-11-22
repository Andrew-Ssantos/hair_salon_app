sealed class SplashState {
  SplashState();
}

class SplashStateSuccess extends SplashState {
  SplashStateSuccess();
}

class SplashStateLoading extends SplashState {
  SplashStateLoading();
}

class SplashStateFail extends SplashState {
  final String errorMessage;
  SplashStateFail(this.errorMessage);
}
