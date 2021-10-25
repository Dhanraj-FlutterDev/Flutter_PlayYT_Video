import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayYTVideo extends StatefulWidget {
  String youtubeLink;

  PlayYTVideo({@required this.youtubeLink, Key key}) : super(key: key);

  @override
  _PlayYTVideoState createState() => _PlayYTVideoState();
}

class _PlayYTVideoState extends State<PlayYTVideo> {
  YoutubePlayerController _controller;
  YoutubeMetaData _videoMetaData;

  bool _isPlayerReady = false;
  PlayerState _playerState;

  var videoId;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId =
          YoutubePlayer.convertUrlToId(widget.youtubeLink),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YT Play'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressColors: ProgressBarColors(
              playedColor: Colors.white,
              handleColor: Colors.white,
            ),
            onReady: () {
              _controller.addListener(listener);
            },
          ),
        ));
  }
}
