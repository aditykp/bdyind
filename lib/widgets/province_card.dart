import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/pages/detail_province.dart';
import 'package:budaya/theme.dart';
import 'package:flutter/material.dart';

class ProvinceCard extends StatelessWidget {
  final Datum model;
  final String title;
  final String imgUrl;
  const ProvinceCard({
    Key? key,
    required this.model,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> DetailProvince(model: model)));
      },
      child: Container(
        width: 190,
        height: 265,
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
              style: yellowTextStyle.copyWith(fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
