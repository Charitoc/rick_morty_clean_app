import 'package:flutter/material.dart';

import 'package:rick_and_morty/core/theme.dart';
import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';
import 'package:rick_and_morty/features/character_profile_screen/widgets/character_image.dart';
import 'package:rick_and_morty/features/character_profile_screen/widgets/character_info_tile.dart';

class CharacterProfilePage extends StatefulWidget {
  const CharacterProfilePage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  State<CharacterProfilePage> createState() => _CharacterProfilePageState();
}

class _CharacterProfilePageState extends State<CharacterProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  var height = 0.0;
  var opacity = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween(begin: 0.0, end: 1 * 60).animate(controller);
    controller.forward();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          Future.delayed(const Duration(milliseconds: 300), setHeight);
          Future.delayed(const Duration(seconds: 1), fadeInTile);
        }));
  }

  void setHeight() {
    setState(() {
      height = 60;
    });
  }

  void fadeInTile() {
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              theme.colorScheme.background,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            CharacterImage(
              id: widget.character.id,
              image: widget.character.image,
              name: widget.character.name,
              status: widget.character.status,
              height: height,
            ),
            const SizedBox(
              height: 60,
            ),
            CharacterInfoTile(
              text: widget.character.species,
              opacity: opacity,
            ),
            CharacterInfoTile(
              text: widget.character.status,
              opacity: opacity,
            ),
          ],
        ),
      ),
    );
  }
}
