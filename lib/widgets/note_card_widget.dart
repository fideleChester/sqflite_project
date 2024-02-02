import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note/model/note.dart';

final _lightColors = [
  Colors.amber.shade500,
  Colors.lightBlue.shade200,
  Colors.lightGreen.shade200,
  Colors.pinkAccent.shade200,
  Colors.tealAccent.shade200
];

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    super.key,
    required this.note,
    required this.index,
  });
  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);
    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
