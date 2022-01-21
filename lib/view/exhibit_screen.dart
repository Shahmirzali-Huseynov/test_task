import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testtask/core/widgets/exhibit_card_widget.dart';
import 'package:testtask/view_model/exhibit_view_model.dart';
import 'package:testtask/core/extension/context_extension.dart';

class ExhibitScreen extends StatefulWidget {
  const ExhibitScreen({Key? key}) : super(key: key);

  @override
  _ExhibitScreenState createState() => _ExhibitScreenState();
}

class _ExhibitScreenState extends State<ExhibitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExhibitScreen"),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final getExhibit = watch(getExhibitProvider);

          return getExhibit.getLoadingStaus != ExhibitStatus.COMPLETED
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: getExhibit.getMainMenuList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.015),
                      child: ExhibitCardWidget(
                        title: getExhibit.getMainMenuList[index].title,
                        imagePath: getExhibit.getMainMenuList[index].images,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
