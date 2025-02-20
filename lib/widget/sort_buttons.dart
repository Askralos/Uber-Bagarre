import 'package:flutter/material.dart';

class SortButtons extends StatelessWidget {
  final VoidCallback onSortAscending;
  final VoidCallback onSortDescending;
  final int? selectedSort;

  const SortButtons({
    Key? key,
    required this.onSortAscending,
    required this.onSortDescending,
    required this.selectedSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: onSortAscending,
          icon: Icon(Icons.arrow_upward),
          label: Text("Note croissante"),
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSort == 1 ? Colors.grey[200] : null,
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: onSortDescending,
          icon: Icon(Icons.arrow_downward),
          label: Text("Note décroissante"),
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSort == 2 ? Colors.grey[200] : null,
          ),
        ),
      ],
    );
  }
}
