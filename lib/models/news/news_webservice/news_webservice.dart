import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/models/news/news_data_model/news_api_model.dart';

class NewsWebService {
  Future<List<Article>> getArticles({String? category}) async {
    List<Article> articles = [];

    var url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'apiKey': '4c1ddec4cf8047b7ac31dc12c7142568',
      'category': category,
      
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String?, dynamic>;
      var listOfSources = jsonResponse['articles'];

      listOfSources.forEach((article) {
        articles.add(Article.fromMap(article));
      });
      return articles;
    } else {
      throw Exception(response.body);
    }
  }
Future<List<Article>> searchAndGetArticles({String? searchText}) async {
    List<Article> articles = [];

    var url = Uri.https('newsapi.org', '/v2/top-headlines', {
      'apiKey': '4c1ddec4cf8047b7ac31dc12c7142568',
      'q': searchText,
      
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String?, dynamic>;
      var listOfSources = jsonResponse['articles'];

      listOfSources.forEach((article) {
        articles.add(Article.fromMap(article));
      });
      return articles;
    } else {
      throw Exception(response.body);
    }
  }


  Future<List<String?>> getSources({String? category}) async {
    List<String?> sourcesNames = [];
    var url = Uri.https(
        'newsapi.org', '/v2/top-headlines/sources', {
          
          'apiKey': '4c1ddec4cf8047b7ac31dc12c7142568',
                'category': category,
               
          });

      var response = await http.get(url);
      if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body) as Map<String?,dynamic>;

      jsonResponse['sources'].forEach((source) { 
        sourcesNames.add(Source.fromMap(source).name);
      });

      return sourcesNames;
      }else{
        throw Exception(response.body);
      }
  }
}
