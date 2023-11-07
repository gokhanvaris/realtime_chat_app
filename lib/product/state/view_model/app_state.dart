import 'package:equatable/equatable.dart';

final class AppState extends Equatable {
  const AppState({this.messagesListState, this.isLoading = false});

  final List<String>? messagesListState;
  final bool isLoading;
  @override
  List<Object> get props => [messagesListState ?? '', isLoading];

  AppState copyWith({
    List<String>? messagesListState,
    bool? isLoading,
  }) {
    return AppState(
      messagesListState: messagesListState ?? messagesListState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
