// lib/features/auth/presentation/bloc/auth_state.dart
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState { const AuthInitial(); }
class AuthLoading extends AuthState { const AuthLoading(); }

class AuthAuthenticated extends AuthState {
  final String token;
  const AuthAuthenticated(this.token);
  @override List<Object?> get props => [token];
}

class AuthUnauthenticated extends AuthState { const AuthUnauthenticated(); }

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override List<Object?> get props => [message];
}
