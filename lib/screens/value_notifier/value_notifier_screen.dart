import 'dart:async';

import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  ValueNotifierScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _obscure = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("THERE IS A WIDGET BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _obscure,
              builder: (BuildContext context, bool value, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: _obscure.value,
                    decoration: InputDecoration(
                      hintText: "password",
                      suffix: InkWell(
                        onTap: () {
                          _obscure.value = !_obscure.value;
                        },
                        child: Icon(
                          _obscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(
                  value.toString(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
