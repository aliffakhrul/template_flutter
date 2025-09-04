import 'package:mobile_projek/features/users/domain/model/user_model.dart';

enum UsersStatus { initial, loading, success, error }

class UsersState {
  final UsersStatus status;
  final String? errorMessage;

  final List<UserModel>? users;

  UsersState._({required this.status, this.errorMessage, this.users});

  factory UsersState.initial() => UsersState._(status: UsersStatus.initial);

  UsersState copyWith({
    UsersStatus? status,
    String? errorMessage,
    List<UserModel>? users,
  }) {
    return UsersState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }
}
