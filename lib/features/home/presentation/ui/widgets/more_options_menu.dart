import 'package:flutter/material.dart';

class MoreOptionsMenu extends StatelessWidget {
  const MoreOptionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Colors.white,
      icon: const Icon(Icons.more_horiz),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (value) {
        switch (value) {
          case 0:
            // Share action

            break;
          case 1:
            // Rate Recipe action

            break;
          case 2:
            // Review action

            break;
          case 3:
            // Unsave action

            break;
        }
      },
      itemBuilder:
          (context) => [
            _buildPopupItem(Icons.share, "Share", 0),
            _buildPopupItem(Icons.star_border, "Rate Recipe", 1),
            _buildPopupItem(Icons.chat_bubble_outline, "Review", 2),
            _buildPopupItem(Icons.bookmark_border, "Unsave", 3),
          ],
    );
  }

  PopupMenuItem<int> _buildPopupItem(IconData icon, String text, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
