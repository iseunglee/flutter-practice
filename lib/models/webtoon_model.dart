class WebtoonModel {
  final String title, thumb, id;

  // 다이나믹 타입인 webtoon으로 webtoonmodel 클래스를 초기화
  // named constructors 사용
  // fromJson named constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
