part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class SportsPressedEvent extends NewsEvent {}

class BusinessPressedEvent extends NewsEvent {}

class PoliticsPressedEvent extends NewsEvent {}

class HealthPressedEvent extends NewsEvent {}

class GeneralPressedEvent extends NewsEvent {}

class SciencePressedEvent extends NewsEvent {}

class SearchItemChangedEvent extends NewsEvent {
  String? searchText;
  SearchItemChangedEvent({
    required this.searchText,
  });

}
