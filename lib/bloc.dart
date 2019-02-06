import 'package:rxdart/rxdart.dart';
import 'IP.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bloc {
  final BehaviorSubject<IPInfo> subject = new BehaviorSubject<IPInfo>();

  Bloc() {
    getIP();
  }

  void getIP() async {
    final res = await http.get('http://ipinfo.io/json');
    print(res.body);
    IPInfo info = IPInfo.fromJSON(jsonDecode(res.body));
    subject.add(info);
  }

  void dispose() {
    subject.close();
  }
}
