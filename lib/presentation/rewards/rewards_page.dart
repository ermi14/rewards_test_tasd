import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rewards/presentation/rewards/widgets/balance_card.dart';
import 'package:task_rewards/presentation/rewards/widgets/card_widget.dart';
import 'package:task_rewards/presentation/rewards/widgets/transaction_list_item.dart';

import '../../data/data_source/rewards_data_source.dart';
import '../../data/repository/rewards_repository.dart';
import '../../utils/color_constants.dart';
import '../../utils/constants.dart';
import '../../utils/string_constants.dart';
import '../blocs/rewards_bloc/rewards_bloc.dart';
import '../common/shared_styles.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = false;

  static RewardsDataSource rewardsDataSource = RewardsDataSource();
  static RewardsRepository rewardsRepository = RewardsRepository(
    rewardsDataSource: rewardsDataSource,
  );
  final rewardsBloc = RewardsBloc(rewardRepository: rewardsRepository);

  @override
  void initState() {
    super.initState();
    rewardsBloc.add(GetRewards());
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      _isAppBarExpanded = _scrollController.hasClients &&
          _scrollController.offset > kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBaseColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: kExpandedAppBarHeight,
            pinned: true,
            elevation: 2,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 12),
              centerTitle: _isAppBarExpanded,
              title: _isAppBarExpanded
                  ? Text(
                      kRewardsPageTitle,
                      style: ktsBodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Text(kRewardsPageTitle, style: ktsTitleText),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                CardWidget(rewardsBloc: rewardsBloc),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    kCurrentBalanceText,
                    style: ktsBodyLarge.copyWith(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                BalanceCard(rewardsBloc: rewardsBloc),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Latest Transactions',
                    style: ktsBodyLarge.copyWith(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<RewardsBloc, RewardsState>(
                  bloc: rewardsBloc,
                  builder: (context, state) {
                    if (state is RewardsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is RewardsSuccess) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color: kCardBackGroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 4),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: state.reward.transactions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TransactionListItem(
                              transaction: state.reward.transactions[index],
                            );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
