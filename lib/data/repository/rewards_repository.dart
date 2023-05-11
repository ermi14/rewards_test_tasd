import 'package:flutter/foundation.dart';
import 'package:task_rewards/data/data_source/rewards_data_source.dart';
import 'package:task_rewards/data/models/reward.dart';
import 'package:task_rewards/data/models/transaction.dart';
import 'package:task_rewards/data/models/transaction_detail.dart';

class RewardsRepository {
  final RewardsDataSource rewardsDataSource;

  RewardsRepository({required this.rewardsDataSource});

  Future<Reward?> getRewards() async {
    try {
      final response = await rewardsDataSource.getRewards();
      final reward = Reward.fromJson(response);
      return reward;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<Transaction>?> getTransactionList() async {
    try {
      final response = await rewardsDataSource.getTransactionList();
      final transactions = transactionsFromJson(response);
      return transactions;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<TransactionDetail?> getTransactionDetail({required String id}) async {
    try {
      final response = await rewardsDataSource.getTransactionDetail(id: id);
      final transactionDetail = TransactionDetail.fromJson(response);
      return transactionDetail;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}