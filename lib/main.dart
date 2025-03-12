import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  bool airplaneMode = false;
  bool wifiMode = true;
  bool cellularMode = true;
  bool isBluetoothOn = true;
  bool personalHotspot = false;
  int batteryLevel = 75;

  void _showSoftwaresActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Software Updates'),

        actions: <Widget>[
          CupertinoActionSheetAction(child: Text('Online Updates'),
            onPressed: () {




            },
          ),
          CupertinoActionSheetAction(child: Text('Local Updates'),
            onPressed: () {




            },
          ),



        ],
        cancelButton: CupertinoActionSheetAction(child: Text('Cancel',style: TextStyle(color: CupertinoColors.destructiveRed),),
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

  void _showMembersActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Members'),

        actions: <Widget>[
          CupertinoActionSheetAction(child: Text('John Lloyd Guevarra'),
            onPressed: () {




            },
          ),
          CupertinoActionSheetAction(child: Text('Jhuniel Galang'),
            onPressed: () {




            },
          ),
          CupertinoActionSheetAction(child: Text('Michael Deramos'),
            onPressed: () {




            },
          ),
          CupertinoActionSheetAction(child: Text('Samuel Miranda'),
            onPressed: () {






            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(child: Text('Cancel',style: TextStyle(color: CupertinoColors.destructiveRed),),

          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Settings', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CupertinoSearchTextField(),
            ),


            SizedBox(height: 10),



            GestureDetector(
              onTap: () {
                _showMembersActionSheet(context);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CupertinoColors.systemGrey,
                      child: Text('CC', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Christian C. Caparra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text('Apple Account, iCloud, and more', style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),


            Container(
              decoration: BoxDecoration(color: CupertinoColors.darkBackgroundGray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: CupertinoListTile(
                title: Text("Your iPhone can't be backed up", style: TextStyle(color: Colors.white)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("1", style: TextStyle(color: Colors.white, fontSize: 14,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),


            GestureDetector(
              onTap: () {
                _showSoftwaresActionSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: CupertinoListTile(
                  title: Text("Software Update Available", style: TextStyle(color: Colors.white),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: CupertinoColors.systemRed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("1", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: Text('Airplane Mode', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      setState(() {airplaneMode = !airplaneMode;
                      if (airplaneMode) {wifiMode = false; cellularMode = false; personalHotspot = false;
                      }
                      });
                    },
                    leading: Icon(CupertinoIcons.airplane, color: CupertinoColors.systemOrange),
                    trailing: CupertinoSwitch(value: airplaneMode, onChanged: (value) {
                      setState(() {
                        airplaneMode = value; if (airplaneMode) {
                          wifiMode = false;
                          cellularMode = false;
                          personalHotspot = false;
                        }
                      });
                    },
                    ),
                  ),

                  CupertinoListTile(
                    title: Text('Wi-Fi', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      if (!airplaneMode) {Navigator.push(
                          context, CupertinoPageRoute(
                          builder: (context) => WifiPage()));
                      }
                    },
                    additionalInfo: Text(airplaneMode ? 'Unable to connect' : wifiMode ? 'HCC_ICSLab' : 'On',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      CupertinoIcons.wifi, color: airplaneMode
                        ? CupertinoColors.systemGrey
                        : CupertinoColors.systemBlue,
                    ),
                    trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ),

                  CupertinoListTile(
                    title: Text('Bluetooth', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                          context, CupertinoPageRoute(
                          builder: (context) => BluetoothPage()));
                    },
                    additionalInfo: Text('On', style: TextStyle(color: Colors.white)),
                    leading: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.systemBlue),
                    trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ),

                  CupertinoListTile(
                    title: Text('Cellular', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                    additionalInfo: Text(airplaneMode ? 'Off' : 'On',
                        style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.cell_tower, color: airplaneMode
                        ? CupertinoColors.systemGrey
                        : CupertinoColors.systemGreen,
                    ),
                    trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ),




                  CupertinoListTile(title: Text('Personal Hotspot', style: TextStyle(color: Colors.white)),
                    onTap: airplaneMode ? null : () {},
                    additionalInfo: Text(airplaneMode ? 'Off' : 'Off', style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(CupertinoIcons.personalhotspot,
                      color: airplaneMode ? CupertinoColors.systemGrey : CupertinoColors.systemGreen, // Grey if Airplane Mode is ON, Green if OFF
                    ),
                    trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ),

                  CupertinoListTile(
                    title: Text('Battery', style: TextStyle(color: Colors.white)),
                    leading: Icon(batteryLevel > 20
                        ? CupertinoIcons.battery_full
                        : CupertinoIcons.battery_25,
                      color: batteryLevel > 20
                          ? CupertinoColors.systemGreen
                          : CupertinoColors.systemRed,
                    ),
                    trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
                  ),
                ],
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
  const WifiPage({super.key});

  @override
  WifiPageState createState() => WifiPageState();
}

class WifiPageState extends State<WifiPage> {
  bool isWifiEnabled = true;
  String connectedNetwork = "HCCJ_CSLab";
  bool showMyNetworks = false;
  bool showOtherNetworks = false;
  bool isLoading = true; // Start loading immediately

  @override
  void initState() {
    super.initState();
    _startLoadingNetworks();
  }

  Future<void> _startLoadingNetworks() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3)); // Simulating loading

    setState(() {
      showMyNetworks = true;
    });

    await Future.delayed(Duration(seconds: 3)); // More delay for other networks

    setState(() {
      showOtherNetworks = true;
      isLoading = false; // Hide loading indicator
    });
  }

  void toggleWifi(bool value) {
    setState(() {
      isWifiEnabled = value;
      showMyNetworks = false;
      showOtherNetworks = false;
      isLoading = value; // Restart loading only if Wi-Fi is turned on
    });

    if (value) {
      _startLoadingNetworks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Wi-Fi"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text("Edit", style: TextStyle(color: CupertinoColors.activeBlue)),
          onPressed: () {},
        ),
      ),
      child: SafeArea(child: ListView(
          children: [
            SizedBox(height: 15),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray, borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: CupertinoColors.black, borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      CupertinoIcons.wifi,
                      color: CupertinoColors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Wi-Fi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CupertinoColors.white),
                  ),
                  SizedBox(height: 5),
                  Text("Connect to available networks and manage your Wi-Fi settings.", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: CupertinoColors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CupertinoListTile(
              title: Text("Wi-Fi", style: TextStyle(fontSize: 18)),
              trailing: CupertinoSwitch(value: isWifiEnabled, onChanged: toggleWifi,
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("MY NETWORKS", style: TextStyle(color: CupertinoColors.systemGrey, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),

            if (isWifiEnabled && showMyNetworks) ...[
              CupertinoListTile(
                title: Text("_FREE Smart WIFI @HCC"),
                trailing: connectedNetwork == "_FREE Smart WIFI @HCC"
                    ? Icon(CupertinoIcons.checkmark, color: CupertinoColors.activeBlue)
                    : Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey),
                onTap: () {
                  setState(() {
                    connectedNetwork = "_FREE Smart WIFI @HCC";
                  });
                },
              ),
              CupertinoListTile(
                title: Text("HCC_CPeLab"),
                trailing: connectedNetwork == "HCC_CPeLab"
                    ? Icon(CupertinoIcons.checkmark, color: CupertinoColors.activeBlue)
                    : Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey), onTap: () {
                  setState(() {
                    connectedNetwork = "HCC_CPeLab";
                  });
                },
              ),
            ],

            if (isWifiEnabled) Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16), child: Row(
                children: [
                  Text("OTHER NETWORKS", style: TextStyle(color: CupertinoColors.systemGrey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  if (isWifiEnabled && isLoading) CupertinoActivityIndicator(),
                ],
              ),
            ),

            if (isWifiEnabled && showOtherNetworks) ...[
              CupertinoListTile(
                title: Text("Latina"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.lock, color: CupertinoColors.systemGrey),
                    SizedBox(width: 10),
                    Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey),
                  ],
                ),
                onTap: () {},
              ),
              CupertinoListTile(
                title: Text("qwerty"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.lock, color: CupertinoColors.systemGrey),
                    SizedBox(width: 10),
                    Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey),
                  ],
                ),
                onTap: () {},
              ),
            ],
            Divider(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ask to Join Networks", style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Text("Notify", style: TextStyle(color: CupertinoColors.systemGrey)),
                      SizedBox(width: 5),
                      Icon(CupertinoIcons.chevron_right, color: CupertinoColors.systemGrey),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Known networks will be joined automatically. If no known networks are available, you will be notified of available networks.",
                style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
                softWrap: true,
              ),
            ),
            Divider(),

            CupertinoListTile(
              title: Text("Auto-Join Hotspot"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ask to Join", style: TextStyle(color: CupertinoColors.systemGrey)),
                  Icon(CupertinoIcons.forward, color: CupertinoColors.systemGrey),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Allow this device to automatically discover nearby personal hotspots when no Wi-Fi network is available.",
                style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




void main() => runApp(CupertinoApp(
  theme: CupertinoThemeData(brightness: Brightness.dark),
  debugShowCheckedModeBanner: false,
  home: TrapPage(),

));







class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  BluetoothPageState createState() => BluetoothPageState();
}



class BluetoothPageState extends State<BluetoothPage> {
  bool isBluetoothOn = true;
  bool isLoading = true;
  bool showMyDevices = false;
  bool showOtherDevices = false;

  @override
  void initState() {
    super.initState();
    _startLoadingDevices();
  }

  Future<void> _startLoadingDevices() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      showMyDevices = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      showOtherDevices = true;
      isLoading = false;
    });
  }

  void toggleBluetooth(bool value) {
    setState(() {
      isBluetoothOn = value;
      showMyDevices = false;
      showOtherDevices = false;
      isLoading = value;
    });

    if (value) {
      _startLoadingDevices();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back, color: CupertinoColors.systemBlue, size: 35), onPressed: () => Navigator.pop(context),
        ),
        middle: Text("Bluetooth"),
      ),
      child: SafeArea(child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CupertinoColors.black, borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        CupertinoIcons.bluetooth,
                        color: CupertinoColors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Bluetooth", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CupertinoColors.white),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Connect to accessories you can use for activities such as streaming music, making phone calls, and gaming.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: CupertinoColors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Bluetooth Toggle
              CupertinoListTile(
                title: Text("Bluetooth", style: TextStyle(fontSize: 18)),
                trailing: CupertinoSwitch(
                  value: isBluetoothOn,
                  onChanged: toggleBluetooth,
                ),
              ),
              Divider(height: 1),

              CupertinoListTile(
                title: Text("Allow New Connections", style: TextStyle(color: CupertinoColors.systemBlue)),
              ),
              Divider(height: 1),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "New connections disabled from Control Center", style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("MY DEVICES", style: TextStyle(color: CupertinoColors.systemGrey, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),

              if (isBluetoothOn && showMyDevices) ...[
                CupertinoListTile(
                  title: Text("BEATS PRO90"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
                CupertinoListTile(
                  title: Text("Bluetooth"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
                CupertinoListTile(
                  title: Text("Infinix-T02"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
                CupertinoListTile(
                  title: Text("JBL WAVE BUDS"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
                CupertinoListTile(
                  title: Text("K12"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
                CupertinoListTile(
                  title: Text("realme Buds T910"),
                  additionalInfo: Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                  trailing: Icon(CupertinoIcons.info_circle, color: CupertinoColors.systemBlue),
                  onTap: () {},
                ),
              ],

              Divider(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text("OTHER DEVICES", style: TextStyle(color: CupertinoColors.systemGrey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    if (isBluetoothOn && isLoading) CupertinoActivityIndicator(),
                  ],
                ),
              ),

              if (isBluetoothOn && showOtherDevices) ...[
                CupertinoListTile(title: Text("Accessory"),
                ),
                CupertinoListTile(
                  title: Text("Accessory"),
                ),
              ],
              SizedBox(height: 20), // Extra space at the bottom

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("To pair an Apple Watch with your iPhone, go to the", style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Apple Watch App", style: TextStyle(color: CupertinoColors.systemBlue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







class TrapPage extends StatelessWidget {
  const TrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("ADMIN"),
      ),
      child: SafeArea(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.exclamationmark_triangle_fill, size: 60, color: CupertinoColors.systemRed,
          ),
          SizedBox(height: 20),
          Text("MwaMwaaaaa!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: CupertinoColors.systemRed,
          ),
          ),
          SizedBox(height: 10),
          Text("Kbye..!", style: TextStyle(fontSize: 18, color: CupertinoColors.systemGrey,
          ),
          ),
        ],
      ),
      ),
      ),
    );
  }
}


