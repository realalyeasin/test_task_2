import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.totalRestaurants,
    required this.result,
  });

  int totalRestaurants;
  List<Result> result;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    totalRestaurants: json["Total Restaurants"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Total Restaurants": totalRestaurants,
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.reviews,
    required this.parkinglot,
    required this.location,
    required this.phone,
    required this.averagecost,
    required this.image,
    required this.imageId,
    required this.restauranttype,
    required this.id,
    required this.businessname,
    required this.address,
    required this.menu,
    required this.slug,
    required this.email,
    required this.v,
    required this.foodMenu,
    required this.resultId,
    required this.website,
  });

  int? reviews;
  bool? parkinglot;
  String? location;
  String? phone;
  int? averagecost;
  String? image;
  String? imageId;
  Restauranttype? restauranttype;
  String? id;
  String? businessname;
  String? address;
  String? menu;
  String? slug;
  String? email;
  int? v;
  List<dynamic>? foodMenu;
  String? resultId;
  String? website;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    reviews: json["reviews"],
    parkinglot: json["parkinglot"],
    location: json["location"],
    phone: json["phone"],
    averagecost: json["averagecost"],
    image: json["image"],
    imageId: json["imageId"],
    restauranttype: restauranttypeValues.map[json["restauranttype"]],
    id: json["_id"],
    businessname: json["businessname"],
    address: json["address"],
    menu: json["menu"] == null ? null : json["menu"],
    slug: json["slug"],
    email: json["email"],
    v: json["__v"],
    foodMenu: List<dynamic>.from(json["foodMenu"].map((x) => x)),
    resultId: json["id"],
    website: json["website"] == null ? null : json["website"],
  );

  Map<String, dynamic> toJson() => {
    "reviews": reviews,
    "parkinglot": parkinglot,
    "location": location,
    "phone": phone,
    "averagecost": averagecost,
    "image": image,
    "imageId": imageId,
    "restauranttype": restauranttypeValues.reverse[restauranttype],
    "_id": id,
    "businessname": businessname,
    "address": address,
    "menu": menu == null ? null : menu,
    "slug": slug,
    "email": email,
    "__v": v,
    "foodMenu": List<dynamic>.from(foodMenu!.map((x) => x)),
    "id": resultId,
    "website": website == null ? null : website,
  };
}
enum Restauranttype { CANTEEN, BUKKA, EATERY, JAPANESE }

final restauranttypeValues = EnumValues({
  "bukka": Restauranttype.BUKKA,
  "canteen": Restauranttype.CANTEEN,
  "eatery": Restauranttype.EATERY,
  "japanese": Restauranttype.JAPANESE
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}


