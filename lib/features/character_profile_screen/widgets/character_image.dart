import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/core/theme.dart';
import 'package:rick_and_morty/features/character_profile_screen/widgets/name_tile.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    Key? key,
    required this.id,
    required this.image,
    required this.status,
    required this.name,
    required this.height,
  }) : super(key: key);

  final int id;
  final String image;
  final String status;
  final String name;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          width: 8,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          image,
                          height: 300,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                if (status == 'Dead')
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/skeleton.svg',
                      height: 40,
                      width: 40,
                      // ignore: deprecated_member_use
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
            NameTile(
              height: height,
              name: name,
            )
          ],
        ),
      ),
    );
  }
}
