enum ListingType { rental, purchase }

class Listing {
  Listing({
    required this.id,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.price,
  });

  final int id;
  final String name;
  final ListingType type;
  final double latitude;
  final double longitude;
  final String city;
  final double price;
}
