import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/view_models/news_bloc/news_bloc.dart';
import 'package:news_app/views/select_category_screen/widgets/custom_appbar.dart';
import 'package:news_app/views/selected_news_screen/widgets/news_item.dart';
import 'package:news_app/views/selected_news_screen/widgets/tab_item.dart';

class SelectedNewsScreen extends StatefulWidget {
  static const ROUTE_NAME = 'selected_news_screen';
  final tabs;
  final String? name;

  SelectedNewsScreen({this.tabs, this.name});
  @override
  State<SelectedNewsScreen> createState() => _SelectedNewsScreenState();
}

class _SelectedNewsScreenState extends State<SelectedNewsScreen>
    with SingleTickerProviderStateMixin {
  late var width;
  late var height;

  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: widget.tabs.length);
    tabController!.addListener(setStateOnIndexChange);
  }

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
        List<String?> tabs = ['All'];
        tabs = tabs + bloc.state.sourcesNames;

        return Scaffold(
          body: bloc.state is Loading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customAppBarBuilder(false, height, width, widget.name,(){}),
                    verticalSpace(height * 0.02),
                    TabBar(
                      onTap: (int x) {
                        setState(() {});
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      controller: tabController,
                      tabs: tabs.map((sourceName) {
                        var index = tabs.indexOf(sourceName);
                        if (index == tabController!.index) {
                          return TabItem(
                            sourceName: sourceName,
                            isSelected: true,
                          );
                        } else {
                          return TabItem(
                            sourceName: sourceName,
                          );
                        }
                      }).toList(),
                    ),
                    verticalSpace(height * 0.02),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: tabs.map((tab) {
                        List<dynamic>? filteredList = [];
                        if (tab == 'All') {
                          filteredList = state.articles;
                          filteredList!.forEach((element) {});
                        } else {
                          filteredList = state.articles!
                              .where((article) => article.source!.name == tab)
                              .toList();
                        }
                        return filteredList.isEmpty
                            ? const Center(
                                child: Text('Nothing to show for today',
                                    style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontSize: 30,
                                    )))
                            : ListView.builder(
                                itemCount: filteredList!.length,
                                itemBuilder: (context, index) => NewsItem(
                                      article: filteredList![index],
                                    ));
                      }).toList(),
                    )),
                  ],
                ),
        );
      },
    );
  }

  void setStateOnIndexChange() {
    setState(() {});
  }
}
