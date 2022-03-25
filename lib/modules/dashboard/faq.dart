import 'package:flutter/material.dart';
import '../../styles/index.dart';

class FAQModel {
  final String? question;
  final String? answer;

  FAQModel({this.question, this.answer});
}

List<FAQModel> dummyData = [
  FAQModel(
      question: "First Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
  FAQModel(
      question: "Second Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
  FAQModel(
      question: "3rd Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
  FAQModel(
      question: "Fourth Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
  FAQModel(
      question: "5th Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
  FAQModel(
      question: "6th Question",
      answer: "The quick Brown Fox jumps over the Lazy Dog"),
];

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ",
          style: TextStyles.body22,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                dummyData[index].question!,
                style: TextStyles.body19,
              ),
              backgroundColor: AppColors.green.withOpacity(.3),
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.green,
              ),
              tilePadding: EdgeInsets.symmetric(horizontal: 16.0.w),
              childrenPadding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
              expandedAlignment: Alignment.centerLeft,
              children: [
                Text(
                  dummyData[index].answer!,
                  style: TextStyles.body16,
                )
              ],
            );
          }),
    );
  }
}
