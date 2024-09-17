class InfoModel {
  final String date;
  final String fop;
  final bool status;

  InfoModel({
    required this.date,
    required this.fop,
    required this.status,
  });

  factory InfoModel.fromJson(Map<String, Object?> json) {
    return InfoModel(
      date: json['date'] as String,
      fop: json['FOP'] as String,
      status: json['status'] as bool,
    );
  }
}
