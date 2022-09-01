import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_screen_provider.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favortie List"),
      ),
      body: Consumer<FavoriteProvider>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Item ${value.favList[index]}"),
                  trailing: Icon(
                      value.favList.contains(value.favList[index])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red),
                  onTap: () {
                    value.selectItem(value.favList[index]);
                  },
                ),
                itemCount: value.favList.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
