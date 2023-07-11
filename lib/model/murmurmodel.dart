class MurmurModel {
  String? status;
  String? classification;

  MurmurModel({this.status, this.classification});

  MurmurModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    classification = json['classification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['classification'] = classification;
    return data;
  }
}