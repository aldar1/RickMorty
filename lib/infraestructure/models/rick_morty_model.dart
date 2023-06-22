// To parse this JSON data, do
//
//     final rickMortyModel = rickMortyModelFromMap(jsonString);

import 'dart:convert';

class RickMortyModel {
    Info info;
    List<Result> results;

    RickMortyModel({
        required this.info,
        required this.results,
    });

    factory RickMortyModel.fromJson(String str) => RickMortyModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RickMortyModel.fromMap(Map<String, dynamic> json) => RickMortyModel(
        info: Info.fromMap(json["info"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Info {
    int count;
    int pages;
    String next;
    // dynamic prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        // required this.prev,
    });

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        // prev: json["prev"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "pages": pages,
        "next": next,
        // "prev": prev,
    };
}

class Result {
    int id;
    String name;
    Status status;
    Species species;
    String type;
    Gender gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    Result({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map[json["species"]]!,
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toMap(),
        "location": location.toMap(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

// ignore: constant_identifier_names
enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Location {
    String name;
    String url;

    Location({
        required this.name,
        required this.url,
    });

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

// ignore: constant_identifier_names
enum Species { HUMAN, ALIEN }

final speciesValues = EnumValues({
    "Alien": Species.ALIEN,
    "Human": Species.HUMAN
});

// ignore: constant_identifier_names
enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Dead": Status.DEAD,
    "unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
