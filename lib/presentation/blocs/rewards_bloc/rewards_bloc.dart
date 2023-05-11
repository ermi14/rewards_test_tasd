import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_rewards/data/models/reward.dart';

import '../../../data/repository/rewards_repository.dart';

part 'rewards_event.dart';

part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final RewardsRepository rewardRepository;

  RewardsBloc({required this.rewardRepository}) : super(RewardsInitial()) {
    on<RewardsEvent>((event, emit) async {
      if (event is GetRewards) {
        emit(RewardsLoading());
        try {
          final result = await rewardRepository.getRewards();
          if(result != null) {
            emit(RewardsSuccess(result));
          } else {
            emit(RewardsError());
          }
        } catch(e) {
          emit(RewardsError());
        }
      }
    });
  }
}
