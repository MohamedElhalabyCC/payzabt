import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/transactions/data/repo/transactions_repo.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionsRepo _transactionsRepo;
  TransactionsCubit(this._transactionsRepo) : super(TransactionsState());

  Future<void> getTransactionsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _transactionsRepo.getTransactionsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}