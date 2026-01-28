import 'package:bizsuite/views/profile.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isProfile;

  const AppbarWidget({super.key, required this.title, this.isProfile = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: !isProfile,
      automaticallyImplyLeading: false,
      leading: isProfile
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        if (isProfile) ...[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/icons/profile.jpg',
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ] else ...[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {},
              child: ClipOval(
                child: Icon(Icons.edit, size: 28, color: Colors.white),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
