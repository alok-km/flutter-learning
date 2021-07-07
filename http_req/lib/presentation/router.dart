import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_req/constants/strings.dart';
import 'package:http_req/presentation/screens/catalogue.dart';
import 'package:http_req/presentation/screens/fetch_data_screen.dart';
import 'package:http_req/presentation/screens/local_storage_Screen.dart';
import 'package:http_req/presentation/screens/post_data_screen.dart';
import 'package:http_req/presentation/screens/secure_storage_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Catalogue());
      case POST_DATA:
        return MaterialPageRoute(builder: (_) => PostDataScreen());
      case FETCH_DATA:
        return MaterialPageRoute(builder: (_) => FetchDataScreen());
      case LOCAL_STORAGE:
        return MaterialPageRoute(builder: (_) => LocalStorageScreen());
      case SECURE_STORAGE:
        return MaterialPageRoute(builder: (_) => SecureStorageScreen());
      default:
        return null;
    }
  }
}
