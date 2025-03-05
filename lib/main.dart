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
        padding:  EdgeInsets.all(10.0),
        child: SafeArea(child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: CupertinoSearchTextField(

                ),
              ),

              Expanded(
                child: ListView(
                  children: [

                    CupertinoListTile(
                      title: Text('Software Upgraded Available'),
                      onTap: () {
                        // Navigator.push(context, CupertinoPageRoute(builder: (context) => WifiPage()),
                        // );



                      },

                      leading: Container(
                        padding: EdgeInsets.all(3),


                      ),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),


                    CupertinoListTile(
                      title: Text('Airplane Mode'),
                      onTap: () {
                        setState(() {
                          airplaneMode = !airplaneMode;
                        });
                      },
                      leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CupertinoColors.systemOrange,
                        ),
                        child: Icon(CupertinoIcons.airplane, color: CupertinoColors.white),
                      ),
                      trailing: CupertinoSwitch(value: airplaneMode, onChanged: (value) {
                          setState(() {
                            airplaneMode = !airplaneMode;
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
                      leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CupertinoColors.systemBlue,
                        ),
                        child: Icon(CupertinoIcons.wifi, color: CupertinoColors.white),
                      ),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),

                    CupertinoListTile(
                      title: Text('Bluetooth'),
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => BluetoothPage()),
                        );
                      },
                      additionalInfo: Text('On'),
                      leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CupertinoColors.systemBlue,
                        ),
                        child: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.white),
                      ),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),

                    CupertinoListTile(
                      title: Text('Cellular'),
                      onTap: () {
                        // setState(() {
                        //   wifiMode = !wifiMode;
                        // });
                      },
                      additionalInfo: Text('On'),
                      leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: CupertinoColors.systemGreen,
                        ),
                        child: Icon(Icons.cell_tower, color: CupertinoColors.white),
                      ),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
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


class WifiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Wi-Fi"),
      ),
      child: Padding(
        padding:  EdgeInsets.all(10.0),
        child: Center(child: Text(
            "Wi-Fi Settings Page", style: TextStyle(fontSize: 20, color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }
}


class BluetoothPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Bluetooth"),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(child: Text(
            "Bluetooth Settings Page", style: TextStyle(fontSize: 20, color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }
}
