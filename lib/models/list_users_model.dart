
class ListUsers {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  ListUsers({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory ListUsers.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Datum> dataList = list.map((i) => Datum.fromJson(i)).toList();

    return ListUsers(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: dataList,
      support: Support.fromJson(json['support']),
    );
  }
}


class Datum {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  static List<Datum> listFromJson(List<dynamic> list) {
    List<Datum> dataList = [];
    for (var item in list) {
      dataList.add(Datum.fromJson(item));
    }
    return dataList;
  }
}


class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}

