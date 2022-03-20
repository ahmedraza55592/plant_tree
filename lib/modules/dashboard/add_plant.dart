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
          style: TextStyles.body22,
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 22.0,
          // ),
          // Container(
          //   padding: const EdgeInsets.all(6.0),
          //   margin: const EdgeInsets.symmetric(horizontal: 23.0),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(7.0),
          //       gradient: const LinearGradient(
          //         colors: [
          //           Color(0xffCA1862),
          //           Color(0xffDD0BE1),
          //           Color(0xff7602EB),
          //         ],
          //       )),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Image.asset("assets/png/icons/message_icon.png"),
          //       Text(
          //         "Premium Available Soon",
          //         style: TextStyles.body22,
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 42.0),
          Container(
            margin:
                const EdgeInsets.all(23.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21.0),
            decoration: BoxDecoration(
              color: const Color(0xffD7FAE9),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Image.asset("assets/png/images/plant_image.png"),
                Text(
                  "0 Plant",
                  style: TextStyles.body15,
                ),
                const SizedBox(height: 25.0,),
                ButtonWidget(
                  isIcon: true,
                  buttonText: "My Plants",
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
