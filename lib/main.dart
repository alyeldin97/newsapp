import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/news/news_repository/news_repository.dart';
import 'package:news_app/view_models/news_bloc/news_bloc.dart';
import 'package:news_app/views/search_screen/search_screen.dart';
import 'package:news_app/views/select_category_screen/select_category_screen.dart';
import 'package:news_app/views/selected_news_screen/selected_news_screen.dart';

import 'models/news/news_webservice/news_webservice.dart';
import 'views/select_category_screen/select_category_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var newswebservice = NewsWebService();
  newswebservice.getSources(category: 'sports');
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepository(NewsWebService())),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(primaryColor: PRIMARY_COLOR),
        debugShowCheckedModeBanner: false,
        routes: {
          SelectCategoryScreen.ROUTE_NAME: (context) => SelectCategoryScreen(),
          SelectedNewsScreen.ROUTE_NAME: (context) => SelectedNewsScreen(),
          SearchScreen.ROUTE_NAME: (context) => SearchScreen(),
        },
        initialRoute: SelectCategoryScreen.ROUTE_NAME,
      ),
    );
  }
}
