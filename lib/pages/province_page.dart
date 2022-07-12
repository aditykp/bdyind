import 'package:budaya/controllers/provinceController.dart';
import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/theme.dart';
import 'package:budaya/widgets/special_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class ProvincePage extends StatefulWidget {
  const ProvincePage({Key? key}) : super(key: key);

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
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
          const SizedBox(height: 20),
          TextField(
            controller: searchTextController,
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
              suffix: GestureDetector(
                  onTap: () => setState(() {
                    searchTextController.clear();
                    isSearch = false;
                  }),
                  child: Icon(
                    CupertinoIcons.clear,
                    color: whiteColor,
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor2),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor2), borderRadius: BorderRadius.circular(defaultRadius)),
            ),
            onChanged: (value) {
              if (searchTextController.text.isNotEmpty) {
                setState(() {
                  isSearch = true;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.data!.length,
      itemBuilder: (c, i) {
        if(isSearch){
          if (model.data![i].name!.toLowerCase().contains(searchTextController.text.toLowerCase())) {
            return SpecialTile(
                province: model.data![i].name!,
                model: _budaya[i].budaya,
                imgUrl: model.data![i].picture!,
                isProvince: true,
                provinceModel: model.data![i],
                text: model.data![i].name!);
          }else{
            return const Offstage();
          }
        }else{
          return SpecialTile(
              province: model.data![i].name!,
              model: _budaya[i].budaya,
              imgUrl: model.data![i].picture!,
              isProvince: true,
              provinceModel: model.data![i],
              text: model.data![i].name!);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(strokeWidth: 2, color: yellowColor))
        : CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(child: searchBar()),
              SliverToBoxAdapter(child: list()),
            ],
          );
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
          if (mounted) {
            setState(() {
              _budaya.add(Budaya(budaya: e.tarianAdat!, province: e.name!));
            });
          }
        }
        if (e.pakaianAdat != null) {
          if (mounted) {
            setState(() {
              _budaya.add(Budaya(budaya: e.pakaianAdat!, province: e.name!));
            });
          }
        }
        if (e.rumahAdat != null) {
          if (mounted) {
            setState(() {
              _budaya.add(Budaya(budaya: e.rumahAdat!, province: e.name!));
            });
          }
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
