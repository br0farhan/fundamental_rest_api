// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sample {
  final String? name;
  final int? age;
  final List<String>? hobby;
  final Github? github;
  final List<Arcticles>? articles;
  Sample({this.name, this.age, this.hobby, this.github, this.articles});

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        name: json["name"] ?? '',
        age: json["age"] ?? 0,
        hobby: List<String>.from(
          json["hobby"] ?? [],
        ),
        github: Github.fromJson(json["github"]),
        articles: List<Arcticles>.from(
            json["articles"].map((article) => Arcticles.fromJson(article)) ??
                []));
  }
  @override
  String toString() {
    return 'Sample(name: $name, age: $age, hobby: $hobby, github: $github, articles: $articles)';
  }
}

class Github {
  final String username;
  final int repositories;
  final bool isGDE;

  Github(
      {required this.username,
      required this.repositories,
      required this.isGDE});
  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(
        username: json["username"],
        repositories: json["repositories"],
        isGDE: json["isGDE"]);
  }
  @override
  String toString() =>
      'Github(username: $username, repositories : $repositories, isGDE : $isGDE)';
}

class Arcticles {
  final int? id;
  final String? title;
  final String? subtitle;

  Arcticles({required this.id, required this.title, required this.subtitle});
  factory Arcticles.fromJson(Map<String, dynamic> json) {
    return Arcticles(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "");
  }

  @override
  String toString() => 'Arcticles(id: $id, title: $title, subtitle: $subtitle)';
}
