import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/pages/detail_budaya.dart';
import 'package:budaya/pages/home_page.dart';
import 'package:budaya/theme.dart';
import 'package:flutter/material.dart';

class BudayaCard extends StatelessWidget {
  final String title;
  final String text;
  final String imgUrl;
  final Adat model;
  final List<Budaya> otherBudaya;
  const BudayaCard({
    Key? key,
    required this.model,
    required this.otherBudaya,
    required this.title,
    required this.text,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => DetailBudaya(
                  otherBudaya: otherBudaya,
                      model: model,
                  province: text,
                    )));
      },
      child: Container(
        width: 190,
        height: 280,
        margin: const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: backgroundColor2.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.network(
                    imgUrl,
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: yellowTextStyle.copyWith(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              text,
              style: greyTextStyle.copyWith(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
