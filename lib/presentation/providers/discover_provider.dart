import 'package:flutter/material.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';

/// [ChangeNotifier] is required to create a provider.
class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<LocalVideoModel> videos = [];

  Future<void> loadNextPage() async {
    //TODO: cargar videos,
    notifyListeners();
  }
}
