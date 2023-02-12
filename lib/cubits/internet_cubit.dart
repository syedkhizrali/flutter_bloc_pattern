import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{
  Initial,
  Lost,
  Gained

}

class InternetCubit extends Cubit<InternetState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubcription;

  InternetCubit(): super(InternetState.Initial){
    _connectivitySubcription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
        emit(InternetState.Gained);
      }else{
        emit(InternetState.Lost);
      }

    });
  }

  @override
  Future<void> close() {
    _connectivitySubcription?.cancel();
    return super.close();
  }
}