import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// 音乐详情页
class MusicDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MusicState();
  }
}

class _MusicState extends State<MusicDetail> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://upos-hz-mirrorakam.akamaized.net/upgcxcode/20/49/124344920/124344920-1-6.mp4?e=ig8euxZM2rNcNbdlhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1587464798&gen=playurl&os=akam&oi=2887137966&trid=e3a8635d06254c6e811c196d13a95b58h&platform=html5&upsig=d707b1d5b0fcd7a1b4189b999bddb0f9&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,platform&hdnts=exp=1587464798~hmac=137f375233409fd9da59ea726ba7b4b1125e8a8a2b381297f1dd1db73d3a94e0&mid=0&logo=80000000');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      // Try playing around with some of these other options:
//
//      showControls: true,
//      materialProgressColors: ChewieProgressColors(
//        playedColor: Colors.red,
//        handleColor: Colors.blue,
//        backgroundColor: Colors.grey,
//        bufferedColor: Colors.lightGreen,
//      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Chewie(controller: _chewieController),
            Text("test")],
        )
      );
  }
}
