import 'package:flutter/material.dart';

Widget articleItem(article)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(children:
  [
    Container(height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10.0),

        image: DecorationImage(fit: BoxFit.cover,
            image:NetworkImage('${article['urlToImage']}')),
      ),),
    const SizedBox(width: 20.0,),
    Expanded(
      child: Container(height: 120.0,
        child: Column(mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Text('${article['title']}',maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),),
            Text('${article['publishedAt']}'),
          ],),),
    )
  ],),
);
Widget separator()=>const SizedBox(height:10);