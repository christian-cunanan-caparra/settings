import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CupertinoApp(
  theme: CupertinoThemeData(brightness: Brightness.dark),
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool airplaneMode = false;
  bool wifiMode = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text(
          'Settings',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CupertinoSearchTextField(),
              ),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CupertinoColors.systemGrey,
                      child: Text('CCC', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Christian C. Caparra',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Apple Account, iCloud, and more',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.chevron_right, color: Colors.grey)
                  ],
                ),
              ),

              SizedBox(height: 10),
              CupertinoListTile(
                title: Text("Your Phone can't be backed up"),

                trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
              ),
              SizedBox(height: 40),
              Container(

                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CupertinoListTile(
                  title: Text("Software Update Available"),

                  trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                ),
              ),

              SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.darkBackgroundGray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      CupertinoListTile(
                        title: Text('Airplane Mode'),
                        onTap: () {
                          setState(() {
                            airplaneMode = !airplaneMode;
                          });
                        },


                        leading: Icon(CupertinoIcons.airplane, color: CupertinoColors.systemOrange),
                        trailing: CupertinoSwitch(
                          value: airplaneMode,
                          onChanged: (value) {
                            setState(() {
                              airplaneMode = value;
                            });
                          },
                        ),
                      ),

                      CupertinoListTile(
                        title: Text('Wi-Fi'),
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => WifiPage()),
                          );
                        },
                        additionalInfo: Text('HCC_ICSLab'),
                        leading: Icon(CupertinoIcons.wifi, color: CupertinoColors.systemBlue),
                        trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                      ),

                      CupertinoListTile(
                        title: Text('Bluetooth'),
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => BluetoothPage()),
                          );
                        },
                        additionalInfo: Text('On'),
                        leading: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.systemBlue),
                        trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                      ),

                      CupertinoListTile(
                        title: Text('Cellular'),
                        onTap: () {},
                        additionalInfo: Text('On'),
                        leading: Icon(Icons.cell_tower, color: CupertinoColors.systemGreen),
                        trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WifiPage extends StatefulWidget {
  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  bool isWifiEnabled = true;
  String connectedNetwork = "MyHomeWiFi";

  List<String> savedNetworks = [
    "MyHomeWiFi",
    "WorkNetwork",
    "CoffeeShop_WiFi",
  ];

  List<String> otherNetworks = [
    "PublicHotspot",
    "Guest_WiFi",
    "Library_WiFi",
    "Mall_FreeWiFi",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Wi-Fi"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Wi-Fi Toggle
            CupertinoListTile(
              title: Text("Wi-Fi"),
              trailing: CupertinoSwitch(
                value: isWifiEnabled,
                onChanged: (value) {
                  setState(() {
                    isWifiEnabled = value;
                    if (!isWifiEnabled) {
                      connectedNetwork = "";
                    }
                  });
                },
              ),
            ),
            Divider(),

            // Saved Networksssssssss
            if (isWifiEnabled) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Saved Networks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Column(
                children: savedNetworks.map((network) {
                  bool isConnected = network == connectedNetwork;
                  return CupertinoListTile(
                    title: Text(network),
                    trailing: isConnected
                        ? Icon(CupertinoIcons.checkmark, color: CupertinoColors.activeBlue)
                        : null,
                    onTap: () {
                      setState(() {
                        connectedNetwork = network;
                      });
                    },
                  );
                }).toList(),
              ),

              Divider(),

              // Other Networks
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Other Networks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Column(
                children: otherNetworks.map((network) {
                  return CupertinoListTile(
                    title: Text(network),
                    trailing: Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey),
                    onTap: () {
                      setState(() {
                        connectedNetwork = network;
                        if (!savedNetworks.contains(network)) {
                          savedNetworks.add(network);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  bool isBluetoothOn = true;
  List<String> devices = [
    "BEATS PRO90",
    "Bluetooth",
    "Infinix-T02",
    "JBL WAVE BUDS",
    "K12",
    "realme Buds T910"
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back, color: CupertinoColors.systemBlue),
          onPressed: () => Navigator.pop(context),
        ),
        middle: Text("Bluetooth"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Black Box for Bluetooth Icon
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: CupertinoColors.black, // Black background
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Icon(
                      CupertinoIcons.bluetooth,
                      color: CupertinoColors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bluetooth",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CupertinoColors.white),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 14, color: CupertinoColors.white),
                      children: [
                        TextSpan(text: "Connect to accessories for streaming music, calls, and gaming. "),
                        TextSpan(
                          text: "Learn more...",
                          style: TextStyle(color: CupertinoColors.systemBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CupertinoListTile(
              title: Text("Bluetooth", style: TextStyle(fontSize: 18)),
              trailing: CupertinoSwitch(
                value: isBluetoothOn,
                onChanged: (value) {
                  setState(() {
                    isBluetoothOn = value;
                  });
                },
              ),
            ),
            Divider(height: 1),
            CupertinoListTile(
              title: Text("Allow New Connections", style: TextStyle(color: CupertinoColors.systemBlue)),
              subtitle: Text("New connections disabled from Control Center"),
            ),
            Divider(height: 1),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("MY DEVICES", style: TextStyle(color: CupertinoColors.systemGrey)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: isBluetoothOn ? devices.length : 0,
                itemBuilder: (context, index) {
                  return CupertinoListTile(
                    title: Text(devices[index]),
                    additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                    trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


