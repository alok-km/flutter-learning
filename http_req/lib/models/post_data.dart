import 'package:http/http.dart';
import 'package:http_req/constants/strings.dart';

void postData() async {
  try {
    final response = await post(Uri.parse(url), body: {
      "title": "Anything",
      "body": "Post body",
      "userId": "1",
    });

    print(response.body);
  } catch (err) {}
}
