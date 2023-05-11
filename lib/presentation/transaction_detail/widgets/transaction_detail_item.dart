import 'package:flutter/material.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';
import 'package:task_rewards/utils/color_constants.dart';

class TransactionDetailItem extends StatelessWidget {
  final String title;
  final String value;

  const TransactionDetailItem(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ktsBodyLarge,
        ),
        Text(
          value,
          style: ktsBodyLarge.copyWith(
            color: kGreyColor,
          ),
        )
      ],
    );
  }
}
