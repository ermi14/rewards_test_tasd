part of 'transactions_details_bloc.dart';

@immutable
abstract class TransactionsDetailsState {}

class TransactionsDetailsInitial extends TransactionsDetailsState {}

class TransactionsDetailsLoading extends TransactionsDetailsState {}

class TransactionsDetailsSuccess extends TransactionsDetailsState {
  final TransactionDetail transactionDetail;

  TransactionsDetailsSuccess(this.transactionDetail);
}

class TransactionsDetailsError extends TransactionsDetailsState {}
