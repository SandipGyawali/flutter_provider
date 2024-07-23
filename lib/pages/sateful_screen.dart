import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreen();
}

class _StatefulScreen extends State<StatefulScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful Widget"),
        backgroundColor: Colors.amber.shade200,
        elevation: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CounterProvider>(
            builder: (context, counterProvider, child) {
              return Text(
                "${counterProvider.getCount}",
                style: const TextStyle(
                  fontSize: 40,
                ),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counterProvider.setCount();
        },
      ),
    );
  }
}
