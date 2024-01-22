import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isplaying = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var images = [
      Ink.image(
        image: NetworkImage(
            'https://i.ebayimg.com/images/g/rQ8AAOSws3phwv80/s-l1600.png'),
        child: InkWell(
          onTap: () async {
            if (isplaying) {
              await player.stop();
              setState(() {
                isplaying = false;                                               
              });   
            } else {
              print(':heart_eyes:');
              await player.setAsset(// Load a URL
                  'style.mp3'); // Schemes: (https: | file: | asset: )
              await player.setSpeed(5.0); 
              player.play();
              setState(() {
                isplaying = true;                                               
              });              
            }
          },
        ),
      ),
      Ink.image(
        image: NetworkImage('https://i.imgflip.com/60xf1m.jpg'),
        child: InkWell(
          onTap: () async {
            print('spongebob');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://i0.wp.com/www.comicbookrevolution.com/wp-content/uploads/2023/09/Nightwing-106-Dan-Mora-Banner.jpg?fit=1540%2C705&ssl=1'),
        child: InkWell(
          onTap: () async {
            print('peaches are extra ripe thsi year mmmmmmm');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://m.media-amazon.com/images/I/7122KMkSuVL.__AC_SY300_SX300_QL70_FMwebp_.jpg'),
        child: InkWell(
          onTap: () async {
            print('USA!!!');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'data:image/jpeg;base64,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'),
        child: InkWell(
          onTap: () async {
            print('Im a Banana!');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://i1.sndcdn.com/artworks-TXWqD6NbJRXPhUns-8fYa5g-t500x500.jpg'),
        child: InkWell(
          onTap: () async {
            print('Annoying orange is a nightmare');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'data:image/jpeg;base64,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'),
        child: InkWell(
          onTap: () async {
            print('I used to be this');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://i1.sndcdn.com/artworks-HdxXE6BxJ65FHooi-rtiaPw-t500x500.jpg'),
        child: InkWell(
          onTap: () async {
            print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMo2Csw_a32vmMA-xruyOKwkED6E4VF4ms0A&usqp=CAU'),
        child: InkWell(
          onTap: () async {
            print('OOOOOOOOOOOOOOOOOOOOOOOOA');
            await player.setAsset(// Load a URL
                'EMU.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://64.media.tumblr.com/c971848e88b848404fbaa7ffe165139d/520514081478ab09-11/s1280x1920/46d81fef21acd1fca90a350138cec99ec5a20697.png'),
        child: InkWell(
          onTap: () async {
            print('Is your jaw ok?, Ayden DID NOT DRAW THIS');
            await player.setUrl(// Load a URL
                'https://pub-7de58e77bbdc477680e9cd9b28c977e3.r2.dev/Metal%20Pipes%20Falling%20Sound.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
      Ink.image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6HtdLeEa4WlyO8DwTB19MPS9LekYsM98OvouDYEpVD9AxMUX5BR_t1dNAj-hcooQO9Dg&usqp=CAU'),
        child: InkWell(
          onTap: () async {
            print('sad violin theme');
            await player.setUrl(// Load a URL
                'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'); // Schemes: (https: | file: | asset: )
            player.play();
          },
        ),
      ),
    ]; //gku

    return GridView.count(crossAxisCount: 2, children: images);
  }
}
