import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heodat/core/base_bloc/base.dart';
import 'package:heodat/src/data/datasource.dart';
import 'package:heodat/src/domain/models/base_mapper.dart';

class HomePageBloc extends Bloc<BaseEvent, BaseState> {
  Room room = Room();
  HomePageBloc() : super(const InitialState()) {
    on<InitDataEvent>((event, emit) async {
      emit(LoadingState());
      await getRoom();
      emit(DataLoadedState(data: room));
    });
    add(InitDataEvent());
  }

  getRoom() async {
    room = await DBManagement.getRoom();
  }
}
