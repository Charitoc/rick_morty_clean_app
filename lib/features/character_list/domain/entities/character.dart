import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        image,
      ];
}
