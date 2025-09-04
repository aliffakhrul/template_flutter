import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_projek/features/users/domain/repository/user_repository.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_event.dart';
import 'package:mobile_projek/features/users/presentations/bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState>{
  final UserRepository userRepository;

  UsersBloc({required this.userRepository}): super(UsersState.initial()){
    on<GetUsersEvent>(onGetUsersEvent);
  }

  Future onGetUsersEvent(GetUsersEvent event, Emitter emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    try{
      var result = await userRepository.getUsers();
      emit(state.copyWith(status: UsersStatus.success, users: result));
    }
    catch(e){
      emit(state.copyWith(status: UsersStatus.error, errorMessage: e.toString()));
    }
  }
}