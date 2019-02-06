class IPInfo {
  String ip;
  String hostname;
  String region;
  String city;
  String country;
  String loc;
  String postal;
  String org;

  IPInfo.fromJSON(Map<String, dynamic> json)
      : ip = json['ip'],
        hostname = json['hostname'],
        region = json['region'],
        city = json['city'],
        country = json['country'],
        loc = json['loc'],
        postal = json['postal'],
        org = json['org'];
}
