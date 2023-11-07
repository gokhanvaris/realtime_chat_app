import 'package:equatable/equatable.dart';

final class AppState extends Equatable {
  const AppState({this.message = '', this.isLoading = false});

  final String message;
  final bool isLoading;
  @override
  List<Object> get props => [message, isLoading];

  AppState copyWith({
    String? message,
    bool? isLoading,
  }) {
    return AppState(
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
