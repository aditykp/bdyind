import 'package:budaya/controllers/provinceController.dart';
import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/theme.dart';
import 'package:budaya/widgets/budaya_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/province_card.dart';

class Budaya {
  String province;
  Adat budaya;

  Budaya({required this.province, required this.budaya});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  late ProvinceModel model;
  bool isSearch = false;
  final List<Budaya> _budaya = [];
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Budaya\nIndonesia',
            style: yellowTextStyle.copyWith(fontSize: 50, fontWeight: semiBold, height: 1),
          ),
          const SizedBox(height: 20),
          TextField(
            cursorColor: greyColor,
            style: whiteTextStyle,
            controller: searchTextController,
            decoration: InputDecoration(
              suffix: GestureDetector(
                  onTap: () => setState(() {
                        searchTextController.clear();
                        isSearch = false;
                      }),
                  child: Icon(
                    CupertinoIcons.clear,
                    color: whiteColor,
                  )),
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
                  borderSide: BorderSide(color: backgroundColor2), borderRadius: BorderRadius.circular(defaultRadius)),
              // border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (searchTextController.text.isNotEmpty) {
                setState(() {
                  isSearch = true;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          if (isSearch)
            DecoratedBox(
                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemCount: model.data!.length,
                    itemBuilder: (c, i) {
                      if (model.data![i].name!.toLowerCase().contains(searchTextController.text.toLowerCase())) {
                        return ListTile(
                          minVerticalPadding: 20,
                          dense: true,
                          leading: ClipRRect(
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(model.data![i].picture!, fit: BoxFit.cover)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: Text(
                            '${model.data![i].name}',
                            style: darkGreyTextStyle,
                          ),
                        );
                      } else {
                        return const Offstage();
                      }
                    }))
          else
            const Offstage(),
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
    if (_budaya.isNotEmpty) {
      return Container(
          margin: const EdgeInsets.only(
            top: 15,
          ),
          height: 275.0,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: defaultMargin),
            itemBuilder: (c, i) {
              return BudayaCard(
                otherBudaya: _budaya,
                model: _budaya[i].budaya,
                title: '${_budaya[i].budaya.title}',
                text: _budaya[i].province,
                imgUrl: '${_budaya[i].budaya.picture}',
              );
            },
          ));
    } else {
      return const Center(child: Text('No data'));
    }
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
    if (model.statusCode != null) {
      return Container(
          margin: const EdgeInsets.only(
            top: 15,
          ),
          height: 270.0,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: defaultMargin),
            itemBuilder: (c, i) {
              return ProvinceCard(
                title: '${model.data![i].name}',
                imgUrl: '${model.data![i].picture}',
                model: model.data![i],
              );
            },
          ));
    } else {
      return const Center(child: Text('No data'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(strokeWidth: 2, color: yellowColor))
        : ListView(children: [
            searchBar(),
            provinceTitle(),
            province(),
            budayaTitle(),
            budaya(),
          ]);
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    await ProvinceController().fetch().then((value) {
      ///clear recent data
      _budaya.clear();

      for (var e in value.data!) {
        if (e.tarianAdat != null) {
          setState(() {
            _budaya.add(Budaya(budaya: e.tarianAdat!, province: e.name!));
          });
        }
        if (e.pakaianAdat != null) {
          setState(() {
            _budaya.add(Budaya(budaya: e.pakaianAdat!, province: e.name!));
          });
        }
        if (e.rumahAdat != null) {
          setState(() {
            _budaya.add(Budaya(budaya: e.rumahAdat!, province: e.name!));
          });
        }
      }

      ///set province model
      setState(() {
        model = value;
      });

      setState(() {
        isLoading = false;
      });
    });
  }
}
