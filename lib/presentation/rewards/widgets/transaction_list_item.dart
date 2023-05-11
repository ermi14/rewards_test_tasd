import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:task_rewards/data/models/transaction.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';
import 'package:task_rewards/presentation/common/spacing.dart';
import 'package:task_rewards/presentation/transaction_detail/transaction_detail_page.dart';
import 'package:task_rewards/utils/assets_constants.dart';
import 'package:task_rewards/utils/color_constants.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    required this.transaction,
    Key? key,
  }) : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetailPage(
              id: transaction.id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          transaction.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (transaction.title.contains('Alpha')) ...[
                          horizontalSpaceTiny,
                          SvgPicture.asset(
                            kBird,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.date.toMoment().format('MMMM DD, YYYY'),
                      style: ktsBodySmall.copyWith(
                        color: kGreyColor,
                        fontSize: 12,
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      transaction.amount.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: Colors.grey,
                      //  weight: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
