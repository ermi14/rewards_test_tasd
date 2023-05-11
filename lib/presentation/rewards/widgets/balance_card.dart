import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';

import '../../../utils/color_constants.dart';
import '../../blocs/rewards_bloc/rewards_bloc.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.rewardsBloc,
    Key? key,
  }) : super(key: key);
  final RewardsBloc rewardsBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: kCardBackGroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance as of ${Moment.now().format('MMMM DD, YYYY')}',
            style: ktsBodyMedium.copyWith(
              color: kGreyColor.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<RewardsBloc, RewardsState>(
            bloc: rewardsBloc,
            builder: (context, state) {
              if (state is RewardsSuccess) {
                return Text(
                  '\$${state.reward.balance}',
                  style: ktsCardNumber.copyWith(
                    color: kBlackColor,
                    letterSpacing: 0.6,
                  ),
                );
              } else {
                return  Text(
                  '\$###.##',
                  style: ktsCardNumber.copyWith(
                      color: kBlackColor,
                    letterSpacing: 0.6,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
