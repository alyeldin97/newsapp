part of 'news_bloc.dart';

@immutable
abstract class NewsState {
  final List<Article>? articles = [];
  final List<String?> sourcesNames = [];
}

class NewsInitial extends NewsState {}

class Loading extends NewsState {}

class BusinessLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;

  BusinessLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class BusinessError extends NewsState {}

class SportsLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;
  SportsLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class SportsError extends NewsState {
  String? error;
  SportsError({
    required this.error,
  });
}

class PoliticsLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;

  PoliticsLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class PoliticsError extends NewsState {}

class HealthLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;

  HealthLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class HealthError extends NewsState {}

class GeneralLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;

  GeneralLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class GeneralError extends NewsState {}

class ScienceLoaded extends NewsState {
  List<Article>? articles;
  List<String?> sourcesNames;

  ScienceLoaded({
    this.articles,
    required this.sourcesNames,
  });
}

class ScienceError extends NewsState {}

class SearchLoaded extends NewsState {
  List<Article>? articles;
  SearchLoaded({
    required this.articles,
  });
}

class SearchLoading extends NewsState {}

class SearchError extends NewsState {
  String? error;
  SearchError({
    this.error,
  });
}
