import 'package:cubit_api/modules/newsApp/newsStates.dart';
import 'package:cubit_api/modules/newsApp/newscubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dio.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getScience()..getSports(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        builder: (context,state){return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(onPressed: (){
            DioHelper.getData(url: 'v2/top-headlines', query:{
              'country':'us',
              'category':'business',
              'apiKey':'ad91fcf23bbd4dd882b50daf3e94f118',
            } ).then((value) {print(value.data['articles']);}).catchError((error){print(error.toString());});
          },
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.data_usage_rounded)),
          body:NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(items:NewsCubit.get(context).items,

          currentIndex: NewsCubit.get(context).currentIndex,
              type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          onTap: (index){
            NewsCubit.get(context).bottomNav(index);
          }),

        );},
        listener: (context,state){},
      ),
    );
  }
}
