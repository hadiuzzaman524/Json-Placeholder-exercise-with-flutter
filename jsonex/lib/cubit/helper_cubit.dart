import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'helper_state.dart';

class HelperCubit extends Cubit<HelperState> {
  HelperCubit() : super(InitialState());

  Future<void> fetchData() async {
    const String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    try {
      emit(LoadingState());
      final response = await http.get(Uri.parse(dataUrl));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Ok");
          print(response.body);
        }
        emit(LoadedState(response.body));
      } else {
        if (kDebugMode) {
          print("Status error ${response.statusCode}");
        }
        emit(ErrorState("Status code ${response.statusCode}"));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
      emit(ErrorState("Error in fetch data"));
    }
  }
}
