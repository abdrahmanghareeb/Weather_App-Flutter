import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/Shared/Network/Local/geolocatorHelper.dart';
import 'package:weather_app/Shared/Network/Remote/dioHelper.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  //create object
  static WeatherCubit get(context) => BlocProvider.of(context);

  //attributes
  String currentLocation = "";
  String appid = "6ab2242ff2990d8d801e4fdaf6a48de2";
  geolocatorHelper geolocator = geolocatorHelper();
  String latitude = "30.0444";
  String longitude = "31.2357";
  var response ;

  //getPositionState
  void changeDeterminePositionState() {
    geolocator.determinePosition().then((value) {
      latitude = value.latitude.toString();
      print("latitude : $latitude");
      longitude = value.longitude.toString();
      print("longitude : $longitude");
      emit(determinePositionState());
      get_API_Response();
    });
  }

    Future<void> get_API_Response() async {
      emit(getResponseLoadingState());
      await dioHelper.getResponse(method: "data/2.5/weather", query: {
        "appid": appid,
        "lon"  : longitude,
        "lat"  : latitude
      }).
      then((value) {
        response = value.data;
        print(value.data.toString());
        emit(getResponseSucessState());
      }).onError((error, stackTrace) {
        emit(getResponseErrorState(error));
      });
    }

  void determineTheLastKnownLocationState(){
    geolocator.detrmineLastKnownLocation().then((value) {
      print("${value?.latitude}");
      print("${value?.longitude}");
    });
    emit(determineLastKnownLocationState());
  }

  void changeThePositionStreamState() {
    geolocator
        .getThePositionStream()
        .then((value) => emit(getPositionStreamState()))
        .onError((error, stackTrace) => print(error.toString()));
  }
}


// "main" : "temp",
// "main" : "temp_min",
// "main" : "temp_max",
// "main" : "humidity",
// "sys" : "country",
// "sys" : "sunrise",
// "sys" : "sunset",
// "name" : "",
// "cod" : ""
