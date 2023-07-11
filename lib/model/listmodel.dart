class ListModel {
  List<Data>? data;

  ListModel({this.data});

  ListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? patientId;
  String? patientName;
  String? patientAge;
  String? patientPhone;
  String? classification;
  String? description;
  String? ownerid;

  Data(
      {this.patientId,
      this.patientName,
      this.patientAge,
      this.patientPhone,
      this.classification,
      this.description,
      this.ownerid});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    patientName = json['patientName'];
    patientAge = json['patientAge'];
    patientPhone = json['patientPhone'];
    classification = json['classification'];
    description = json['description'];
    ownerid = json['ownerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['patientName'] = patientName;
    data['patientAge'] = patientAge;
    data['patientPhone'] = patientPhone;
    data['classification'] = classification;
    data['description'] = description;
    data['ownerid'] = ownerid;
    return data;
  }
}
