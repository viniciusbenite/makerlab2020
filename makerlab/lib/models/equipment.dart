class Equipment {
  String ref;
  String family;
  String description;
  String location;
  int totalItems;
  int borrowedItems;
  double price;
  String broken;
  String status;
  String imageUrl;

  Equipment(
      {this.ref,
      this.family,
      this.description,
      this.location,
      this.totalItems,
      this.borrowedItems,
      this.price,
      this.broken,
      this.status,
      this.imageUrl});

  factory Equipment.fromJson(Map<String, dynamic> json) => new Equipment(
        ref: json['ref'],
        family: json['family'],
        description: json['description'],
        location: json['location'],
        totalItems: json['total_items'],
        borrowedItems: json['borrowed_items'],
        price: json['price'],
        broken: json['broken'],
        status: json['status'],
        imageUrl: json['image_file'],
      );

  Map<String, dynamic> toJson() => {
        'ref': ref,
        'family': family,
        'description': description,
        'location': location,
        'total_items': totalItems,
        'borrowed_items': borrowedItems,
        'price': price,
        'broken': broken,
        'status': status,
        'image_file': imageUrl,
      };

  @override
  String toString() {
    return '{ref: $ref, family: $family, description: $description, location: $location, totalItems: $totalItems, borrowedItems: $borrowedItems, price: $price, broken: $broken, status: $status, imageUrl: $imageUrl}';
  }
}
