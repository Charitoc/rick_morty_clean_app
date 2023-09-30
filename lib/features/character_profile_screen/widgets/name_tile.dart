import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme.dart';

class NameTile extends StatelessWidget {
  const NameTile({
    super.key,
    required this.height,
    required this.name,
  });

  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -26,
      width: MediaQuery.of(context).size.width / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AnimatedPadding(
          padding: EdgeInsets.only(bottom: 30 - height / 2),
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            height: height,
            color: theme.colorScheme.primary,
            child: Center(
              child: Hero(
                tag: name,
                transitionOnUserGestures: true,
                flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) =>
                    DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  child: toHeroContext.widget,
                ),
                child: Text(
                  name,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
