import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/view_models/news_bloc/news_bloc.dart';
import 'package:news_app/views/selected_news_screen/widgets/news_item.dart';

class SearchScreen extends StatelessWidget {
  late var width;
  late var height;
  static const ROUTE_NAME = 'search_screen';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var bloc = NewsBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter Search Item Here',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (searchText) {
                bloc.add(SearchItemChangedEvent(searchText: searchText));
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.04),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  verticalSpace(height * 0.03),
                  bloc.state is SearchLoading
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                              itemCount: bloc.state.articles!.length,
                              itemBuilder: (context, index) => NewsItem(
                                    article: bloc.state.articles![index],
                                  )),
                        ),
                  state is SearchLoaded && bloc.state.articles!.length == 0
                      ? Text(
                        'No Matches For your Search :(',
                        style:
                            TextStyle(color: PRIMARY_COLOR, fontSize: 22),
                      )
                      : SizedBox(),
                  state is SearchError
                      ? Center(
                          child: Text(
                            'Please Enter Search Keyword above :)',
                            style:
                                TextStyle(color: PRIMARY_COLOR, fontSize: 22),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
