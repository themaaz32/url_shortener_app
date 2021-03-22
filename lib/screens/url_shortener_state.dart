import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortener_app/model/url_shortner_response_model.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  String shortUrlMessage = "Give some long url to convert";

  handleGetLinkButton() async {
    final longUrl = urlController.text;

    final String shortUrl = await getShortLink(longUrl);

    shortUrlMessage = "$shortUrl";

    notifyListeners();

  }

  Future<String> getShortLink(String longUrl) async {
    final result = await http.post("https://cleanuri.com/api/v1/shorten", body: {"url" : longUrl});

    if(result.statusCode == 200){
      print("Succesfully Completed");

      final response = urlShortnerResponseFromJson(result.body);

      return response.resultUrl;
    }else{
      print("Error in Api");
      print(result.body);
      return "There is some in shortening the url";
    }
  }
}