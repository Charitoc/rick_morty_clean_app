import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
          baseColor: const Color.fromRGBO(173, 213, 202, 1),
          highlightColor: const Color.fromRGBO(13, 58, 53, 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color.fromRGBO(13, 58, 53, 1),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color.fromRGBO(13, 58, 53, 1),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color.fromRGBO(13, 58, 53, 1),
                ),
              ],
            ),
          )),
    );
  }
}
