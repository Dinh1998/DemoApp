import 'package:flutter/material.dart';

class NavBottomBar extends StatefulWidget {
  const NavBottomBar({Key? key}) : super(key: key);

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navBottomItems(
            index: 0, icon: Icons.messenger, label: 'Message', onTap: () {}),
        navBottomItems(index: 1, icon: Icons.call, label: 'Call', onTap: () {}),
        navBottomItems(
            index: 2, icon: Icons.notifications, label: 'Notice', onTap: () {}),
        navBottomItems(
            index: 3, icon: Icons.people, label: 'People', onTap: () {}),
      ],
    ));
  }

  Widget navBottomItems(
      {required String label,
      required IconData icon,
      required Function onTap,
      required int index}) {
    return GestureDetector(
      onTap: () {
        onTap();
        print(index);
      },
      child: Container(
        height: 60,
        child: Column(
          children: [
            Icon(icon),
            Text(label),
          ],
        ),
      ),
    );
  }
}
