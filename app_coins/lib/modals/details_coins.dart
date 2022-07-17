class DetailsCoin {
  String? about = "";
  double? fee = 0.0;

  DetailsCoin({
    required this.about,
    required this.fee,
  });

  factory DetailsCoin.fromJson(Map<String, dynamic> detailsCoinsJson) =>
      DetailsCoin(
        about: detailsCoinsJson['about'],
        fee: detailsCoinsJson['fee'],
      );
}
