import 'package:flutter/material.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/models/settings_store.dart';

class ImageButton extends StatelessWidget {
  final String identifier;
  final VoidCallback? onPressed;

  const ImageButton({
    super.key,
    required this.identifier,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String imageUrl = DataStore().getImageUrl(identifier);

    double defaultWidth = MediaQuery.of(context).size.width / 2;
    double maxWidth = 600.0;

    double buttonSize = defaultWidth > maxWidth ? maxWidth : defaultWidth;

    return IconButton(
      onPressed: onPressed,
      iconSize: buttonSize,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tightFor(
        width: buttonSize,
        height: buttonSize,
      ),
      icon: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SettingsStore.isColorBlind
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            )
          : Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
    ),

          // TEMP: shows text on top of default image
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              //child: Text(identifier),
            ),
          ),
        ],
      ),
    );
  }

}