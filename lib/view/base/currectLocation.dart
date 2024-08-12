import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/screens/bottom_navigation/bottom_navigation.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String address = '' ;
  final Completer<GoogleMapController> _controller = Completer();


  Future<Position> _getUserCurrentLocation() async {


    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();

  }


  final List<Marker> _markers =  <Marker>[];

  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14,
  );


  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(
            title: 'some Info '
        )
    ),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(list);
    //loadData();
  }

  loadData(){
    _getUserCurrentLocation().then((value) async {
      _markers.add(
          Marker(
              markerId: const MarkerId('SomeId'),
              position: LatLng(value.latitude ,value.longitude),
              infoWindow:  InfoWindow(
                  title: address
              )
          )
      );

      final GoogleMapController controller = await _controller.future;
      CameraPosition _kGooglePlex =  CameraPosition(
        target: LatLng(value.latitude ,value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeSMALL),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Theme.of(context).disabledColor),
                          borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault)),
                      child: Row(children: [
                        Icon(Icons.location_on,
                            size: 25, color: Theme.of(context).hintColor),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Expanded(
                          child: Text(
                            'WEGP+827, Subhash Nagar, jwalapur...',
                            style: interMedium.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: Dimensions.paddingSizeSMALL),
                        Icon(Icons.search,
                            size: 25,
                            color: Theme.of(context).textTheme.bodyLarge!.color),
                      ]),
                    ),

                    CustomButton(title: "pick_location".tr, onPressed: (){

                      _getUserCurrentLocation().then((value) async {
                        _markers.add(
                            Marker(
                                markerId: const MarkerId('SomeId'),
                                position: LatLng(value.latitude ,value.longitude),
                                infoWindow:  InfoWindow(
                                    title: address
                                )
                            )
                        );
                        final GoogleMapController controller = await _controller.future;

                        CameraPosition _kGooglePlex =  CameraPosition(
                          target: LatLng(value.latitude ,value.longitude),
                          zoom: 14,
                        );
                        controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

                        List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude ,value.longitude);


                        final add = placemarks.first;
                        address = add.locality.toString() +" "+add.administrativeArea.toString()+" "+add.subAdministrativeArea.toString()+" "+add.country.toString();

                        setState(() {

                        });
                      });

                      Get.to(BottomNavigationBarScreen());
                    },radius: 10,),

                  ],
                ),

                GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(_markers),
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
