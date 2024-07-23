import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteItemScreen extends StatefulWidget {
  const FavoriteItemScreen({super.key});

  @override
  State<FavoriteItemScreen> createState() => _FavoriteItemScreen();
}

class _FavoriteItemScreen extends State<FavoriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
            "Favorite Item",
          ),
          backgroundColor: Colors.blue.shade600,
          leading: const BackButton(
            color: Colors.white,
          )),
      body: Consumer<FavoriteProvider>(
        builder: (context, _, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: _.getSelectedItems().length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _.removeItem(index);
                    },
                    title: Text("Item ${_}"),
                    trailing: const Icon(Icons.favorite),
                    iconColor: Colors.grey,
                  );
                },
              ))
            ],
          );
        },
      ),
    );
  }
}
