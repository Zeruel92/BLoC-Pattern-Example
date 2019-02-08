import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'IP.dart';

class Bloc {
  final BehaviorSubject<IPInfo> _subject = new BehaviorSubject<IPInfo>();

  Bloc() {
    getIP();
  }

  void getIP() async {
    final res = await http.get('http://ipinfo.io/json');
    print(res.body);
    IPInfo info = IPInfo.fromJSON(jsonDecode(res.body));
    _subject.add(info);
  }

  Stream<IPInfo> get ipInfo => _subject.stream;
  void refresh() => getIP();

  void dispose() {
    _subject.close();
  }
}
