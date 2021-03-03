
class YoutubeModel {
  
  final String id;
  final String title;
  final String thumb;
  final String chanel;

  YoutubeModel({this.id, this.title, this.thumb, this.chanel});

  static YoutubeModel fromJson(Map<String, dynamic> json) {
    return YoutubeModel(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumb: json['snippet']['thumbnails']['high']['url'],
      chanel: json['snippet']['channelTitle']
    );
  }
}
