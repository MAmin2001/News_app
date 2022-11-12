

// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/modules/Business_screen/business_screen.dart';
import 'package:untitled1/modules/Health_screen/health_screen.dart';
import 'package:untitled1/modules/Science_screen/science_screen.dart';
import 'package:untitled1/modules/Sports_screen/sports_screen.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
   NewsCubit(): super(NewsInitialState());


  static NewsCubit get(context)=> BlocProvider.of(context);

   int currentIndex= 0;
   List<BottomNavigationBarItem> bottomNavItems=
   [
     const BottomNavigationBarItem(
       icon: Icon(Icons.business_center),
       label: 'Business',
     ),
     const BottomNavigationBarItem(
       icon: Icon(Icons.sports_soccer_outlined),
       label: 'Sports',
     ),
     const BottomNavigationBarItem(
       icon: Icon(Icons.science_rounded),
       label: 'Science',
     ),
     const BottomNavigationBarItem(
       icon:  Icon(Icons.health_and_safety_outlined),
       label: 'Health',
     ),
   ];

   List<Widget> screens =[
     const BusinessLayout(),
     const SportsLayout(),
     const ScienceLayout(),
     const HealthLayout(),
   ];



   void changeBottomNav(int index)
   {
     currentIndex=index;
     emit(NewsChangeBottomNavState());
   }


   List<dynamic> business= [];

   void getBusiness()
   {
     emit(NewsGetBusinessLoadingState());
     DioHelper.getData(
         url:'v2/top-headlines' ,
         query: {
           'country':'eg',
           'category':'business',
           'apiKey':'9f622f786d114c40944e3cf4ccde4689',
         }
     ).then((value)
     {
       business=value.data['articles'];
       print(business[0]['title']);
       emit(NewsGetBusinessSuccessState());
     }).catchError((error)
     {
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });
   }

   List<dynamic> sports= [];

   void getSports()
   {
     emit(NewsGetSportsLoadingState());
     DioHelper.getData(
         url:'v2/top-headlines' ,
         query: {
           'country':'eg',
           'category':'sports',
           'apiKey':'9f622f786d114c40944e3cf4ccde4689',
         }
     ).then((value)
     {
       sports=value.data['articles'];
       print(sports[0]['title']);
       emit(NewsGetSportsSuccessState());
     }).catchError((error)
     {
       print(error.toString());
       emit(NewsGetSportsErrorState(error.toString()));
     });
   }

   List<dynamic> science= [];

   void getScience()
   {
     emit(NewsGetScienceLoadingState());
     DioHelper.getData(
         url:'v2/top-headlines' ,
         query: {
           'country':'eg',
           'category':'science',
           'apiKey':'9f622f786d114c40944e3cf4ccde4689',
         }
     ).then((value)
     {
       science=value.data['articles'];
       print(science[0]['title']);
       emit(NewsGetScienceSuccessState());
     }).catchError((error)
     {
       print(error.toString());
       emit(NewsGetScienceErrorState(error.toString()));
     });
   }

   List<dynamic> health= [];

   void getHealth()
   {
     emit(NewsGetHealthLoadingState());
     DioHelper.getData(
         url:'v2/top-headlines' ,
         query: {
           'country':'eg',
           'category':'health',
           'apiKey':'9f622f786d114c40944e3cf4ccde4689',
         }
     ).then((value)
     {
       health=value.data['articles'];
       print(health[0]['title']);
       emit(NewsGetHealthSuccessState());
     }).catchError((error)
     {
       print(error.toString());
       emit(NewsGetHealthErrorState(error.toString()));
     });
   }


   List<dynamic> search= [];

   void getSearch(String value)
   {
     emit(NewsGetSearchLoadingState());
     DioHelper.getData(
         url:'v2/everything' ,
         query: {
           'q':'$value',
           'apiKey':'9f622f786d114c40944e3cf4ccde4689',
         }
     ).then((value)
     {
       search=value.data['articles'];
       // print(search[0]['title']);
       emit(NewsGetSearchSuccessState());
     }).catchError((error)
     {
       print(error.toString());
       emit(NewsGetSearchErrorState(error.toString()));
     });
   }



}


