class SearchMusic {
  Albums? albums;
  Artists? artists;
  Albums? episodes;
  Albums? genres;
  Albums? playlists;
  Albums? podcasts;
  TopResults? topResults;
  Albums? tracks;
  Albums? users;

  SearchMusic(
      {this.albums,
        this.artists,
        this.episodes,
        this.genres,
        this.playlists,
        this.podcasts,
        this.topResults,
        this.tracks,
        this.users});

  SearchMusic.fromJson(Map<String, dynamic> json) {
    albums =
    json['albums'] != null ? new Albums.fromJson(json['albums']) : null;
    artists =
    json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
    episodes =
    json['episodes'] != null ? new Albums.fromJson(json['episodes']) : null;
    genres =
    json['genres'] != null ? new Albums.fromJson(json['genres']) : null;
    playlists = json['playlists'] != null
        ? new Albums.fromJson(json['playlists'])
        : null;
    podcasts =
    json['podcasts'] != null ? new Albums.fromJson(json['podcasts']) : null;
    topResults = json['topResults'] != null
        ? new TopResults.fromJson(json['topResults'])
        : null;
    tracks =
    json['tracks'] != null ? new Albums.fromJson(json['tracks']) : null;
    users = json['users'] != null ? new Albums.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.toJson();
    }
    if (this.playlists != null) {
      data['playlists'] = this.playlists!.toJson();
    }
    if (this.podcasts != null) {
      data['podcasts'] = this.podcasts!.toJson();
    }
    if (this.topResults != null) {
      data['topResults'] = this.topResults!.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Albums {
  int? totalCount;
  List<Items>? items;

  Albums({this.totalCount, this.items});

  Albums.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataItems {
  Data? data;

  DataItems({this.data});

  DataItems.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? uri;
  String? name;
  Artists? artists;
  CoverArt? coverArt;
  Date? date;

  Data({this.uri, this.name, this.artists, this.coverArt, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    artists =
    json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    return data;
  }
}

class Artists {
  List<Items>? items;

  Artists({this.items});

  Artists.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? uri;
  Profile? profile;

  Items({this.uri, this.profile});

  Items.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? name;

  Profile({this.name});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class CoverArt {
  List<Sources>? sources;

  CoverArt({this.sources});

  CoverArt.fromJson(Map<String, dynamic> json) {
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(new Sources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sources != null) {
      data['sources'] = this.sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sources {
  String? url;
  int? width;
  int? height;

  Sources({this.url, this.width, this.height});

  Sources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Date {
  int? year;

  Date({this.year});

  Date.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    return data;
  }
}

class MyData {
  String? uri;
  Profile? profile;
  Visuals? visuals;

  MyData({this.uri, this.profile, this.visuals});

  MyData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    visuals =
    json['visuals'] != null ? new Visuals.fromJson(json['visuals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.visuals != null) {
      data['visuals'] = this.visuals!.toJson();
    }
    return data;
  }
}

class Visuals {
  CoverArt? avatarImage;

  Visuals({this.avatarImage});

  Visuals.fromJson(Map<String, dynamic> json) {
    avatarImage = json['avatarImage'] != null
        ? new CoverArt.fromJson(json['avatarImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatarImage != null) {
      data['avatarImage'] = this.avatarImage!.toJson();
    }
    return data;
  }
}

class AllData {
  String? uri;
  String? name;
  CoverArt? coverArt;
  Duration? duration;
  ReleaseDate? releaseDate;
  Podcast? podcast;
  String? description;
  ContentRating? contentRating;

  AllData(
      {this.uri,
        this.name,
        this.coverArt,
        this.duration,
        this.releaseDate,
        this.podcast,
        this.description,
        this.contentRating});

  AllData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
    duration = json['duration'] != null
        ? new Duration.fromJson(json['duration'])
        : null;
    releaseDate = json['releaseDate'] != null
        ? new ReleaseDate.fromJson(json['releaseDate'])
        : null;
    podcast =
    json['podcast'] != null ? new Podcast.fromJson(json['podcast']) : null;
    description = json['description'];
    contentRating = json['contentRating'] != null
        ? new ContentRating.fromJson(json['contentRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    if (this.releaseDate != null) {
      data['releaseDate'] = this.releaseDate!.toJson();
    }
    if (this.podcast != null) {
      data['podcast'] = this.podcast!.toJson();
    }
    data['description'] = this.description;
    if (this.contentRating != null) {
      data['contentRating'] = this.contentRating!.toJson();
    }
    return data;
  }
}

class Duration {
  int? totalMilliseconds;

  Duration({this.totalMilliseconds});

  Duration.fromJson(Map<String, dynamic> json) {
    totalMilliseconds = json['totalMilliseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalMilliseconds'] = this.totalMilliseconds;
    return data;
  }
}

class ReleaseDate {
  String? isoString;

  ReleaseDate({this.isoString});

  ReleaseDate.fromJson(Map<String, dynamic> json) {
    isoString = json['isoString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isoString'] = this.isoString;
    return data;
  }
}

class Podcast {
  CoverArt? coverArt;

  Podcast({this.coverArt});

  Podcast.fromJson(Map<String, dynamic> json) {
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    return data;
  }
}

class ContentRating {
  String? label;

  ContentRating({this.label});

  ContentRating.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class ImageData {
  String? uri;
  String? name;
  CoverArt? image;

  ImageData({this.uri, this.name, this.image});

  ImageData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    image = json['image'] != null ? new CoverArt.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class SpecsSources {
  String? url;
  Null? width;
  Null? height;

  SpecsSources({this.url, this.width, this.height});

  SpecsSources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class ImagewithDescriptionData {
  String? uri;
  String? name;
  String? description;
  Artists? images;
  Profile? owner;

  ImagewithDescriptionData({this.uri, this.name, this.description, this.images, this.owner});

  ImagewithDescriptionData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    description = json['description'];
    images =
    json['images'] != null ? new Artists.fromJson(json['images']) : null;
    owner = json['owner'] != null ? new Profile.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class PubData {
  String? uri;
  String? name;
  CoverArt? coverArt;
  String? type;
  Profile? publisher;
  String? mediaType;

  PubData(
      {this.uri,
        this.name,
        this.coverArt,
        this.type,
        this.publisher,
        this.mediaType});

  PubData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
    type = json['type'];
    publisher = json['publisher'] != null
        ? new Profile.fromJson(json['publisher'])
        : null;
    mediaType = json['mediaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    data['type'] = this.type;
    if (this.publisher != null) {
      data['publisher'] = this.publisher!.toJson();
    }
    data['mediaType'] = this.mediaType;
    return data;
  }
}

class TopResults {
  List<Items>? items;
  List<Featured>? featured;

  TopResults({this.items, this.featured});

  TopResults.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    if (json['featured'] != null) {
      featured = <Featured>[];
      json['featured'].forEach((v) {
        featured!.add(new Featured.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.featured != null) {
      data['featured'] = this.featured!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Featured
{
  Featured.fromJson(v);

  toJson() {}

}

class WholeData {
  String? uri;
  Profile? profile;
  Visuals? visuals;
  String? id;
  String? name;
  AlbumOfTrack? albumOfTrack;
  Artists? artists;
  ContentRating? contentRating;
  Duration? duration;
  Playability? playability;
  String? description;
  Artists? images;
  Profile? owner;
  CoverArt? coverArt;
  Date? date;
  String? type;
  Profile? publisher;
  String? mediaType;

  WholeData(
      {this.uri,
        this.profile,
        this.visuals,
        this.id,
        this.name,
        this.albumOfTrack,
        this.artists,
        this.contentRating,
        this.duration,
        this.playability,
        this.description,
        this.images,
        this.owner,
        this.coverArt,
        this.date,
        this.type,
        this.publisher,
        this.mediaType});

  WholeData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    visuals =
    json['visuals'] != null ? new Visuals.fromJson(json['visuals']) : null;
    id = json['id'];
    name = json['name'];
    albumOfTrack = json['albumOfTrack'] != null
        ? new AlbumOfTrack.fromJson(json['albumOfTrack'])
        : null;
    artists =
    json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
    contentRating = json['contentRating'] != null
        ? new ContentRating.fromJson(json['contentRating'])
        : null;
    duration = json['duration'] != null
        ? new Duration.fromJson(json['duration'])
        : null;
    playability = json['playability'] != null
        ? new Playability.fromJson(json['playability'])
        : null;
    description = json['description'];
    images =
    json['images'] != null ? new Artists.fromJson(json['images']) : null;
    owner = json['owner'] != null ? new Profile.fromJson(json['owner']) : null;
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    type = json['type'];
    publisher = json['publisher'] != null
        ? new Profile.fromJson(json['publisher'])
        : null;
    mediaType = json['mediaType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.visuals != null) {
      data['visuals'] = this.visuals!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.albumOfTrack != null) {
      data['albumOfTrack'] = this.albumOfTrack!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    if (this.contentRating != null) {
      data['contentRating'] = this.contentRating!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    if (this.playability != null) {
      data['playability'] = this.playability!.toJson();
    }
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['type'] = this.type;
    if (this.publisher != null) {
      data['publisher'] = this.publisher!.toJson();
    }
    data['mediaType'] = this.mediaType;
    return data;
  }
}

class AlbumOfTrack {
  String? uri;
  String? name;
  CoverArt? coverArt;
  String? id;
  SharingInfo? sharingInfo;

  AlbumOfTrack({this.uri, this.name, this.coverArt, this.id, this.sharingInfo});

  AlbumOfTrack.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'];
    coverArt = json['coverArt'] != null
        ? new CoverArt.fromJson(json['coverArt'])
        : null;
    id = json['id'];
    sharingInfo = json['sharingInfo'] != null
        ? new SharingInfo.fromJson(json['sharingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['name'] = this.name;
    if (this.coverArt != null) {
      data['coverArt'] = this.coverArt!.toJson();
    }
    data['id'] = this.id;
    if (this.sharingInfo != null) {
      data['sharingInfo'] = this.sharingInfo!.toJson();
    }
    return data;
  }
}

class SharingInfo {
  String? shareUrl;

  SharingInfo({this.shareUrl});

  SharingInfo.fromJson(Map<String, dynamic> json) {
    shareUrl = json['shareUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shareUrl'] = this.shareUrl;
    return data;
  }
}

class Playability {
  bool? playable;

  Playability({this.playable});

  Playability.fromJson(Map<String, dynamic> json) {
    playable = json['playable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playable'] = this.playable;
    return data;
  }
}

class ArtistData {
  String? uri;
  String? id;
  String? name;
  AlbumOfTrack? albumOfTrack;
  Artists? artists;
  ContentRating? contentRating;
  Duration? duration;
  Playability? playability;

  ArtistData(
      {this.uri,
        this.id,
        this.name,
        this.albumOfTrack,
        this.artists,
        this.contentRating,
        this.duration,
        this.playability});

  ArtistData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    id = json['id'];
    name = json['name'];
    albumOfTrack = json['albumOfTrack'] != null
        ? new AlbumOfTrack.fromJson(json['albumOfTrack'])
        : null;
    artists =
    json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
    contentRating = json['contentRating'] != null
        ? new ContentRating.fromJson(json['contentRating'])
        : null;
    duration = json['duration'] != null
        ? new Duration.fromJson(json['duration'])
        : null;
    playability = json['playability'] != null
        ? new Playability.fromJson(json['playability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.albumOfTrack != null) {
      data['albumOfTrack'] = this.albumOfTrack!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    if (this.contentRating != null) {
      data['contentRating'] = this.contentRating!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    if (this.playability != null) {
      data['playability'] = this.playability!.toJson();
    }
    return data;
  }
}

class DisplayNameData {
  String? uri;
  String? id;
  String? displayName;
  String? username;
  CoverArt? image;

  DisplayNameData({this.uri, this.id, this.displayName, this.username, this.image});

  DisplayNameData.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    id = json['id'];
    displayName = json['displayName'];
    username = json['username'];
    image = json['image'] != null ? new CoverArt.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['username'] = this.username;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? smallImageUrl;
  String? largeImageUrl;

  Image({this.smallImageUrl, this.largeImageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['smallImageUrl'];
    largeImageUrl = json['largeImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smallImageUrl'] = this.smallImageUrl;
    data['largeImageUrl'] = this.largeImageUrl;
    return data;
  }
}