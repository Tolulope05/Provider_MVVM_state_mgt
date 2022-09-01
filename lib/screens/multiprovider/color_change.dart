import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/color_provider.dart';

// ignore: slash_for_doc_comments
/**
 * REBUILING OF SCREEN USING MULTIPROVIDER
 * - There wont be any rebuild of the full widget except the consumer widget.
 * - 
 * - 
 */

class ColorChange extends StatelessWidget {
  ColorChange({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(
      context,
      listen: false,
    );
    print("There was a full widget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Change State"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<ColorProvider>(builder: (context, value, child) {
          double assignedValue = value.assignedValue;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(assignedValue),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(assignedValue),
                    ),
                  ),
                ],
              ),
              Slider(
                value: assignedValue,
                onChanged: (value) {
                  // print(value);
                  colorProvider.changeValue(value);
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
