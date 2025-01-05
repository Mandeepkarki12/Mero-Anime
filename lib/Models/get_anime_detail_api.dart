class GetAnimeDetail {
  int? id;
  String? title;
  MainPicture? mainPicture;
  AlternativeTitles? alternativeTitles;
  String? startDate;
  String? endDate;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  String? mediaType;
  String? status;
  List<Genres>? genres;
  int? numEpisodes;
  Broadcast? broadcast;
  String? source;
  String? rating;
  List<RelatedAnime>? relatedAnime;
  List<Recommendations>? recommendations;

  GetAnimeDetail(
      {this.id,
      this.title,
      this.mainPicture,
      this.alternativeTitles,
      this.startDate,
      this.endDate,
      this.synopsis,
      this.mean,
      this.rank,
      this.popularity,
      this.mediaType,
      this.status,
      this.genres,
      this.numEpisodes,
      this.broadcast,
      this.source,
      this.rating,
      this.relatedAnime,
      this.recommendations});

  GetAnimeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
        : null;
    alternativeTitles = json['alternative_titles'] != null
        ? new AlternativeTitles.fromJson(json['alternative_titles'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    synopsis = json['synopsis'];
    mean = json['mean'];
    rank = json['rank'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    status = json['status'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    numEpisodes = json['num_episodes'];
    broadcast = json['broadcast'] != null
        ? new Broadcast.fromJson(json['broadcast'])
        : null;
    source = json['source'];
    rating = json['rating'];
    if (json['related_anime'] != null) {
      relatedAnime = <RelatedAnime>[];
      json['related_anime'].forEach((v) {
        relatedAnime!.add(new RelatedAnime.fromJson(v));
      });
    }
    if (json['recommendations'] != null) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(new Recommendations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.mainPicture != null) {
      data['main_picture'] = this.mainPicture!.toJson();
    }
    if (this.alternativeTitles != null) {
      data['alternative_titles'] = this.alternativeTitles!.toJson();
    }
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['synopsis'] = this.synopsis;
    data['mean'] = this.mean;
    data['rank'] = this.rank;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['status'] = this.status;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['num_episodes'] = this.numEpisodes;
    if (this.broadcast != null) {
      data['broadcast'] = this.broadcast!.toJson();
    }
    data['source'] = this.source;
    data['rating'] = this.rating;
    if (this.relatedAnime != null) {
      data['related_anime'] =
          this.relatedAnime!.map((v) => v.toJson()).toList();
    }
    if (this.recommendations != null) {
      data['recommendations'] =
          this.recommendations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainPicture {
  String? medium;
  String? large;

  MainPicture({this.medium, this.large});

  MainPicture.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class AlternativeTitles {
  List<String>? synonyms;
  String? en;
  String? ja;

  AlternativeTitles({this.synonyms, this.en, this.ja});

  AlternativeTitles.fromJson(Map<String, dynamic> json) {
    synonyms = json['synonyms'].cast<String>();
    en = json['en'];
    ja = json['ja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['synonyms'] = this.synonyms;
    data['en'] = this.en;
    data['ja'] = this.ja;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Broadcast {
  String? dayOfTheWeek;
  String? startTime;

  Broadcast({this.dayOfTheWeek, this.startTime});

  Broadcast.fromJson(Map<String, dynamic> json) {
    dayOfTheWeek = json['day_of_the_week'];
    startTime = json['start_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_of_the_week'] = this.dayOfTheWeek;
    data['start_time'] = this.startTime;
    return data;
  }
}

class RelatedAnime {
  Node? node;
  String? relationType;
  String? relationTypeFormatted;

  RelatedAnime({this.node, this.relationType, this.relationTypeFormatted});

  RelatedAnime.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    relationType = json['relation_type'];
    relationTypeFormatted = json['relation_type_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    data['relation_type'] = this.relationType;
    data['relation_type_formatted'] = this.relationTypeFormatted;
    return data;
  }
}

class Node {
  int? id;
  String? title;
  MainPicture? mainPicture;

  Node({this.id, this.title, this.mainPicture});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainPicture = json['main_picture'] != null
        ? new MainPicture.fromJson(json['main_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.mainPicture != null) {
      data['main_picture'] = this.mainPicture!.toJson();
    }
    return data;
  }
}

class Recommendations {
  Node? node;
  int? numRecommendations;

  Recommendations({this.node, this.numRecommendations});

  Recommendations.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    numRecommendations = json['num_recommendations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    data['num_recommendations'] = this.numRecommendations;
    return data;
  }
}
