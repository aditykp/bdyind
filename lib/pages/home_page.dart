import 'package:budaya/theme.dart';
import 'package:budaya/widgets/budaya_card.dart';
import 'package:budaya/widgets/special_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/province_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Budaya\ Indonesia',
            style: yellowTextStyle.copyWith(
                fontSize: 50, fontWeight: semiBold, height: 1),
          ),
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

  Widget budayaTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Text(
        'Budaya',
        style: whiteTextStyle.copyWith(fontSize: 20),
      ),
    );
  }

  Widget budaya() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            BudayaCard(
              title: 'Rumbai',
              text: 'Papua Barat',
              imgUrl: 'assets/images/rumbai.jpg',
            ),
            BudayaCard(
              title: 'Rumbai',
              text: 'Papua Barat',
              imgUrl: 'assets/images/rumbai.jpg',
            ),
            BudayaCard(
              title: 'Rumbai',
              text: 'Papua Barat',
              imgUrl: 'assets/images/rumbai.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget provinceTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Text(
        'Province',
        style: whiteTextStyle.copyWith(fontSize: 20),
      ),
    );
  }

  Widget province() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            ProvinceCard(
              title: 'Bali',
              imgUrl: 'assets/images/patung.jpg',
            ),
            ProvinceCard(
              title: 'NTT',
              imgUrl: 'assets/images/komodo.jpg',
            ),
            ProvinceCard(
              title: 'KalSel',
              imgUrl: 'assets/images/pasar_apung.jpg',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      searchBar(),
      budayaTitle(),
      budaya(),
      provinceTitle(),
      province(),
    ]);
  }
}
