
class Picture {
  final String id;
  final String author;
  final String url;
  final String download_url;

  Picture(this.id, this.author, this.url, this.download_url);

  Picture.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        author = json['author'],
        url = json['url'],
        download_url = json['download_url'];
}

