import 'dart:ui';

import 'package:budaya/theme.dart';
import 'package:budaya/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../widgets/special_tile.dart';

class DetailProvince extends StatefulWidget {
  const DetailProvince({Key? key}) : super(key: key);

  @override
  State<DetailProvince> createState() => _DetailProvinceState();
}

class _DetailProvinceState extends State<DetailProvince> {
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
          'assets/images/patung.jpg',
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
                'Bali',
                style: whiteTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: medium,
                  color: yellowColor,
                ),
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
              height: displayHeight(context) * 0.10,
              color: backgroundColor1.withOpacity(0.4),
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
Di awal kemerdekaan, Bali merupakan bagian dari Provinsi Sunda Kecil bersama Nusa Tenggara Barat (NTB) dan Nusa Tenggara Timur (NTT). Provinsi Bali dibentuk pertama kali pada 14 Agustus 1958. Pembentukannya ditetapkan berdasarkan Undang-Undang Nomor 64 Tahun 1958 tentang Pembentukan Daerah-daerah Tingkat Bali, Nusa Tenggara Barat, dan Nusa Tenggara Timur
Ketika itu, ibukotanya adalah singaraja dan pada tahun 1960 dipindah ke Kota Denpasar. \n
Luas wilayah Bali mencapai 5.780,06 kilometer persegi atau 0,29 persen dari luas wilayah Indonesia. Populasi pendudukannya 4,33 juta jiwa pada tahun 2019.
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
