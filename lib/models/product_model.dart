
import 'dart:convert';

TopLevel topLevelFromJson(String str) => TopLevel.fromJson(json.decode(str));

String topLevelToJson(TopLevel data) => json.encode(data.toJson());

class TopLevel {
    String id;
    String name;
    String email;

    TopLevel({
        required this.id,
        required this.name,
        required this.email,
    });

    factory TopLevel.fromJson(Map<String, dynamic> json) => TopLevel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}
