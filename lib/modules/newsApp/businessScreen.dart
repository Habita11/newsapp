
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_api/modules/newsApp/components.dart';
import 'package:cubit_api/modules/newsApp/newsStates.dart';
import 'package:cubit_api/modules/newsApp/newscubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).business;
        return ConditionalBuilder(

        condition:state is! GetBusinessLoading ,
          builder:(context)=>
          ListView.separated(itemBuilder: (context,index)=>articleItem(list[index]),
              separatorBuilder: (context,index)=>separator(), itemCount: list.length),
        fallback:(context)=> const Center(child: CircularProgressIndicator()) ,);
        },
    );

  }
}
