import 'package:dio/dio.dart';

import '../models/users_model.dart';

Future<Users> getData() async {
  var response = await Dio().get('https://reqres.in/api/users?page=1');
  // print(response.data);

  if (response.statusCode == 200) {
    return Users.fromJson(response.data);
  } else {
    throw Exception('Failed to load album');
  }
}
