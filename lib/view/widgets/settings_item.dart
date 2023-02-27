import 'package:flutter/material.dart';
import 'package:mostalah/utils/app_layout.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppLayout.getHeight(70),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, size: AppLayout.getHeight(28)),
                 SizedBox(
                  width: AppLayout.getWidth(10),
                ),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(fontSize: AppLayout.getHeight(19)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }
}
