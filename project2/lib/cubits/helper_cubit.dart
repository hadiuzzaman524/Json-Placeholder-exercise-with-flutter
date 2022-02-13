import 'package:bloc/bloc.dart';
import 'package:project2/data/fetch_from_internet.dart';

import 'helper_state.dart';

class HelperCubit extends Cubit<HelperState> {
  HelperCubit() : super(InitialState());
final DataManager _dataManager=DataManager();
  Future<void> fetchData() async{
    const String url="https://jsonplaceholder.typicode.com/posts";
    try{
      emit(LoadingState());
      final jsonBody = await _dataManager.fetchFromInternet(url);
        emit(LoadedState(jsonBody.toString()));
        if(jsonBody=="") {
          emit(ErrorState("An error occur"));
        }
    }catch(e){
      emit(ErrorState("An error occur"));
    }
  }
}
