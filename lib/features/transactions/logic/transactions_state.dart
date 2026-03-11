part of 'transactions_cubit.dart';

class TransactionsState {
  final RequestState state;

  TransactionsState({this.state = RequestState.initial});

  TransactionsState copyWith({
    RequestState? state,
  }) {
    return TransactionsState(
      state: state ?? this.state,
    );
  }
}
