import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';

import '../../layout/news_app/cubit/cubit.dart';

class HealthLayout extends StatelessWidget {
  const HealthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).health;
        return articleListBuilder(list,context);
      },
    );
  }
  }

