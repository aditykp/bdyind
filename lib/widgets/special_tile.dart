import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/pages/detail_budaya.dart';
import 'package:budaya/pages/detail_province.dart';
import 'package:budaya/pages/home_page.dart';
import 'package:budaya/theme.dart';
import 'package:flutter/material.dart';

class SpecialTile extends StatelessWidget {
  final List<Budaya>? otherBudaya;
  final Adat model;
  final String province;
  final String imgUrl;
  final String text;
  final bool isProvince;
  final Datum? provinceModel;
  const SpecialTile({
    Key? key,
    this.isProvince = false,
    required this.province,
    this.otherBudaya,
    required this.model,
    required this.imgUrl,
    required this.text,
    this.provinceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isProvince) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => DetailProvince(model: provinceModel!),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => DetailBudaya(
                otherBudaya: otherBudaya,
                province: province,
                model: model,
              ),
            ),
          );
        }
      },
      child: Container(
        height: 110,
        margin: EdgeInsets.only(bottom: defaultMargin, left: defaultMargin, right: defaultMargin),
        //padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor2.withOpacity(
            0.6,
          ),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.network(
                imgUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: whiteTextStyle.copyWith(fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ))
          ],
        ),
      ),
    );
  }
}
