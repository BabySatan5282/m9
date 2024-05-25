class UrlModel {
  String? viberUrl;
  String? teletUrl;
  String? messenger;

  UrlModel({this.viberUrl, this.teletUrl, this.messenger});

  UrlModel.fromJson(Map<String, dynamic> json) {
    viberUrl = json['viber_url'];
    teletUrl = json['telet_url'];
    messenger = json['messenger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['viber_url'] = viberUrl;
    data['telet_url'] = teletUrl;
    data['messenger'] = messenger;
    return data;
  }
}
