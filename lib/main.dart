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

class WifiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Wi-Fi"),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "Wi-Fi Settings Page",
            style: TextStyle(fontSize: 20, color: CupertinoColors.white),
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
        child: Center(
          child: Text(
            "Bluetooth Settings Page",
            style: TextStyle(fontSize: 20, color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }
}
