import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/news_layout.dart';
import 'package:untitled1/layout/todo_app/cubit/cubit.dart';
import 'package:untitled1/layout/todo_app/cubit/states.dart';
import 'package:untitled1/shared/network/local/cache_helper.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';
// import 'package:untitled1/layout/todo_app/todo_Layout.dart';
// import 'package:untitled1/modules/bmi_result/BmiResult.dart';
// import 'package:untitled1/modules/bmi/BmiScreen.dart';
// import 'package:untitled1/modules/home/HomeScreen.dart';
// import 'package:untitled1/modules/login/LoginScreen.dart';
// import 'package:untitled1/modules/messenger/Messenger.dart';
import 'package:untitled1/shared/observer.dart';
// import 'modules/ls_draft/LSdraft1.dart';
// import 'modules/users/UsersScreen.dart';

late bool? isDark;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  isDark = CacheHelper.getBool(key: 'isDark');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()..getHealth()),
        BlocProvider(
        create: (BuildContext context)=>AppCubit()..switchAppColor(fromShared: isDark)),
      ],
      child:
         BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
           return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const NewsLayout(),
              theme: ThemeData(
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  actionsIconTheme:IconThemeData(
                    color: Colors.black,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black
                  ),
                  systemOverlayStyle:SystemUiOverlayStyle(
                      statusBarColor: Colors.red,
                      statusBarIconBrightness: Brightness.light
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black
                      )
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    elevation: 30.0,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    selectedLabelStyle: TextStyle(
                        color: Colors.red
                    )
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Colors.black
                    )
                ),
              ),
              darkTheme:ThemeData(
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: HexColor('292A2E'),
                appBarTheme:  AppBarTheme(
                  backwardsCompatibility: false,
                  actionsIconTheme:IconThemeData(
                    color: Colors.white,
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  ),
                  systemOverlayStyle:SystemUiOverlayStyle(
                      statusBarColor: HexColor('292A2E'),
                      statusBarIconBrightness: Brightness.light
                  ),
                  color: HexColor('292A2E'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white
                  ),
                ),
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                    selectedItemColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    elevation: 30.0,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: HexColor('292A2E'),
                    selectedLabelStyle: TextStyle(
                      color: Colors.grey,
                    )
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Colors.white
                    )
                ),
              ),
              themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            );
          },
        ),
      );


  }
}






