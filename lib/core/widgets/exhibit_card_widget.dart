import 'package:flutter/material.dart';
import 'package:testtask/core/extension/context_extension.dart';
import 'package:testtask/core/utils/colors.dart';
import 'package:testtask/core/utils/custom_textstyle.dart';

class ExhibitCardWidget extends StatelessWidget {
  const ExhibitCardWidget({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);
  final String title;
  final List<String> imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            title,
            style: CustomTextStyles(context).headline1(
              fontColor: ColorConst().blackColor,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imagePath.map((String imagePath) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imagePath,
                  height: context.screenWidth * 0.3,
                  width: context.screenWidth * 0.3,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
