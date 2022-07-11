import 'package:budaya/theme.dart';
import 'package:budaya/widgets/budaya_card.dart';
import 'package:budaya/widgets/categories.dart';
import 'package:budaya/widgets/special_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/province_card.dart';

class ProvincePage extends StatelessWidget {
  const ProvincePage({Key? key}) : super(key: key);

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TextField(
            cursorColor: greyColor,
            style: whiteTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor2,
              hintText: 'Find Your Province ...',
              hintStyle: greyTextStyle,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset(
                  'assets/images/search_icon.png',
                  width: 10,
                  height: 10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor2),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor2),
                  borderRadius: BorderRadius.circular(defaultRadius)),
              // border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget list() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        children: [
          Categories(imgUrl: 'assets/images/raja4.jpg', text: 'Papua Barat'),
          Categories(
              imgUrl: 'assets/images/rumah_kaki_seribu.jpg',
              text: 'Rumah Adat'),
          Categories(imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat'),
          Categories(imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat'),
          Categories(imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat'),
          Categories(imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat'),
          Categories(imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      searchBar(),
      list(),
    ]);
  }
}
