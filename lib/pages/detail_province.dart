import 'dart:ui';

import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/theme.dart';
import 'package:budaya/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../widgets/special_tile.dart';

class DetailProvince extends StatefulWidget {
  final Datum model;
  const DetailProvince({required this.model, Key? key}) : super(key: key);

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
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false),
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
        child: Image.network(
          '${widget.model.picture}',
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
                '${widget.model.name}',
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
                padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
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
      var _model = widget.model;
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: [
            ///pakaian adat
            SpecialTile(
              imgUrl: '${_model.pakaianAdat!.picture}',
              text: '${_model.pakaianAdat!.title}',
              province: '${_model.name}',
              model: _model.pakaianAdat!,
            ),

            ///rumah adat
            SpecialTile(
              imgUrl: '${_model.rumahAdat!.picture}',
              text: '${_model.rumahAdat!.title}',
              province: '${_model.name}',
              model: _model.rumahAdat!,
            ),

            ///tarian adat
            SpecialTile(
              imgUrl: '${_model.tarianAdat!.picture}',
              text: '${_model.tarianAdat!.title}',
              province: '${_model.name}',
              model: _model.tarianAdat!,
            ),
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
          descriptionText('''${widget.model.description}'''),
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
