import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdemo/get_user_model.dart';
import 'package:testdemo/model/resource_model.dart';
import 'package:testdemo/services.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeInitial());

  List<UserModel> userList = [];

  @override
  Stream<HomeScreenState> mapEventToState(HomeScreenEvent event) async* {
    if (event is LoadUserEvent) {
      yield UserLoadingState(isLoading: true);
      Resource resource = await HomeScreenRepository().getUserData(event);
      if (resource.data != null) {
        userList = resource.data;
      } else {
        yield UserErroState(resource.error ?? '', resource.statusCode);
      }
      yield UserLoadingState(isLoading: false);
    }
  }
}
