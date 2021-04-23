import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numero1/UI/slaidTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _indexPage = 0;
  var _listImage = [
    {"id": 0, "image": "images/1.jpg", "nome": " cafe com leite"},
    {"id": 1, "image": "images/2.jpg", "nome": "Cafe de grauns"},
    {"id": 2, "image": "images/3.jpg", "nome": "Cafe de preto"},
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int next = _controller.page.round();
      if (_indexPage != next) {
        setState(() {
          _indexPage = next;
        });
      }
    });
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: _listImage.length,
                itemBuilder: (_, index) {
                  bool activePage = index == _indexPage;
                  return SlidTile(
                    image: _listImage[index]["image"],
                    activePage: activePage,
                  );
                }),
          ),
          _bolets(),
        ],
      ),
    );
  }

  Widget _bolets() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listImage.map((e) {
          return InkWell(
            onTap: () {
              setState(() {
                _controller.jumpToPage(e["id"]);
                _indexPage = e["id"];
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _indexPage == e["id"] ? Colors.red : Colors.grey,
              ),
              height: 10,
              width: 10,
            ),
          );
        }).toList(),
      ),
    );
  }
}
