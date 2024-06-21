import 'dart:math';

import 'package:clubhouse_ui/Models/Room.dart';
import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widget/Room-pro-image.dart';
import 'package:clubhouse_ui/widget/userProImg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('Hallway'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.doc,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
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
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  children: room.speakers
                      .map((e) => RoomUserProfile(
                            imageUrl: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                            isMuted: Random().nextBool(),
                          ))
                      .toList()),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by Speakers',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15,
                  children: room.followedBySpeakers
                      .map((e) => RoomUserProfile(
                    imageUrl: e.imageURL,
                    name: e.firstName,
                    size: 66,
                    isNew: Random().nextBool(),

                  ))
                      .toList()),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14),
              sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15,
                  children: room.others
                      .map((e) => RoomUserProfile(
                    imageUrl: e.imageURL,
                    name: e.firstName,
                    size: 66,
                    isNew: Random().nextBool(),

                  ))
                      .toList()),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 50)),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){},
                child: Text(
                  '✌🏻Leave quitely',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[200],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(CupertinoIcons.add,
                    size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
