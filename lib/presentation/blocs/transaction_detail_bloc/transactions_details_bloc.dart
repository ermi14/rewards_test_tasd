import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:task_rewards/data/models/transaction_detail.dart';

import '../../../data/repository/rewards_repository.dart';

part 'transactions_details_event.dart';

part 'transactions_details_state.dart';

class TransactionsDetailsBloc
    extends Bloc<TransactionsDetailsEvent, TransactionsDetailsState> {
  final RewardsRepository rewardRepository;

  TransactionsDetailsBloc({required this.rewardRepository})
      : super(TransactionsDetailsInitial()) {
    on<TransactionsDetailsEvent>((event, emit) async {
      if (event is GetTransactionDetails) {
        emit(TransactionsDetailsLoading());
        try {
          final result = await rewardRepository.getTransactionDetail(
            id: event.id,
          );
          if (result != null) {
            emit(TransactionsDetailsSuccess(result));
          } else {
            emit(TransactionsDetailsError());
          }
        } catch (e) {
          emit(TransactionsDetailsError());
        }
      }
    });
  }
}
