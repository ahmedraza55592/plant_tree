import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyles.primaryHeading,
        ),
        backgroundColor: AppColors.white,
        elevation: 1.0,
      ),
    );
  }
}
