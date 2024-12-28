import 'dart:developer';

import 'package:famcards/core/error/exceptions.dart';
import 'package:famcards/features/cards/data/datasources/card_local_data_source.dart';
import 'package:famcards/features/cards/data/datasources/card_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRemoteDataSource remoteDataSource;
  final CardLocalDataSource localDataSource;

  CardCubit({
    required this.remoteDataSource,
    required this.localDataSource,
  }) : super(CardInitial());

  // Fetch cards from remote data source
  Future<void> fetchCards() async {
    emit(CardLoading());
    try {
      final cards = await remoteDataSource.getCards();
      final dismissedCards = localDataSource.getDismissedCards();
      // final remindLaterCards = localDataSource.getRemindLaterCards();

      // Filter out dismissed cards
      final filteredCards = cards
          .where((card) => !dismissedCards.contains(card.id.toString()))
          .toList();

      if (filteredCards.isEmpty) {
        emit(NoCardsAvailable());
      } else {
        emit(CardLoaded(cards: filteredCards));
      }
    } on ServerException catch (e, stackTrace) {
      log("Error: ${e.toString()}, stackTrace: $stackTrace");
      emit(CardError(message: e.message));
    } catch (e, stackTrace) {
      log("Error: ${e.toString()}, stackTrace: $stackTrace");
      emit(CardError(message: e.toString()));
    }
  }

  // Handle "Dismiss Now" action
  Future<void> dismissCard(String cardId) async {
    localDataSource.saveCardState(cardId: cardId, state: 'dismissed');
    await fetchCards();
  }

  // Handle "Remind Later" action
  Future<void> remindLaterCard(String cardId) async {
    localDataSource.saveCardState(cardId: cardId, state: 'remind_later');
    await fetchCards();
  }

  // Refresh cards
  Future<void> refreshCards() async {
    await fetchCards();
  }
}
