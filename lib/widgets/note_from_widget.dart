import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    super.key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              const SizedBox(height: 10),
              buildDescription(),
              const SizedBox(height: 18),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w200,
            fontSize: 24,
            decorationStyle: TextDecorationStyle.double),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          hintText: 'Title',
          hintStyle: TextStyle(
            color: Colors.amber,
          ),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? "Le titre est obligatoire" : null,
        onChanged: onChangedTitle,
      );
//Le champ  de description peut accepter plusieurs lignes et doit être plus long que le titre
  Widget buildDescription() => TextFormField(
        maxLines: 2,
        initialValue: description,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          hintText: "Votre description ...",
          hintStyle: const TextStyle(
            color: Colors.amber,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'La description ne peut pas être vide'
            : null,
        onChanged: onChangedDescription,
      );
}
