import 'package:flutter/material.dart';

/// [ChangeNotifier] is required to create a provider.
class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<dynamic> videos = [];

  Future<void> loadNextPage() async {
    //TODO: cargar videos,
    notifyListeners();
  }
}
