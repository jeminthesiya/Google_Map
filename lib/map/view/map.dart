import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_map/map/controller/map_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  LocationController locationController = Get.put(LocationController());

  List l1 = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("LOCATION"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     var Status = await Permission.location.status;
                //     if (Status.isDenied) {
                //       Permission.location.request();
                //     }
                //   },
                //   child: Text("Permission"),
                // ),
                InkWell(
                  onTap: () async {
                    var Status = await Permission.location.status;
                    if (Status.isDenied) {
                      Permission.location.request();
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "PERMISSION",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     Position position = await Geolocator.getCurrentPosition(
                //         desiredAccuracy: LocationAccuracy.high);
                //
                //     locationController.lan.value = position.longitude;
                //     locationController.lat.value = position.latitude;
                //   },
                //   child: Text("Locket"),
                // ),
                InkWell(
                  onTap: () async {
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    locationController.lan.value = position.longitude;
                    locationController.lat.value = position.latitude;
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LOCKET",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Obx(
                  () => Text(
                    "Lan :${locationController.lan.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Obx(
                  () => Text(
                    "Lat :${locationController.lan.value}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     List<Placemark> place = await placemarkFromCoordinates(
                //         locationController.lat.value,
                //         locationController.lan.value);
                //     locationController.add.value = place;
                //   },
                //   child: Text("Address"),
                // ),
                InkWell(
                  onTap: () async {
                    List<Placemark> place = await placemarkFromCoordinates(
                        locationController.lat.value,
                        locationController.lan.value);
                    locationController.add.value = place;
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "ADDRESS",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Text(
                    locationController.add.value.isEmpty
                        ? " "
                        : "${locationController.add[0]}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pushNamed(
                      context,
                      'map',
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "MAP",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
