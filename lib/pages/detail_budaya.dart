import 'dart:ui';

import 'package:budaya/theme.dart';
import 'package:budaya/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../widgets/special_tile.dart';

class DetailBudaya extends StatefulWidget {
  const DetailBudaya({Key? key}) : super(key: key);

  @override
  State<DetailBudaya> createState() => _DetailBudayaState();
}

class _DetailBudayaState extends State<DetailBudaya> {
  bool favorite = false;
  int index = 0;

  Widget header() {
    Widget topButton() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 40,
          right: defaultMargin,
        ),
        // width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              color: backgroundColor2,
              onPressed: () => Navigator.pop(context),
              child: Icon(
                Icons.chevron_left,
                size: 32,
                color: greyColor,
              ),
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              border: BorderRadius.circular(15),
            ),
            CustomButton(
              color: backgroundColor2,
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Icon(
                Icons.home,
                size: 32,
                color: greyColor,
              ),
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              border: BorderRadius.circular(15),
            ),
          ],
        ),
      );
    }

    Widget backgroundImage() {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.asset(
          'assets/images/rumbai.jpg',
          width: displayWidth(context),
          height: displayHeight(context) * 0.65,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget boxGlass() {
      Widget leftRow() {
        return Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rumbai',
                style: whiteTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: medium,
                  color: yellowColor,
                ),
              ),
              Text(
                'Papua Barat',
                style: greyTextStyle.copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }

      return Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              width: displayWidth(context),
              height: displayHeight(context) * 0.13,
              color: backgroundColor1.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        backgroundImage(),
        topButton(),
        boxGlass(),
      ],
    );
  }

  Widget content() {
    Widget descriptionText(String text) {
      final styleButton = TextStyle(
        fontSize: 16,
        color: brownColor,
      );

      return ReadMoreText(
        text,
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read More',
        trimExpandedText: 'show Less',
        moreStyle: styleButton,
        lessStyle: styleButton,
        style: whiteTextStyle.copyWith(fontSize: 16),
      );
    }

    Widget budayaTitle() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 15),
        child: Text(
          'Budaya',
          style: greyTextStyle.copyWith(fontSize: 16),
        ),
      );
    }

    Widget specials() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: [
            SpecialTile(imgUrl: 'assets/images/raja4.jpg', text: 'Papua Barat'),
            SpecialTile(
                imgUrl: 'assets/images/rumah_kaki_seribu.jpg',
                text: 'Rumah Adat'),
            SpecialTile(
                imgUrl: 'assets/images/suanggi.jpg', text: 'Pakaian Adat')
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: greyTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 20),
          descriptionText('''
 rumbai merupakan rok yang dibuat dari daun sagu kering yang disusun sebagai penutup di bagian bawah tubuh.\n
Rok rumbai bisa digunakan oleh perempuan namun bisa juga digunakan oleh laki-laki.
'''),
          budayaTitle(),
          specials(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              content(),
            ],
          ),
        ));
  }
}
