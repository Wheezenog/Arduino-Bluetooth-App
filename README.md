# arduinohc06

A simple app made with flutter to control an arduino via Bluetooth

## Instructions for arduino:
+ Connect HC-06 Bluetooth module
    - Webpage on how to do this: [Arduino Projecthub](https://projecthub.arduino.cc/RucksikaaR/interfacing-the-hc-06-bluetooth-module-with-arduino-94aabd)

+ Check that the module can receive data using Arduino's build in Serial class
    - Information on that can be found here: [Arduino forum](https://forum.arduino.cc/t/serial-input-basics-updated/382007/2)
    - You can use the serial monitor to send data manually. [Arduino documentation](https://docs.arduino.cc/software/ide-v2/tutorials/ide-v2-serial-monitor/)

+ Send data manually using the serial monitor

+ Make an external LED or the built in one turn on upon receiving specific data.    
    - the built in LED can be accessed using `LED_BUILTIN`

> [!WARNING]
> Do not send strings as data or there will be a huge delay between when you send the input and when something happens. Use `int` or `char` instead.
        
For information on getting started with Arduino development, please reference their documentation (arduino docs)[https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/].

## Instructions for app development:
For app development with Flutter, use this package: [pub.dev](https://pub.dev/packages/bluetooth_classic). 
Use the example code to understand how the package works.

> [!TIP]
> Make sure you only have one instance of this package in your code. then you can use commands like `BluetoothClassic.connect()` and `BluetoothClassic.write()`

+ Make a page that will contain a list of all bluetooth devices that have been paired to your phone or tablet.

> [!NOTE]
> You will have to pair the bluetooth device to your phone or tablet in your devices bluetooth settings, not the app.

+ All these items should be buttons, so when you click on one make it connect to the device.
+ In a separate page, make two buttons, one for turning on the light, and one for turning off.
+ If a device is connected, make the buttons write a character or int to that bluetooth device

> [!TIP]
>make sure these inputs are the same ones that are expected in the Arduino's code.

## Final notes

This project is an example for how to connect Arduino, Bluetooth, and Flutter

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

For help with Arduino development, refer to their documentation (Arduino docs)[https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/]. 
This will help you get started with sketches and all the basics of developing with their Arduino IDE.
