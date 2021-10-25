import 'package:flutter/material.dart';
import 'package:flutter_play_yt_video_demo/play_yt_video_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoApp extends StatefulWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Youtube Video inApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Enter Youtube Link',
              style: GoogleFonts.mateSc(
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlayYTVideo(
                              youtubeLink: controller.text.trim(),
                            )));
              },
              icon: Icon(Icons.ondemand_video),
              label: Text(
                'Play',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}
