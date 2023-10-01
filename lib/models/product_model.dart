
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
   String image;
    String id;
    String name;
    double price;
    String description;
     String status;
     bool isFavourite;

     int? qty;
   

    ProductModel({
      required this.image,
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.status,
        required this.isFavourite,
        this.qty,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      image: json["image"],
        id: json["id"],
        name: json["name"],
        price: double.parse(json["price"].toString()) ,
        description: json["description"],
        qty: json["qty"],
        status: json["status"],
       isFavourite: false,
    );

    Map<String, dynamic> toJson() => {
      "image" : image,
        "id": id,
        "name": name,
        "price": price,
        "description" : description,
        "status" : status,
       "isFavourite" : isFavourite,
       "qty" : qty,
    };
    @override
    ProductModel copyWith({
      int ? qty,
    }) => ProductModel(image: image, id: id, name: name, price: price, description: description, status: status,
    qty: qty ?? this.qty, isFavourite: isFavourite);
}
