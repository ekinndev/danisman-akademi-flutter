import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class WebSiteScreen extends StatefulWidget {
  @override
  _WebSiteScreenState createState() => _WebSiteScreenState();
}

class _WebSiteScreenState extends State<WebSiteScreen> {
  final String apiUrl = "https://danismanakademi.org/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;
  Future<void> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"),
        headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return posts == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemBuilder: (ctx, index) => InkWell(
              onTap: () async {
                if (await canLaunch(posts[index]["link"])) {
                  await launch( posts[index]["link"]);
                }
              },
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                posts[index]["_embedded"]["wp:featuredmedia"] ==
                                        null
                                    ? 'https://via.placeholder.com/640x360'
                                    : posts[index]["_embedded"]
                                        ["wp:featuredmedia"][0]["source_url"],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                color: Colors.amber.withOpacity(0.9),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Text(
                                  posts[index]["title"]["rendered"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Color(int.parse('0xFF2C3E50'))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Danışman',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.calendarAlt,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                                posts[index]['date_gmt']
                                        .toString()
                                        .split('T')[0] +
                                    ' ' +
                                    posts[index]['date_gmt']
                                        .toString()
                                        .split('T')[1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            itemCount: posts.length,
          );
  }
}
