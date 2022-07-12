import 'package:budaya/controllers/provinceController.dart';
import 'package:budaya/models/ProvinceModel.dart';
import 'package:budaya/theme.dart';
import 'package:budaya/widgets/special_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'home_page.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  bool isLoading = true;
  String address = 'Waiting connection';
  late ProvinceModel model;
  final List<Budaya> _budaya = [];

  @override
  void initState() {


    initGps();
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            strokeWidth: 2,
            color: yellowColor,
          ))
        : _body();
  }

  Widget _body() {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.location,
              color: yellowColor,
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Text(
              address,
              style: whiteTextStyle.copyWith(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      )),
      SliverToBoxAdapter(child: list()),
    ]);
  }

  Widget list() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.data!.length,
      itemBuilder: (c, i) {
        return SpecialTile(
            province: model.data![i].name!,
            model: _budaya[i].budaya,
            imgUrl: model.data![i].picture!,
            isProvince: true,
            provinceModel: model.data![i],
            text: model.data![i].name!);
      },
    );
  }

  void initGps() async {
    ///open loading
    setState(() {
      isLoading = true;
    });


    await initGpsPermission().then((value) async {
      await getAddress(value.latitude, value.longitude).then((value) {
        setState(() {
          address = value;
        });
      });
    });
  }

  Future<Position> initGpsPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddress(double lat, double lon) async {
    String _address = '';
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
      if (placeMarks.isNotEmpty) {
        var _place = placeMarks[0];
        _address = "${_place.administrativeArea}, ${_place.country}";
      }
    } catch (e) {
      _address = "Failed to get address, check your connection";
    }
    return _address;
  }

  void fetchData() async {
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
        model.data!.sort((a,b)=>a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      });
    });

    ///close loading
    setState(() {
      isLoading = false;
    });
  }
}
