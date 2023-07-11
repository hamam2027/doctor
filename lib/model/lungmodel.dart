class LungModel {
  String? status;
  String? classification;

  LungModel({this.status, this.classification});

  LungModel.fromJson(Map<String, dynamic> json) {
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
