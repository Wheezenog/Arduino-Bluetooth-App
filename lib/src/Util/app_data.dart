import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class AppData {
  static var bluetoothClassicPlugin = BluetoothClassic();
  static String platformVersion = 'unknown';
  static bool deviceConnected = false;
  static List<Device> devices = [];
  // List<Device> _discoveredDevices = [];
  // bool _scanning = false;
  // int deviceStatus = Device.disconnected;
  // Uint8List _data = Uint8List(0);

  static bool permissionsGranted = false;

  static Logger log = Logger(printer: PrettyPrinter(methodCount: 0));

  static void initState() {
    initPlatformState();
    checkPermissions();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  static Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await bluetoothClassicPlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //     platformVersion = platformVersion;
    // }
  }

  static Future<void> getDevices() async {
    var res = await bluetoothClassicPlugin.getPairedDevices();
    devices = res;
  }

  static Future<void> checkPermissions() async {
    Permission.bluetoothConnect.request();
    if (await Permission.bluetoothConnect.isGranted) {
      permissionsGranted = true;
      getDevices();
    } else {
      permissionsGranted = false;
    }
  }

  static void bluetoothWrite(String s){
    bluetoothClassicPlugin.write(s);
  }
}
