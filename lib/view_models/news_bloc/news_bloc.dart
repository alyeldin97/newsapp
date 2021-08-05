import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/news/news_data_model/news_api_model.dart';
import 'package:news_app/models/news/news_repository/news_repository.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial());
  static NewsBloc get(context) {
    return BlocProvider.of(context);
  }

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is BusinessPressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getBusinessArticles();
        var sourcesNames = await newsRepository.getBusinessSources();
        yield BusinessLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield BusinessError();
      }
    } else if (event is SciencePressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getScienceArticles();
        var sourcesNames = await newsRepository.getScienceSources();

        yield ScienceLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield ScienceError();
      }
    } else if (event is PoliticsPressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getPoliticsArticles();
        var sourcesNames = await newsRepository.getPoliticsSources();

        yield PoliticsLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield PoliticsError();
      }
    } else if (event is GeneralPressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getGeneralArticles();
        var sourcesNames = await newsRepository.getGeneralSources();

        yield GeneralLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield GeneralError();
      }
    } else if (event is HealthPressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getHealthArticles();
        var sourcesNames = await newsRepository.getHealthSources();

        yield HealthLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield HealthError();
      }
    } else if (event is SportsPressedEvent) {
      yield Loading();
      try {
        var articles = await newsRepository.getSportsArticles();
        var sourcesNames = await newsRepository.getSportsSources();

        yield SportsLoaded(articles: articles, sourcesNames: sourcesNames);
      } catch (e) {
        yield SportsError(error:e.toString());
      }
    }else if (event is SearchItemChangedEvent) {
      yield SearchLoading();
      try{  
        var articles = await newsRepository.searchAndGetArticles(searchText: event.searchText);
        yield SearchLoaded(articles: articles);
      }catch(e){
        yield SearchError(error: e.toString());
      }
    }
  }
}
