import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rewards/presentation/blocs/transaction_detail_bloc/transactions_details_bloc.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';
import 'package:task_rewards/presentation/transaction_detail/widgets/transaction_detail_view.dart';
import 'package:task_rewards/utils/color_constants.dart';

import '../../data/data_source/rewards_data_source.dart';
import '../../data/repository/rewards_repository.dart';
import '../../utils/string_constants.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  static RewardsDataSource rewardsDataSource = RewardsDataSource();
  static RewardsRepository rewardsRepository = RewardsRepository(
    rewardsDataSource: rewardsDataSource,
  );
  final transactionDetailsBloc = TransactionsDetailsBloc(
    rewardRepository: rewardsRepository,
  );

  @override
  void initState() {
    super.initState();
    transactionDetailsBloc.add(
      GetTransactionDetails(id: widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBaseColor,
      body: BlocBuilder<TransactionsDetailsBloc, TransactionsDetailsState>(
        bloc: transactionDetailsBloc,
        builder: (context, state) {
          if(state is TransactionsDetailsSuccess) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: kLightBaseColor,
                  pinned: true,
                  leading: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  leadingWidth: 24,
                  centerTitle: false,
                  elevation: 1,
                  forceElevated: true,
                  title: Text(
                    kRewardsPageTitle,
                    style: ktsBodyLarge.copyWith(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      TransactionDetailView(
                        transactionDetail: state.transactionDetail,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
