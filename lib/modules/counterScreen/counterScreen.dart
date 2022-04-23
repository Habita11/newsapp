import 'package:cubit_api/modules/counterScreen/cubit.dart';
import 'package:cubit_api/modules/counterScreen/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

 const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=>CounterCubit() ,
      child: BlocConsumer<CounterCubit,CounterStates>(listener: (BuildContext context, state) { },
        builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(),
          body: Row(children: [
            MaterialButton(child: Text('Plus'),
                onPressed: (){
              CounterCubit.get(context).plus();
                }),
            Text('${CounterCubit.get(context).counter <0? 0 : CounterCubit.get(context).counter }'),
            MaterialButton(child: Text('Minus'),
                onPressed: (){
              CounterCubit.get(context).minus();
            }),

          ],),
        );
        },

      ),
    );

  }
}
