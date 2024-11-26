import 'package:arduinohc06/src/Widgets/drawer/sidebar.dart';
import 'package:arduinohc06/src/util/app_data.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class Devices extends StatefulWidget {
  static const routeName = '/devices_page';

  const Devices({super.key});

  @override
  State<Devices> createState() => DevicesState();
}

class DevicesState extends State<Devices> {
  late AnimationController controller;
  bool determinate = false;

  Logger log = Logger(printer: PrettyPrinter(methodCount: 0));
  static const connecting = SnackBar(
    backgroundColor:  Color(0xffEF233C),
    content: Text('connecting...', style: TextStyle(color:  Color(0xffEDF2F4))),
  );
  static SnackBar connected = SnackBar(
    backgroundColor: const Color(0xffEF233C),
    content: const Text('Connected!', style: TextStyle(color:  Color(0xffEDF2F4))),
    action: SnackBarAction(
      textColor: const Color(0xffEDF2F4),
      label: 'Okay',
      onPressed: () {
        //okay
      },
    ),
  );

  static SnackBar failedToConnect = SnackBar(
        backgroundColor: const Color(0xffEF233C),
    content: const Text('Failed to connect to device.', style: TextStyle(color:  Color(0xffEDF2F4))),
    action: SnackBarAction(
      textColor: const Color(0xffEDF2F4),
      label: 'Okay',
      onPressed: () {
        //not real
      },
    ),
  );
  Future<void> connectDevice(Device device) async {
    try {
      await AppData.bluetoothClassicPlugin
          .connect(device.address, "00001101-0000-1000-8000-00805f9b34fb");
      AppData.deviceConnected = true;
            if(mounted){
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(connected);
      }
    } catch (e) {
      log.e('Failed to connect to device');
      if(mounted){
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(failedToConnect);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffEF233C),
          foregroundColor: const Color(0xffEDF2F4),
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    // Open the drawer when icon button is clicked.
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu));
            },
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          centerTitle: true,
          title: const Text('Devices'),
        ),
        drawer: const Sidebar(), // Custom made drawer class.
        body: (AppData.permissionsGranted)
            ? RefreshIndicator(
                onRefresh: AppData.getDevices,
                child: ListView.builder(
                  itemCount: AppData.devices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xff2B2D42),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(connecting);
                            connectDevice(AppData.devices[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppData.devices[index].name!,
                                    style: const TextStyle(
                                        fontSize: 20, color: Color(0xffEDF2F4)),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    AppData.devices[index].address,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff8D99AE)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: RefreshIndicator(
                  onRefresh: AppData.checkPermissions,
                  child: ListView(
                      // physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const Text(
                            'Permissions not granted, please enable "Nearby devices" in app settings'),
                        TextButton(
                            onPressed: () {
                              openAppSettings();
                            },
                            child: const Text('Open app settings'))
                      ]),
                ),
              ),
      ),
    );
  }
}
