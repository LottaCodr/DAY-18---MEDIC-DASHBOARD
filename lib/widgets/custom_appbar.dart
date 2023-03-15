import 'package:dashboard/config/palette.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0,
      leading: IconButton(
          onPressed: (){},
          iconSize: 28,
          icon: const Icon(Icons.menu)
      ),
      actions: [
        IconButton(
            onPressed: (){},
            iconSize: 28,
            icon: const Icon(Icons.notifications_none)
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
