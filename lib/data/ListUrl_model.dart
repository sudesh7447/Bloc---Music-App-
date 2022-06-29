class ListUrlModel {
  Message? message;

  ListUrlModel({this.message});

  ListUrlModel.fromJson(Map<String, dynamic> json) {
    message =
        // ignore: unnecessary_new
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  Header? header;
  Body? body;

  Message({this.header, this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header =
        json['header'] != null ? new Header.fromJson(json['header']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Header {
  int? statusCode;
  double? executeTime;

  Header({this.statusCode, this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['execute_time'] = this.executeTime;
    return data;
  }
}

class Body {
  List<TrackList>? trackList;

  Body({this.trackList});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['track_list'] != null) {
      trackList = <TrackList>[];
      json['track_list'].forEach((v) {
        trackList!.add(new TrackList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackList != null) {
      data['track_list'] = this.trackList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackList {
  Track? track;

  TrackList({this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    track = json['track'] != null ? new Track.fromJson(json['track']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.track != null) {
      data['track'] = this.track!.toJson();
    }
    return data;
  }
}

class Track {
  int? trackId;
  String? trackName;
  List<TrackNameTranslationList>? trackNameTranslationList;
  int? trackRating;
  int? commontrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  Track(
      {this.trackId,
      this.trackName,
      this.trackNameTranslationList,
      this.trackRating,
      this.commontrackId,
      this.instrumental,
      this.explicit,
      this.hasLyrics,
      this.hasSubtitles,
      this.hasRichsync,
      this.numFavourite,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.trackShareUrl,
      this.trackEditUrl,
      this.restricted,
      this.updatedTime,
      this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      trackNameTranslationList = <TrackNameTranslationList>[];
      json['track_name_translation_list'].forEach((v) {
        trackNameTranslationList!.add(new TrackNameTranslationList.fromJson(v));
      });
    }
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = json['primary_genres'] != null
        ? new PrimaryGenres.fromJson(json['primary_genres'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = this.trackId;
    data['track_name'] = this.trackName;
    if (this.trackNameTranslationList != null) {
      data['track_name_translation_list'] =
          this.trackNameTranslationList!.map((v) => v.toJson()).toList();
    }
    data['track_rating'] = this.trackRating;
    data['commontrack_id'] = this.commontrackId;
    data['instrumental'] = this.instrumental;
    data['explicit'] = this.explicit;
    data['has_lyrics'] = this.hasLyrics;
    data['has_subtitles'] = this.hasSubtitles;
    data['has_richsync'] = this.hasRichsync;
    data['num_favourite'] = this.numFavourite;
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['track_share_url'] = this.trackShareUrl;
    data['track_edit_url'] = this.trackEditUrl;
    data['restricted'] = this.restricted;
    data['updated_time'] = this.updatedTime;
    if (this.primaryGenres != null) {
      data['primary_genres'] = this.primaryGenres!.toJson();
    }
    return data;
  }
}

class TrackNameTranslationList {
  TrackNameTranslation? trackNameTranslation;

  TrackNameTranslationList({this.trackNameTranslation});

  TrackNameTranslationList.fromJson(Map<String, dynamic> json) {
    trackNameTranslation = json['track_name_translation'] != null
        ? new TrackNameTranslation.fromJson(json['track_name_translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackNameTranslation != null) {
      data['track_name_translation'] = this.trackNameTranslation!.toJson();
    }
    return data;
  }
}

class TrackNameTranslation {
  String? language;
  String? translation;

  TrackNameTranslation({this.language, this.translation});

  TrackNameTranslation.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['translation'] = this.translation;
    return data;
  }
}

class PrimaryGenres {
  List<Null>? musicGenreList;

  PrimaryGenres({this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = <Null>[];
      // json['music_genre_list'].forEach((v) {
      //   musicGenreList!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.musicGenreList != null) {
    //   data['music_genre_list'] =
    //       this.musicGenreList!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
