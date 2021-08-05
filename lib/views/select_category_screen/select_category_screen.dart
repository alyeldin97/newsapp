import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/category_item/category_item_model.dart';
import 'package:news_app/view_models/news_bloc/news_bloc.dart';
import 'package:news_app/views/search_screen/search_screen.dart';
import 'package:news_app/views/select_category_screen/widgets/category_item.dart';
import 'package:news_app/views/select_category_screen/widgets/custom_appbar.dart';
import 'package:news_app/views/selected_news_screen/selected_news_screen.dart';

class SelectCategoryScreen extends StatelessWidget {
  SelectCategoryScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = 'select_category_screen';
  late var width;
  late var height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is SportsError) {
          Fluttertoast.showToast(
              msg: state.error!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        var bloc = NewsBloc.get(context);
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customAppBarBuilder(true, height, width, 'News App',(){
                Navigator.pushNamed(context, SearchScreen.ROUTE_NAME);
              }),
              verticalSpace(height * 0.02),
              Container(
                width: width * 0.7,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    'Select Your Category Of Interset',
                    style: TextStyle(
                        fontSize: 26,
                        color: TEXT_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: GridView.builder(
                      itemCount: categoryItemModels.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: width * 0.08,
                        mainAxisSpacing: width * 0.03,
                      ),
                      itemBuilder: (context, index) {
                        var currentItem = categoryItemModels[index];
                        var currentCategoryName =
                            categoryItemModels[index].categoryName;

                        return CategoryItem(
                          categoryItemModel: currentItem,
                          onTap: () async {
                            //TODO COMMUNICATE SELECTED CATEGORY
                            if (currentCategoryName == 'Sports') {
                              bloc.add(SportsPressedEvent());
                            } else if (currentCategoryName == 'Business') {
                              bloc.add(BusinessPressedEvent());
                            } else if (currentCategoryName == 'Science') {
                              bloc.add(SciencePressedEvent());
                            } else if (currentCategoryName == 'Politics') {
                              bloc.add(PoliticsPressedEvent());
                            } else if (currentCategoryName == 'Health') {
                              bloc.add(HealthPressedEvent());
                            } else if (currentCategoryName == 'General') {
                              bloc.add(GeneralPressedEvent());
                            }
                            
                              await Future.delayed(Duration(milliseconds: 2500));                      
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              var tabs = [];
                              tabs.add('All');
                              tabs = tabs + bloc.state.sourcesNames;
                              return SelectedNewsScreen(
                                tabs: tabs,
                                name: currentCategoryName,
                              );
                            }));
                          },
                        );
                      }),
                ),
              ),
              bloc.state is Loading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
