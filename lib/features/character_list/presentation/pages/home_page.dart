import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rick_and_morty/core/theme.dart';
import 'package:rick_and_morty/features/character_list/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/character_list/presentation/widgets/character_card.dart';
import 'package:rick_and_morty/features/character_list/presentation/widgets/loading_view.dart';
import 'package:rick_and_morty/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CharacterBloc>()..add(const FetchAllCharacters(page: 1)),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  final scrollcontroller = ScrollController();
  late AnimationController animationController;
  late Animation animation;

  int page = 1;
  var offset = 0.0;
  Color color = theme.colorScheme.background;

  void getBackgroundColor(double offset) {
    color = Color.lerp(theme.colorScheme.background, Colors.white,
        scrollcontroller.hasClients ? scrollcontroller.offset / 2000 : 0)!;
  }

  //GET DATA FOR NEXT PAGE WHEN THE SCROLLED POSITION REACHES THE END OF SCREEN
  void pagination() {
    setState(() {
      getBackgroundColor(offset);
    });
    if ((scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent)) {
      page += 1;
      context.read<CharacterBloc>().add(FetchNextPageCharacters(page: page));
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(pagination);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween(begin: pi, end: 2 * pi).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoadedState) {
          FlutterNativeSplash.remove();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: color,
              toolbarHeight: 100,
              title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => Transform(
                          transform: Matrix4.identity()
                            ..rotateX(animation.value),
                          child: Image.asset('assets/appbar_image.png'),
                        )),
              ),
            ),
            backgroundColor: color,
            body: ListView.separated(
              separatorBuilder: (context, i) => const SizedBox(height: 8),
              controller: scrollcontroller,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.characters.length,
              itemBuilder: (context, i) => CharacterCard(
                character: state.characters[i],
              ),
            ),
          );
        }
        return const LoadingView();
      },
    );
  }
}
