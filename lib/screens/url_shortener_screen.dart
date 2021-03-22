import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener_app/screens/url_shortener_state.dart';

class UrlShortenerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortenerState>(context, listen: true);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              "URL Shortner",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Shorten your long URL quickly",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            TextField(
              controller: state.urlController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Paste the Link",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Builder(
              builder: (context) => GestureDetector(
                child: Text(state.shortUrlMessage),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: state.shortUrlMessage))
                      .whenComplete(() => Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Link is copied"))));
                },
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  state.handleGetLinkButton();
                },
                child: Text("GET LINK"),
                color: Colors.blue,
                textColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
