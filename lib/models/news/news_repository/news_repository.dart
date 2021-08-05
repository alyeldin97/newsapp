import 'package:news_app/models/news/news_webservice/news_webservice.dart';

class NewsRepository {
  final NewsWebService? newsWebService;
  NewsRepository(
    this.newsWebService,
  );

  Future getBusinessArticles()async{
    return await newsWebService!.getArticles(category: 'business');
  }

    Future getScienceArticles()async{
    return await newsWebService!.getArticles(category: 'science');
  }

    Future getPoliticsArticles()async{
    return await newsWebService!.getArticles(category: 'politics');
  }

  

    Future getHealthArticles()async{
    return await newsWebService!.getArticles(category: 'health');
  }

    Future getGeneralArticles()async{
    return await newsWebService!.getArticles(category: 'general');
  }
    Future getSportsArticles()async{
    return await newsWebService!.getArticles(category: 'sports');
  }

  Future getSportsSources()async{
    return await newsWebService!.getSources(category: 'sports');
  }

    Future getBusinessSources()async{
    return await newsWebService!.getSources(category: 'business');
  }

    Future getScienceSources()async{
    return await newsWebService!.getSources(category: 'science');
  }

    Future getPoliticsSources()async{
    return await newsWebService!.getSources(category: 'politics');
  }

   Future searchAndGetArticles({String? searchText})async{
    return await newsWebService!.searchAndGetArticles(searchText:searchText );
  }

  

    Future getHealthSources()async{
    return await newsWebService!.getSources(category: 'health');
  }

    Future getGeneralSources()async{
    return await newsWebService!.getSources(category: 'general');
  }
}
