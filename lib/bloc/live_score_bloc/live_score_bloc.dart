import 'package:hcricket/bloc/bloc_exports.dart';

class LiveScoreBloc extends Bloc<LiveScoreEvent, LiveScoreState> {
  LiveScoreRepository liveScoreRepository;

  LiveScoreBloc({required this.liveScoreRepository})
      : super(const LiveScoreState(liveScoreList: ApiResponse.loading())) {
    on<GetLiveScore>(allNewsList);
    on<UpdateCarouselIndex>(_onUpdateCarouselIndex);
  }

  Future<void> allNewsList(
      GetLiveScore event, Emitter<LiveScoreState> emit) async {
    await liveScoreRepository.getLiveScroreApi().then((value) {
      emit(state.copyWith(liveScoreList: ApiResponse.completed(value)));
    });
  }

  void _onUpdateCarouselIndex(
      UpdateCarouselIndex event, Emitter<LiveScoreState> emit) {
    emit(state.copyWith(currentIndex: event.newIndex));
  }
}
// live_score_bloc.dart
// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hcricket/bloc/live_score_bloc/live_score_event.dart';
// import 'package:hcricket/bloc/live_score_bloc/live_score_state.dart';
// import 'package:hcricket/data/response/api_response.dart';
// import 'package:hcricket/repositery/match_repository.dart';

// class LiveScoreBloc extends Bloc<LiveScoreEvent, LiveScoreState> {
//   final LiveScoreRepository liveScoreRepository;
//   StreamSubscription? _liveScoreSubscription;

//   LiveScoreBloc({required this.liveScoreRepository})
//       : super(const LiveScoreState(liveScoreList: ApiResponse.loading())) {
//     // Subscribe to the live score stream from the repository.
//     _liveScoreSubscription =
//         liveScoreRepository.getLiveScoreStream().listen((liveScoreModel) {
//       add(UpdateLiveScore(liveScoreModel));
//     }, onError: (error) {
//       // Optionally, handle errors by emitting an error state
//       // emit(state.copyWith(liveScoreList: ApiResponse.error(error)));
//     });

//     on<UpdateLiveScore>(_onUpdateLiveScore);
//     on<UpdateCarouselIndex>(_onUpdateCarouselIndex);
//     // You may still want to handle GetLiveScore manually.
//     on<GetLiveScore>(_onGetLiveScore);
//   }

//   Future<void> _onGetLiveScore(
//       GetLiveScore event, Emitter<LiveScoreState> emit) async {
//     final liveScoreModel = await liveScoreRepository.getLiveScroreApi();
//     emit(state.copyWith(liveScoreList: ApiResponse.completed(liveScoreModel)));
//   }

//   void _onUpdateLiveScore(UpdateLiveScore event, Emitter<LiveScoreState> emit) {
//     emit(state.copyWith(
//         liveScoreList: ApiResponse.completed(event.liveScoreModel)));
//   }

//   void _onUpdateCarouselIndex(
//       UpdateCarouselIndex event, Emitter<LiveScoreState> emit) {
//     emit(state.copyWith(currentIndex: event.newIndex));
//   }

//   @override
//   Future<void> close() {
//     _liveScoreSubscription?.cancel();
//     return super.close();
//   }
// }
