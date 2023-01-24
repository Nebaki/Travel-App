import 'package:bloc/bloc.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/data_provider/data_service.dart';

import '../model/data_model.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.data}) : super(InitailState()) {
    emit(WelcomeState());
  }
  final dataservice data;
  late final places;
  void getdata() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailpage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
