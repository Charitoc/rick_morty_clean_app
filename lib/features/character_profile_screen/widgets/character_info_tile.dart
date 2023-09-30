import 'package:flutter/widgets.dart';

import 'package:rick_and_morty/core/theme.dart';

class CharacterInfoTile extends StatelessWidget {
  const CharacterInfoTile({
    Key? key,
    required this.text,
    required this.opacity,
  }) : super(key: key);

  final String text;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: theme.colorScheme.background,
              child: Text(text)),
        ),
      ),
    );
  }
}
