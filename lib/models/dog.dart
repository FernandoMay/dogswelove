// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';

List<Dog> dogFromJson(String str) => List<Dog>.from(json.decode(str).map((x) => Dog.fromJson(x)));

String dogToJson(List<Dog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dog {
    Dog({
        this.dogName,
        this.description,
        this.age,
        this.image,
    });

    String dogName;
    String description;
    int age;
    String image;

    factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        dogName: json["dogName"],
        description: json["description"],
        age: json["age"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "dogName": dogName,
        "description": description,
        "age": age,
        "image": image,
    };
}
