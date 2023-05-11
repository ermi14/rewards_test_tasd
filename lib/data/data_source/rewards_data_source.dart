import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:task_rewards/utils/api_helper.dart';
import '../../utils/string_constants.dart';

class RewardsDataSource {
  Future<dynamic> getRewards() async {
    try {
      final response = await ApiHelper.getRequest(kRewardsEndPoint);
      final parsedResponse = jsonDecode(response.body);
      return parsedResponse;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<dynamic> getTransactionList() async {
    try {
      final response = await ApiHelper.getRequest(kTransactionsEndPoint);
      final parsedResponse = jsonDecode(response.body);
      return parsedResponse;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<dynamic> getTransactionDetail({required String id}) async {
    try {
      final response = await ApiHelper.getRequest(
        '$kTransactionDetailEndPoint$id',
      );
      final parsedResponse = jsonDecode(response.body);
      return parsedResponse;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
