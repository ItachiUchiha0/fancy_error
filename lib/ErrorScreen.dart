import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'issues_repo.dart';

class ErrorScreen extends StatefulWidget {
  final FlutterErrorDetails details;

  ErrorScreen(this.details);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  List<dynamic> urls = [];

  bool issuesAvailable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchIssueSearch(widget.details.summary.toString()).then((value) => {
          print(value[0]["html_url"]),
          setState(() {
            urls = value;
            issuesAvailable = true;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "img/cancel.png",
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                AnimatedAlign(
                  alignment: Alignment.topCenter,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: Image.asset(
                    "img/error.png",
                    width: 128,
                    height: 128,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'OOOOPS!',
                  style: TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.none,
                      fontFamily: "Oswald"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Error Summary: ",
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            widget.details.summary.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontFamily: "Oswald"),
                          ),
                        )
                      ]),
                ]),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: issuesAvailable,
                  child: Row(children: [
                    Image.asset(
                      "img/github.png",
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Possible solutions: ",
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Visibility(
                      visible: issuesAvailable,
                      child: AnimationLimiter(
                        child: ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: urls.length,
                            itemBuilder: (_, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Row(children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                urls[index]["html_url"],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: "Oswald"),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launch(urls[index]["html_url"]);
                                            },
                                            child: Image.asset(
                                              "img/right_arrow.png",
                                              width: 16,
                                              height: 16,
                                            ),
                                          )
                                        ])),
                                  ),
                                ),
                              );
                            }),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
