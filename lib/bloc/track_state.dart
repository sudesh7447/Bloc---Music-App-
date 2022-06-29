import 'package:equatable/equatable.dart';

import '../data/ListUrl_model.dart';

abstract class TrackState extends Equatable {}

class TrackInitialState extends TrackState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TrackLoadingState extends TrackState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TrackLoadedState extends TrackState {
  late List<TrackList>? list;
  TrackLoadedState({required this.list});

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}

class TrackErrorState extends TrackState {
  late String msg;
  TrackErrorState({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
