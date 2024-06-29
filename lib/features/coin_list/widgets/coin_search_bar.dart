import 'package:flutter/material.dart';

class CoinSearchBar extends StatelessWidget {
  const CoinSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 16,
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
