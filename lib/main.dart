import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(CupertinoApp(
  theme: CupertinoThemeData(
    brightness: Brightness.dark
  ),
  debugShowCheckedModeBanner: false,
  home: MyApp(),));


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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), // Adjust size
          ),
        ),

        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(child: Column(
      children: [
           Expanded(
             child: ListView(
                 children: [
                   CupertinoListTile(

                       title: Text('Airplane Mode'),
                   onTap: (){
                     // setState(() {
                     //   airplaneMode = !airplaneMode;
                     // });
                   },


                     // padding: EdgeInsets.all(20),
                     // backgroundColor: Colors.grey[200],
                   leading: Container(
                     padding: EdgeInsets.all(3),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4),
                         color: CupertinoColors.systemOrange
                       ),
                       child: Icon(CupertinoIcons.airplane, color: CupertinoColors.white,)),

                     trailing: CupertinoSwitch(value: airplaneMode, onChanged: (value){
                       setState(() {
                         airplaneMode = !airplaneMode;
                       });
                     }),
                   ),





                   CupertinoListTile(

                     title: Text('Wi-Fi'),
                     onTap: (){
                       setState(() {
                         wifiMode = !wifiMode;
                       });
                     },

                     // padding: EdgeInsets.all(20),
                     // backgroundColor: Colors.grey[200],
                     additionalInfo: Text('HCC_ICSLab'),
                     // subtitle: Text('data'),
                     leading: Container(
                         padding: EdgeInsets.all(3),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4),
                             color: CupertinoColors.systemBlue
                         ),
                         child: Icon(CupertinoIcons.wifi, color: CupertinoColors.white,)),

                     trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                   ),




                   CupertinoListTile(

                       title: Text('Bluetooth'),
                       onTap: (){
                         // setState(() {
                         //   wifiMode = !wifiMode;
                         // });
                       },

                       // backgroundColorActivated: Colors.greenAccent,

                       // padding: EdgeInsets.all(20),
                       // backgroundColor: Colors.grey[200],
                       additionalInfo: Text('On'),
                       // subtitle: Text('data'),
                       leading: Container(
                           padding: EdgeInsets.all(3),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4),
                               color: CupertinoColors.systemBlue
                           ),
                           child: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.white,)),

                       trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                   ),

                   CupertinoListTile(

                       title: Text('Cellular'),
                       onTap: (){
                         // setState(() {
                         //   wifiMode = !wifiMode;
                         // });
                       },

                       // backgroundColorActivated: Colors.greenAccent,

                       // padding: EdgeInsets.all(20),
                       // backgroundColor: Colors.grey[200],
                       additionalInfo: Text('On'),
                       // subtitle: Text('data'),
                       leading: Container(
                           padding: EdgeInsets.all(3),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4),
                               color: CupertinoColors.systemGreen
                           ),
                           child: Icon(Icons.cell_tower, color: CupertinoColors.white,)),

                       trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                   ),




                 ],
               ),
           )
      ],
      )),
    ));
  }
}
