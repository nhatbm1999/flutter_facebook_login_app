class User {
  const User({
    required this.email,
    required this.id,
    required this.name,
    required this.picture,
  });
  final String email;
  final String id;
  final String name;
  final Picture picture;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      picture: Picture.fromJson((json['picture']['data'] as Map).cast<String, dynamic>() )
    );
  }
}

class Picture {
  const Picture({
    required this.url,
    required this.height,
    required this.width,
    required this.silhouette,
  });
  final String url;
  final num height;
  final num width;
  final bool silhouette;

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      url: json['url'],
      height: json['height'],
      width: json['width'],
      silhouette: json['is_silhouette']
    );
  }
}

// {
//     "email" = "dsmr.apps@gmail.com",
//     "id" = 3003332493073668,
//     "name" = "Darwin Morocho",
//     "picture" = {
//         "data" = {
//             "height" = 50,
//             "is_silhouette" = 0,
//             "url" = "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668",
//             "width" = 50,
//         },
//     }
// }