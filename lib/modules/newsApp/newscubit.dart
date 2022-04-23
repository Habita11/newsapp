
import 'package:cubit_api/modules/newsApp/businessScreen.dart';
import 'package:cubit_api/modules/newsApp/dio.dart';
import 'package:cubit_api/modules/newsApp/newsStates.dart';
import 'package:cubit_api/modules/newsApp/scienceScreen.dart';
import 'package:cubit_api/modules/newsApp/sportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitilBottomNavState());
  int currentIndex=0;
  static NewsCubit get(context)=>BlocProvider.of(context);
  List<Widget> screens=const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];
  List<dynamic> business=[];
  List<dynamic> science=[];
  List<dynamic> sports=[];
  void getBusiness() {
    emit(GetBusinessLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':"ad91fcf23bbd4dd882b50daf3e94f118",
        }).then((value){business=value.data['articles'];
        emit(GetBusinessSuccess());} ).catchError((e){emit(GetBusinessError(e.toString()));});
  }
  void getSports() {
    emit(GetSportsLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':"ad91fcf23bbd4dd882b50daf3e94f118",
        }).then((value){sports=value.data['articles'];
    emit(GetSportsSuccess());} ).catchError((e){emit(GetSportsError(e.toString()));});
  }
  void getScience() {
    emit(GetScienceLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':"ad91fcf23bbd4dd882b50daf3e94f118",
        }).then((value){science=value.data['articles'];
    emit(GetScienceSuccess());} ).catchError((e){emit(GetScienceError(e.toString()));});
  }
  List<BottomNavigationBarItem>items=const [
    BottomNavigationBarItem(icon: Icon(Icons.business_center),
      label:'Business',),
    BottomNavigationBarItem(icon: Icon(Icons.sports_motorsports),
      label:'Sports',),
    BottomNavigationBarItem(icon: Icon(Icons.science),
      label:'Science',),
    BottomNavigationBarItem(icon: Icon(Icons.settings),
      label:'Settings',),

  ];
  void bottomNav(int index)
  {
    currentIndex=index;
    emit(ChangeBottomNavState());
}
}