import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class AppBarGoBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGoBack({
    super.key,
    required this.title,
    this.icon,
    this.onIconPressed,
  });

  final String title;
  final Icon? icon;
  final Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      leading: IconButton(
        icon: const Icon(Ionicons.arrow_back, color: Colors.white),
        onPressed: () {
          // go back to the previous page
          context.pop();
        },
      ),
      actions: icon != null
          ? [
              Container(
                margin: const EdgeInsets.only(right: 32),
                child: IconButton(
                  icon: icon!,
                  onPressed: onIconPressed, // TODO : implementare switch
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
