import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/favourites/favorite_item_screen.dart';
import 'package:flutter_provider/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteItemScreen()));
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Center(
          child: Text(
            "Favorite App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, _, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (_.getSelectedItems().contains(index)) {
                        _.removeItem(index);
                      } else {
                        _.addItem(index);
                      }
                      setState(() {});
                    },
                    title: Text("Item $index"),
                    trailing: Icon(_.getSelectedItems().contains(index)
                        ? Icons.favorite
                        : Icons.favorite_outline),
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
