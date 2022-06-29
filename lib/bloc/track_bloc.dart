import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app_work/bloc/track_event.dart';
import 'package:music_app_work/bloc/track_state.dart';
import 'package:music_app_work/data/ListUrl_model.dart';
import 'package:music_app_work/data/repo/list_song_repo.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackRepository repository;

  TrackBloc(TrackState initialState, this.repository)
      : super(TrackInitialState()) {
    // ignore: void_checks
    on<FetchTrackEvent>((event, emit) async* {
      //TODO
      // ignore: unnecessary_type_check

      if (event is FetchTrackEvent) {
        yield TrackLoadingState();
        try {
          List<TrackList>? tracks = await repository.getTracks();
          yield TrackLoadedState(list: tracks);
        } catch (e) {
          yield TrackErrorState(msg: e.toString());
        }
      }
    });
  }
}
