part of 'channel_bloc.dart';

class ChannelEvent extends Equatable {
  const ChannelEvent();

  @override
  List<Object> get props => [];
}

class LoadChannels extends ChannelEvent {
  String toString() => "LoadChannelsEvent";
}
