import 'package:google_fonts/google_fonts.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:flutter/material.dart';
import 'package:plant_tree/styles/text_style.dart';
import 'package:plant_tree/widgets/index.dart';

class AddPlant extends StatelessWidget {
  const AddPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plants",
          style: TextStyles.primaryHeading,
        ),
        backgroundColor: AppColors.white,
        elevation: 1.0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 22.0,
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.symmetric(horizontal: 23.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffCA1862),
                    Color(0xffDD0BE1),
                    Color(0xff7602EB),
                  ],
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/png/icons/message_icon.png"),
                Text(
                  "Premium Available Soon",
                  style: TextStyles.body23,
                )
              ],
            ),
          ),
          // const SizedBox(height: 42.0),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 42.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21.0),
            decoration: BoxDecoration(
              color: const Color(0xffD7FAE9),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset("assets/png/images/plant_image.png"),
                Text(
                  "0 plant",
                  style: GoogleFonts.roboto(fontSize: 16.0, color: AppColors.lightgrey),
                ),
                const SizedBox(height: 10.0,),
                ButtonWidget(
                  buttonText: "Add Plant",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
