
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';


var searchController= TextEditingController();

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchController,
                  validator: (String? value)
                  {
                    if(value == null || value.isEmpty)
                    {
                      return'Enter something to search about';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
              Expanded(child: articleListBuilder(NewsCubit.get(context).search, context))

            ],
          ),
        );
      },

    );
  }
}
