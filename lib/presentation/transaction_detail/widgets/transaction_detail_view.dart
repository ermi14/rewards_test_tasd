import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:task_rewards/data/models/transaction_detail.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';
import 'package:task_rewards/presentation/common/spacing.dart';
import 'package:task_rewards/presentation/transaction_detail/widgets/transaction_detail_item.dart';
import 'package:task_rewards/utils/assets_constants.dart';
import 'package:task_rewards/utils/color_constants.dart';

class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({
    required this.transactionDetail,
    Key? key,
  }) : super(key: key);
  final TransactionDetail transactionDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              color: kCardBackGroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  transactionDetail.title.contains('Alpha Bird')
                      ? kBird
                      : kOutflow,
                  height: 60,
                ),
                verticalSpaceTiny,
                Text(
                  transactionDetail.title,
                  style: ktsBodyLarge.copyWith(
                    fontSize: 18,
                    letterSpacing: 0.85,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  '\$${transactionDetail.amount}',
                  style: ktsTitleText.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceLarge,
          Text(
            'Transaction Details',
            style: ktsTitleText,
          ),
          verticalSpaceTiny,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: kCardBackGroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TransactionDetailItem(
                  title: "Status",
                  value: transactionDetail.status,
                ),
                verticalSpaceMedium,
                const Divider(color: Colors.grey),
                verticalSpaceMedium,
                TransactionDetailItem(
                  title: "Date",
                  value:
                      transactionDetail.date.toMoment().format('MMMM DD, YYYY'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
