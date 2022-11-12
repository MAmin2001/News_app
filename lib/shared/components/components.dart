import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/layout/todo_app/cubit/cubit.dart';

Widget defaultButton ({
  double width = double.infinity,
  Color background = Colors.blue,
  required String text ,
  required Function function,

})
=> Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: function(),
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),

  ),
);


Widget buildTaskItem(Map model , context)=>Dismissible(
  key: Key(model['id'].toString()) ,
  onDismissed: (direction)
  {
     AppCubit.get(context).deleteFromDataBase(id: model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
         CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.deepPurpleAccent,
          child: Text('${model['time']}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('${model['title']}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:20.0
                ),
              ),
              Text('${model['date']}',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize:15.0
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        IconButton(
            onPressed: ()
            {
                AppCubit.get(context).updateDataBase(status: 'done', id: model['id']);
            },
            icon:const Icon( Icons.check_circle),
            color: Colors.green,
        ),
        const SizedBox(
          width: 10.0,
        ),
        IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateDataBase(status: 'archived', id: model['id']);
            },
            icon:const Icon( Icons.archive_outlined),
            color: Colors.black45,
        ),
      ],
    ),
  ),
);


Widget buildArticleItem(article,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            )
        ),
      ),
      const SizedBox(width: 15.0,),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      )

    ],
  ),
);

Widget myDivider()=>Padding(
  padding: const EdgeInsets.only(
    right: 15.0,
    left: 15.0,
  ),
  child: Container(
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleListBuilder(list,context)=>ConditionalBuilder(
  condition: list.length>0,
  builder:(context)=> ListView.separated(
      itemBuilder:(context,index)=> buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>myDivider(),
      itemCount: list.length
  ),
  fallback: (context)=> const Center(child: const CircularProgressIndicator()),
);