import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt/screens/favorite_app/favorite_screen_list.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_screen_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var favortieProvider = Provider.of<FavoriteProvider>(
      context,
      listen: false,
    );

    List<int> selectedItem = favortieProvider.favList;
    print(selectedItem);
    print("There is a Widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Tab"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteList(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_checkout_rounded),
          )
        ],
      ),
      body: Consumer<FavoriteProvider>(builder: (context, value, child) {
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item $index"),
                    trailing: Icon(
                        selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red),
                    onTap: () {
                      favortieProvider.selectItem(index);
                    },
                  );
                },
                itemCount: 15,
              ),
            ),
          ],
        );
      }),
    );
  }
}
