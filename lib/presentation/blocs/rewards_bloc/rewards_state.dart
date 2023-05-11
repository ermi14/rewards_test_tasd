part of 'rewards_bloc.dart';

@immutable
abstract class RewardsState {}

class RewardsInitial extends RewardsState {}

class RewardsLoading extends RewardsState {}

class RewardsSuccess extends RewardsState {
  final Reward reward;

  RewardsSuccess(this.reward);

}

class RewardsError extends RewardsState {}
