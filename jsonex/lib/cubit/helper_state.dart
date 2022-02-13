class HelperState {
  HelperState init() {
    return HelperState();
  }

  HelperState clone() {
    return HelperState();
  }
}

class InitialState extends HelperState {}

class LoadingState extends HelperState {}

class FetchDataState extends HelperState {}

class LoadedState extends HelperState {

  String jsonBody;
  LoadedState(this.jsonBody);

}

class ErrorState extends HelperState {
  String errorMessage;
  ErrorState(this.errorMessage);
}
