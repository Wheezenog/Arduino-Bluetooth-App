import 'package:arduinohc06/src/Widgets/drawer/sidebar.dart';
import 'package:arduinohc06/src/util/app_data.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var log = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    AppData.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!AppData.deviceConnected) {
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
            title: const Text('Home'),
          ),
          drawer: const Sidebar(), // Custom made drawer class.
          body: const Center(
            child: Text('No device connected.'),
          ),
        ),
      );
    } else {
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
            title: const Text('Home'),
          ),
          drawer: const Sidebar(), // Custom made drawer class.
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                height: 200,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2B2D42),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                  onPressed: () {
                    log.d('Turn light on');
                    try {
                      AppData.bluetoothWrite('a');
                    } catch (e) {
                      log.e('Failed to write "a" to device.');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('ON', style: TextStyle(color: Color(0xffEDF2F4), fontSize: 50, fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              const SizedBox(height: 75),
              SizedBox(
                height: 200,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2B2D42),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                  onPressed: () {
                    log.d('Turn light off');
                    try {
                      AppData.bluetoothWrite('b');
                    } catch (e) {
                      log.e('Failed to write "b" to device.');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'OFF',
                      style: TextStyle(color: Color(0xffEDF2F4), fontSize: 50, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
            ]),
          ),
        ),
      );
    }
  }
}
