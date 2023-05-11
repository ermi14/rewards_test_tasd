import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_rewards/presentation/blocs/rewards_bloc/rewards_bloc.dart';
import 'package:task_rewards/presentation/common/shared_styles.dart';
import 'package:task_rewards/presentation/common/spacing.dart';
import 'package:task_rewards/utils/assets_constants.dart';
import 'package:task_rewards/utils/color_constants.dart';

import '../../../utils/constants.dart';
import '../../../utils/string_constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.rewardsBloc,
    Key? key,
  }) : super(key: key);

  final RewardsBloc rewardsBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: kgCardBackground,
          ),
        ),
        child: SizedBox(
            height: kCardHeight,
            width: kCardWidth,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    kAlphaLogo,
                    height: kAlphaLogoHeight,
                  ),
                  const Spacer(),
                  BlocBuilder<RewardsBloc, RewardsState>(
                    bloc: rewardsBloc,
                    builder: (context, state) {
                      if (state is RewardsSuccess) {
                        return Text(
                          '****${state.reward.cardNumber}',
                          style: ktsCardNumber,
                        );
                      } else {
                        return Text(
                          '********',
                          style: ktsCardNumber,
                        );
                      }
                    },
                  ),
                  verticalSpaceLarge,
                  Text(
                    kExpirationDateText,
                    style: ktsBodySmall,
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<RewardsBloc, RewardsState>(
                        bloc: rewardsBloc,
                        builder: (context, state) {
                          if (state is RewardsSuccess) {
                            return Text(
                              state.reward.cardExpirationDate,
                              style: ktsBodyLarge.copyWith(
                                color: kLightBaseColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          } else {
                            return const SpinKitWave(
                              size: 22,
                              color: kLightBaseColor,
                            );
                          }
                        },
                      ),
                      SvgPicture.asset(
                        kVisaLogo,
                        height: kVisaLogoHeight,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
