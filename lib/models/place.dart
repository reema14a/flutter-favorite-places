import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final String? image;

  Place(
    this.title, {
    this.image,
  }) : id = uuid.v4();
}
