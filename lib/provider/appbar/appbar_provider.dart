import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppbarProvider extends ChangeNotifier {
  Ref? ref;
  AppbarProvider({this.ref});

  bool isSearchActive = false;

  toggleSearchActive(bool val) {
    isSearchActive = val;
    notifyListeners();
  }
}

final appbarProvider =
    ChangeNotifierProvider<AppbarProvider>((ref) => AppbarProvider(ref: ref));
