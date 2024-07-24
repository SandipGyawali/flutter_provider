import 'package:flutter/material.dart';

class NotifyListener extends StatelessWidget {
  @override
  NotifyListener({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify Listener"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, _, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffix: InkWell(
                      onTap: () {
                        if (_toggle.value == true) {
                          _toggle.value = false;
                        } else {
                          _toggle.value = true;
                        }
                      },
                      child: Icon(
                        _toggle.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, _, child) {
                return Text(
                  "${_counter.value}",
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
