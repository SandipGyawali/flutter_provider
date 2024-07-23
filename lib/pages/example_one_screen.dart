import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreen();
}

class _ExampleOneScreen extends State<ExampleOneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Page is being rebuild globally");

    return Consumer<ExampleOneProvider>(
        builder: (context, exampleOneProvider, child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              min: 0,
              max: 1,
              value: exampleOneProvider.value,
              onChanged: (value) {
                exampleOneProvider.setValue = value;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: exampleOneProvider.value,
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text("This is text"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: exampleOneProvider.value,
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text("This is text"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
