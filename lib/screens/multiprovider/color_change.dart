import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
 * REBUILING OF SCREEN USING MULTIPROVIDER
 * - There wont be any rebuild of the full widget except the consumer widget.
 * 
 * - 
 */

class ColorChange extends StatelessWidget {
  const ColorChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("There was a full wodget build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Change State"),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
