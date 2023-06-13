import 'package:flutter/material.dart';


class RowCircleAvatar extends StatelessWidget {
  const RowCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CircleAvatarIcon(iconAsset: 'assets/login/twitter.png'),
          SizedBox(width: 20,),
          _CircleAvatarIcon(iconAsset: 'assets/login/gmail.jpg'),
          SizedBox(width: 20,),
          _CircleAvatarIcon(iconAsset: 'assets/login/linkedin.png'),
        ],
      ),
    );
  }
}


class _CircleAvatarIcon extends StatelessWidget {
  const _CircleAvatarIcon({ 
    required this.iconAsset,
  });
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(iconAsset),
      maxRadius: 14,
    );
  }
}