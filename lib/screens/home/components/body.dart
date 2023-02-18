import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slicing_2/constant.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // it will provie us  total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        _headerWithSearchBox(size),
        Row(
          children: <Widget>[
            _titleWithCustome("Recomended"),
            const Spacer(),
            _titleWithMoreBtn(),
          ],
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _cards(),
                _cards(),
                _cards(),
              ],
            )),
        Row(
          children: [Text('Feature')],
        )
      ],
    );
  }
}

// child: Image.asset("assets/images/image_1.png"),
Widget _cards() {
  return Container(
      margin: const EdgeInsets.only(right: 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/image_1.png"),
          Row(
            children: [],
          )
        ],
      ));
}

Widget _titleWithMoreBtn() {
  return MaterialButton(
      elevation: 0,
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Text(
        'More',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {});
}

Widget _titleWithCustome(String text) {
  return SizedBox(
    height: 24,
    child: Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ))
      ],
    ),
  );
}

Widget _headerWithSearchBox(Size size) {
  return Stack(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: 36 + kDefaultPadding),
        height: size.height * 0.2 - 27,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36))),
      ),
      Row(
        children: <Widget>[
          const Text(
            'Hi Uishoppy! ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          Image.asset('assets/images/logo.png')
        ],
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23)),
                ]),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: kPrimaryColor,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                SvgPicture.asset('assets/icons/search.svg')
              ],
            )),
      )
    ],
  );
}
