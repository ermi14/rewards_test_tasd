import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rewards/data/data_source/rewards_data_source.dart';
import 'package:task_rewards/data/repository/rewards_repository.dart';
import 'package:task_rewards/presentation/blocs/rewards_bloc/rewards_bloc.dart';
import 'package:task_rewards/presentation/blocs/transaction_detail_bloc/transactions_details_bloc.dart';
import 'package:task_rewards/presentation/common/themes/light_theme.dart';
import 'package:task_rewards/presentation/rewards/rewards_page.dart';
import 'package:task_rewards/utils/string_constants.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      RewardsDataSource rewardsDataSource = RewardsDataSource();
      RewardsRepository rewardsRepository = RewardsRepository(
        rewardsDataSource: rewardsDataSource,
      );

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RewardsBloc(
                rewardRepository: rewardsRepository,
              ),
            ),
            BlocProvider(
              create: (context) => TransactionsDetailsBloc(
                rewardRepository: rewardsRepository,
              ),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      debugPrint('/// $error');
      debugPrint('/// $stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const RewardsPage(),
    );
  }
}
