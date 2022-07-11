import 'package:budaya/theme.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String imgUrl;
  final String text;
  const Categories({
    Key? key,
    required this.imgUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/province');
      },
      child: Container(
        height: 110,
        margin: EdgeInsets.only(
            bottom: defaultMargin, left: defaultMargin, right: defaultMargin),
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
              child: Image.asset(
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
