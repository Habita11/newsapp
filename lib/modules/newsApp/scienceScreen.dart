import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart';
import 'newsStates.dart';
import 'newscubit.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).science;
        return ConditionalBuilder(

          condition:state is! GetScienceLoading ,
          builder:(context)=>
              ListView.separated(itemBuilder: (context,index)=>articleItem(list[index]),
                  separatorBuilder: (context,index)=>separator(), itemCount: list.length),
          fallback:(context)=> const Center(child: CircularProgressIndicator()) ,);
      },
    );
  }
}