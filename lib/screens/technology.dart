import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NwesBloc/cubit/newscubit_cubit.dart';
import '../widgets/shardwidget.dart';
import 'detailsscreen.dart';

class TechnologyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewscubitCubit, NewscubitState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  ConditionalBuilder(
            condition: NewscubitCubit.get(context).technology != null, 
            builder: (context) {
              return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context, index) => customnews(
              NewscubitCubit.get(context).technology!.articles![index].urlToImage ,
              NewscubitCubit.get(context).technology!.articles![index].title,
              NewscubitCubit.get(context).technology!.articles![index].publishedAt ,
              (){
                 Navigator.push(context, MaterialPageRoute(builder:(context) => DetailsScreen(
                  NewscubitCubit.get(context).technology!.articles![index].urlToImage,
                  NewscubitCubit.get(context).technology!.articles![index].title,
                  NewscubitCubit.get(context).technology!.articles![index].author,
                  NewscubitCubit.get(context).technology!.articles![index].description,
                 )));
              }
            ) , 
            separatorBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                height: 3,
                width: double.infinity,
                color: Colors.grey,
              ), 
            itemCount: NewscubitCubit.get(context).technology!.articles!.length
            );
            }, 
            fallback: (context) => Center(child: CircularProgressIndicator()),
            );
     
      },
    );
  }
}