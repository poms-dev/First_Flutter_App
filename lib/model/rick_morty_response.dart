import 'dart:convert';
RickMortyResponse rickMortyResponseFromJson(String str) => RickMortyResponse.fromJson(json.decode(str));
String rickMortyResponseToJson(RickMortyResponse data) => json.encode(data.toJson());

class RickMortyResponse {
  RickMortyResponse({
      this.info, 
      this.results,});

  RickMortyResponse.fromJson(dynamic json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  Info? info;
  List<Results>? results;

RickMortyResponse copyWith({  Info? info,
  List<Results>? results,
}) => RickMortyResponse(  info: info ?? this.info,
  results: results ?? this.results,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (info != null) {
      map['info'] = info?.toJson();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());

class Results {
  Results({
      this.id, 
      this.name, 
      this.status, 
      this.species, 
      this.type, 
      this.gender, 
      this.origin, 
      this.location, 
      this.image, 
      this.episode, 
      this.url, 
      this.created,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }
  num? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;
Results copyWith({  num? id,
  String? name,
  String? status,
  String? species,
  String? type,
  String? gender,
  Origin? origin,
  Location? location,
  String? image,
  List<String>? episode,
  String? url,
  String? created,
}) => Results(  id: id ?? this.id,
  name: name ?? this.name,
  status: status ?? this.status,
  species: species ?? this.species,
  type: type ?? this.type,
  gender: gender ?? this.gender,
  origin: origin ?? this.origin,
  location: location ?? this.location,
  image: image ?? this.image,
  episode: episode ?? this.episode,
  url: url ?? this.url,
  created: created ?? this.created,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['species'] = species;
    map['type'] = type;
    map['gender'] = gender;
    if (origin != null) {
      map['origin'] = origin?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['image'] = image;
    map['episode'] = episode;
    map['url'] = url;
    map['created'] = created;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      this.name, 
      this.url,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;
Location copyWith({  String? name,
  String? url,
}) => Location(  name: name ?? this.name,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}

Origin originFromJson(String str) => Origin.fromJson(json.decode(str));
String originToJson(Origin data) => json.encode(data.toJson());
class Origin {
  Origin({
      this.name, 
      this.url,});

  Origin.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;
Origin copyWith({  String? name,
  String? url,
}) => Origin(  name: name ?? this.name,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}

Info infoFromJson(String str) => Info.fromJson(json.decode(str));
String infoToJson(Info data) => json.encode(data.toJson());
class Info {
  Info({
      this.count, 
      this.pages, 
      this.next, 
      this.prev,});

  Info.fromJson(dynamic json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }
  num? count;
  num? pages;
  String? next;
  dynamic prev;
Info copyWith({  num? count,
  num? pages,
  String? next,
  dynamic prev,
}) => Info(  count: count ?? this.count,
  pages: pages ?? this.pages,
  next: next ?? this.next,
  prev: prev ?? this.prev,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['pages'] = pages;
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }

  @override
  String toString() {
    return 'Info{count: $count, pages: $pages, next: $next, prev: $prev}';
  }
}