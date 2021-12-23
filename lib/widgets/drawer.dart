import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 17, 68, 107),),
        child: ListView(
          children: const [
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Color.fromARGB(255, 26, 71, 106)),
                accountEmail: Text("kausar.cse16@gmail.com"),
                accountName: Text("Kausar"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/kausar.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color:Colors.white ),
              title: Text("Home",  style: TextStyle(color:Colors.white,fontSize: 15),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color:Colors.white ),
              title: Text("Profile",  style: TextStyle(color:Colors.white,fontSize: 15),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color:Colors.white ),
              title: Text("Mail me",  style: TextStyle(color:Colors.white,fontSize: 15),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person, color:Colors.white ),
              title: Text("About",  style: TextStyle(color:Colors.white,fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
