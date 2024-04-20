import 'dart:convert';

import 'package:kiki/models/symbol.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  Future<void> saveSymbols(List<Symbols> symbols) async {
    final prefs = await SharedPreferences.getInstance();
    final symbolsList = symbols.map((symbol) => symbol.toJson()).toList();
    await prefs.setStringList('symbols', symbolsList.cast<String>());
  }

  Future<List<Symbols>> getSymbols() async {
    final prefs = await SharedPreferences.getInstance();
    final symbolsList = prefs.getStringList('symbols') ?? [];
    return symbolsList
        .map((json) => Symbols.fromJson(jsonDecode(json)))
        .toList();
  }
}
