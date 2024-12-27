import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CardLocalDataSource {
  Future<void> saveCardState({required String cardId, required String state});
  String? getCardState({required String cardId});
  Future<void> clearCardState({required String cardId});
  List<String> getDismissedCards();
  List<String> getRemindLaterCards();
}

class CardLocalDataSourceImpl implements CardLocalDataSource {
  final SharedPreferences sharedPreferences;

  CardLocalDataSourceImpl({required this.sharedPreferences});

  // Save card state (Dismissed or Remind Later)
  @override
  Future<void> saveCardState(
      {required String cardId, required String state}) async {
    await sharedPreferences.setString(cardId, state);
  }

  // Get card state (Dismissed or Remind Later)
  @override
  String? getCardState({required String cardId}) {
    return sharedPreferences.getString(cardId);
  }

  // Clear card state (For example when a card is marked as active again)
  @override
  Future<void> clearCardState({required String cardId}) async {
    await sharedPreferences.remove(cardId);
  }

  // Get all dismissed cards
  @override
  List<String> getDismissedCards() {
    final keys = sharedPreferences.getKeys();
    return keys
        .where((key) => sharedPreferences.getString(key) == 'dismissed')
        .toList();
  }

  // Get all cards marked for reminder
  @override
  List<String> getRemindLaterCards() {
    final keys = sharedPreferences.getKeys();
    return keys
        .where((key) => sharedPreferences.getString(key) == 'remind_later')
        .toList();
  }
}
