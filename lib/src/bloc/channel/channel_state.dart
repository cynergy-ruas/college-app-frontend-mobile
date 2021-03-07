part of 'channel_bloc.dart';

class ChannelState extends Equatable {
  const ChannelState();

  List get props => [];
}

class ChannelInitialState extends ChannelState {}

class ChannelLoading extends ChannelState {}

class ChannelLoadingComplete extends ChannelState {
  final List<Channel> data;

  const ChannelLoadingComplete({@required this.data});
}

class ChannelLoadingError extends ChannelState {
  final String error;

  const ChannelLoadingError({@required this.error});
}
