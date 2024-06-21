import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widget/userProImg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/RoomCard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 28,
          ),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.envelope_open,
              color: Colors.black,
              size: 24,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.calendar,
              color: Colors.black,
              size: 26,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
              size: 26,
            ),
            onPressed: (){},
          ),
          GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfileImage(
                size: 34,
                imageUrl: currentUser.imageURL,
              ),
            ),
          ),
        ],
      ),
      body: 
        Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [
                ...roomlist.map((e) => RoomCard(room: e))
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton.icon(onPressed: (){}, icon: Icon(
                CupertinoIcons.add,
                size: 21,
                color: Colors.white,
              ),
                label: Text('Start a room',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  primary: Theme.of(context).accentColor,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  )
                ),
              ),
            ),
          ],
        )
    );
  }
}


