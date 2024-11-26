<!-- # arduinohc06

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
        
For information on getting started with Arduino development, please reference their documentation: [arduino docs](https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/).


## Instructions for app development:
For implementing Bluetooth with Flutter, use this package: [pub.dev](https://pub.dev/packages/bluetooth_classic). 
Use the example code to understand how the package works.

> [!TIP]
> Make sure you only have one instance of this package in your code. Then you can use commands like `BluetoothClassic.connect()` and `BluetoothClassic.write()`

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

For help with Arduino development, refer to their documentation [Arduino docs](https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/). 
This will help you get started with sketches and all the basics of developing with their Arduino IDE. -->

# Arduino HC-06 Bluetooth Control

A simple app built with Flutter to control an Arduino via Bluetooth using the HC-06 Bluetooth module.

## Instructions for Arduino

1. **Connect the HC-06 Bluetooth Module to Arduino**  
   Follow this guide to wire the HC-06 Bluetooth module to your Arduino:  
   [Interfacing the HC-06 Bluetooth Module with Arduino - Arduino Projecthub](https://projecthub.arduino.cc/RucksikaaR/interfacing-the-hc-06-bluetooth-module-with-arduino-94aabd)

2. **Verify the Bluetooth Module Can Receive Data**  
   Ensure that your HC-06 module can receive data using Arduino's built-in Serial class.  
   - You can find detailed information here: [Serial Input Basics - Arduino Forum](https://forum.arduino.cc/t/serial-input-basics-updated/382007/2)
   - For additional guidance on using the serial monitor, check out the official [Arduino Serial Monitor documentation](https://docs.arduino.cc/software/ide-v2/tutorials/ide-v2-serial-monitor/).

3. **Send Data Manually Using the Serial Monitor**  
   You can use the Arduino IDE’s Serial Monitor to send data to the Arduino. This can be useful for testing communication with the HC-06 Bluetooth module.

4. **Control an External LED or Built-In LED**  
   You can program the Arduino to turn on either an external LED or the built-in LED upon receiving specific data from the Bluetooth module.  
   - The built-in LED can be accessed using `LED_BUILTIN`.

   > [!WARNING] 
   > Avoid sending strings as data, as this can cause significant delays between sending the input and receiving the response. It's best to use `int` or `char` types instead.

For further details on getting started with Arduino, visit the official [Arduino Documentation](https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/).

---

## Instructions for App Development

1. **Bluetooth Integration with Flutter**  
   Use the [bluetooth_classic package](https://pub.dev/packages/bluetooth_classic) to integrate Bluetooth functionality into your Flutter app. You can refer to the example code provided with the package to understand how to use it.

   > [!TIP] 
   > Make sure that you only include one instance of the `bluetooth_classic` package in your project. You can use commands like `BluetoothClassic.connect()` and `BluetoothClassic.write()` to interact with the Bluetooth device.

2. **Create a Device List Page**  
   - Build a page in your app that displays a list of all Bluetooth devices that have been paired with your phone or tablet.
   
   > [!NOTE] 
   > Ensure that the Bluetooth device is paired through your phone or tablet’s Bluetooth settings, not through the app.

3. **Device Connection Button**  
   - Each paired Bluetooth device should be shown as a button. When clicked, the button should establish a connection with the corresponding Bluetooth device.

4. **Control Page for LED**  
   - Create a separate page with two buttons: one for turning the LED on and the other for turning it off.
   - If a Bluetooth device is connected, these buttons should send a character or integer to the device, triggering the corresponding action on the Arduino.

   >  [!TIP]
   > Ensure that the data sent matches the expected input format on the Arduino (e.g., `char` or `int`).

---

## Final Notes

This project demonstrates how to connect Arduino, Bluetooth, and Flutter to create a simple control interface for hardware.

For additional help with Flutter development, visit the [Flutter Documentation](https://docs.flutter.dev). It includes tutorials, samples, and a full API reference for mobile development.

For Arduino development assistance, check out the [Arduino Documentation](https://docs.arduino.cc/learn/starting-guide/getting-started-arduino/). It will guide you through the basics of writing Arduino sketches and using the Arduino IDE.

