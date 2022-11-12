import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/layout/todo_app/cubit/cubit.dart';
import 'package:untitled1/modules/Search_screen/search_screen.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';
// import 'package:untitled1/layout/todo_app/cubit/cubit.dart';
import 'cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(onPressed: ()
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchLayout()));
              },
                  icon: const Icon(Icons.search)),
              IconButton(onPressed: ()
                {
                 AppCubit.get(context).switchAppColor();
                },
                  icon:Icon(Icons.brightness_4_outlined) ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItems,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
