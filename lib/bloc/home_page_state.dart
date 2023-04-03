part of 'home_page_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeInitial extends HomeScreenState {}

// User data loading state
class UserLoadingState extends HomeScreenState {
  final bool isLoading;
  UserLoadingState({required this.isLoading});
}

// User data error loading state
class UserErroState extends HomeScreenState {
  final int? statusCode;
  final String error;
  UserErroState(this.error, this.statusCode);
}
