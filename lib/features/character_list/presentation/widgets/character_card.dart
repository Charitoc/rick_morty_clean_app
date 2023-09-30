import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rick_and_morty/features/character_list/domain/entities/character.dart';
import 'package:rick_and_morty/features/character_profile_screen/pages/character_profile_page_screen.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CharacterProfilePage(
            character: character,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(0, 69, 56, 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: character.id,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/placeholder.png'),
                      image: NetworkImage(character.image),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                            'assets/internet_connection_problem.svg'),
                      ),
                      fit: BoxFit.fitWidth,
                      width: 140,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(character.name,
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: character.status == "Alive"
                                      ? Colors.lightGreenAccent
                                      : character.status == "Dead"
                                          ? Colors.red
                                          : Colors.grey[350],
                                  borderRadius: BorderRadius.circular(90)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${character.status} - ${character.species} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // const Text("Last known location:",
                        //     style: TextStyle(
                        //       color: Color.fromRGBO(158, 158, 158, 1),
                        //     )),
                        // location == null
                        //     ? Container()
                        //     : Text(
                        //         character.location.name,
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // const Text("First seen in:",
                        //     style: TextStyle(
                        //       color: Color.fromRGBO(158, 158, 158, 1),
                        //     )),
                        // episode == null
                        //     ? Container()
                        //     : Text(
                        //         episode.name,
                        //         style: TextStyle(color: Colors.white),
                        //       )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
