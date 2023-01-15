## Features

The PhotoDetail package is used when you want to view multiple images using page views on the detail screen.
A hero animation was applied when moving to the detail screen.
You can also drag the image up or down, and if you move beyond a certain area, you will return to the previous page.


## Video

[alt text](https://github.com/jinhan38/photo_detail/tree/master/video/example_video.gif)

```dart
import 'package:flutter/material.dart';
import 'package:photo_detail/photo_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController? _pageController = PageController();

  final List<String> _imageList = [
    "assets/box.png",
    "assets/car.png",
    "assets/market.png",
  ];

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ...List.generate(
                _imageList.length,
                    (index) => _image(_imageList[index], index),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(String assetName, int initialPage) {
    return GestureDetector(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Hero(
          tag: assetName,
          child: Image.asset(assetName),
        ),
      ),
      onTap: () {
        PhotoDetail(
          context: context,
          pageView: _pageView(initialPage),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            title: const Text("Detail"),
          ),
        );
      },
    );
  }

  PageView _pageView(int initialPage) {
    _initPageController(initialPage);
    return PageView.builder(
      controller: _pageController,
      itemCount: _imageList.length,
      itemBuilder: (context, index) {
        String assetName = _imageList[index];
        return Hero(tag: assetName, child: Image.asset(assetName));
      },
    );
  }

  void _initPageController(int initialPage) {
    if (_pageController != null && _pageController!.hasClients) {
      _pageController!.dispose();
    }
    _pageController = PageController(initialPage: initialPage);
  }

}

```
