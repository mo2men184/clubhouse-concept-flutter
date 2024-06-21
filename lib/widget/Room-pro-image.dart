import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widget/userProImg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.size = 42,
    this.isNew = false,
    this.isMuted = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: UserProfileImage(imageUrl: imageUrl, size: size),
              ),
              if (isNew)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Text(
                      '🎉',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              if (isMuted)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Icon(CupertinoIcons.mic_slash_fill),
                  ),
                ),
            ],
          ),
          Flexible(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
