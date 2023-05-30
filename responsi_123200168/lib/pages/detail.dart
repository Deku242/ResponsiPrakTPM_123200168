import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatelessWidget {
  String title;
  String pubDate;
  String thumbnail;
  String description;
  String link;

  NewsDetailsScreen(
      {Key? key,
      required this.title,
      required this.pubDate,
      required this.thumbnail,
      required this.description,
      required this.link})
      : super(key: key);

  final Uri _url = Uri.parse('https://flutter.dev');
  //

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(title: Text("Detail News"), centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(18),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateFormat('EEEE, dd MMMM yyyy')
                    .format(DateTime.parse(pubDate)),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.network(
                    thumbnail.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                // decoration: BoxDecoration(color: Colors.white, boxShadow: [
                //   BoxShadow(
                //     color: Colors.blueGrey.withOpacity(0.10),
                //     spreadRadius: 3,
                //     blurRadius: 10,
                //     offset: Offset(0, 10),
                //   )
                // ]),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description.toString(),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          wordSpacing: 3,
                        ),
                        maxLines: 11,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () async {
                    await goToWebPage(link.toString());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Text(
                    "Baca Selengkapnya...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
