part of 'transactions_details_bloc.dart';

@immutable
abstract class TransactionsDetailsEvent {}

class GetTransactionDetails extends TransactionsDetailsEvent {
  final String id;

  GetTransactionDetails({required this.id});
}
