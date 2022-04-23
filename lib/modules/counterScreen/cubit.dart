import 'package:bloc/bloc.dart';
import 'package:cubit_api/modules/counterScreen/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  int counter =0;
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  void minus(){
    counter--;
    emit(CounterMinusState());
  }
  void plus(){
    counter++;
    emit(CounterPlusState());
  }
}