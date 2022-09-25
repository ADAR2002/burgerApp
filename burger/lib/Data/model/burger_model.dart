class Burger {
  late int id;
  late String name;
  late String restaurant;
  late String web;
  late String description;
  List<String> ingredients = [];
  List<Addresses> addresses = [];

  Burger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    restaurant = json['restaurant'];
    web = json['web'];
    description = json['description'];
    json['ingredients'].forEach(
      (index) {
        ingredients.add(index);
      },
    );

    json['addresses'].forEach(
      (index) {
        addresses.add(
          Addresses.fromJson(index),
        );
      },
    );
  }
}

class Addresses {
  int? addressId;
  late String? number;
  late String? line1;
  late String? line2;
  late String? postcode;
  late String? country;

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    number = json['number'];
    line1 = json['line1'];
    line2 = json['line2'];
    postcode = json['postcode'];
    country = json['country'];
  }
}
