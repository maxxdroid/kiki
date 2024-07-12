import 'dart:async';
import 'dart:convert';

import 'package:kiki/models/symbol.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  Future<void> saveSymbols(List<Symbols> symbols) async {
    final prefs = await SharedPreferences.getInstance();
    final symbolsList =
        symbols.map((symbol) => jsonEncode(symbol.toJson())).toList();
    await prefs.setStringList('symbols', symbolsList);
  }

  Future<List<Symbols>> getSymbols() async {
    final prefs = await SharedPreferences.getInstance();
    final symbolsList = prefs.getStringList('symbols') ?? [];
    return symbolsList
        .map((json) => Symbols.fromJson(jsonDecode(json)))
        .toList();  
  }

  // Future<List<Symbols>> saveSymbol (Symbols symbol) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final symbolsList = prefs.getStringList('symbols') ?? [];
  //   List<Symbols> list = symbolsList
  //       .map((json) => Symbols.fromJson(jsonDecode(json)))
  //       .toList();
  //   list.add(symbol);
  //   saveSymbols(list);
  //   return list;
  // }

  static String userIDKey = 'UserIdKey';

  Future<bool> saveUserID(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIDKey, getUserId);
  }

  //get

  Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIDKey);
  }
}
