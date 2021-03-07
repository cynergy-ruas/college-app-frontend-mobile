import 'dart:async';
import 'package:frontend/src/model/channel.dart';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'channel_state.dart';
part 'channel_event.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelInitialState());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is LoadChannels) {
      yield ChannelLoading();

      try {
        await Future.delayed(Duration(seconds: 2));
        // TODO: load the channels
        yield ChannelLoadingComplete(data: exampleChannels);
      } catch (error) {
        yield ChannelLoadingError(error: error.toString());
      }
    }
  }
}
