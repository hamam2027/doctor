class CheckHeartModel {
  String? status;
  String? classification;

  CheckHeartModel({this.status, this.classification});

  CheckHeartModel.fromJson(Map<String, dynamic> json) {
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