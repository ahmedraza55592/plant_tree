import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:plant_tree/widgets/index.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
        title: Text(
          "Menu",
          style: TextStyles.body22,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Legal",
                style: TextStyles.body19,
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextButtonWidget(
                text: "Privacy Policy",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                text: "Terms & Conditions",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                "Communcation",
                style: TextStyles.body19,
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextButtonWidget(
                text: "FAQ",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                text: "Feedback",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              const SizedBox(height: 25.0,),

              Text(
                "Profile",
                style: TextStyles.body19,
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextButtonWidget(
                text: "User Setting",
                onPressed: () => Navigator.pushNamed(context, '/userProfile'),
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                text: "All Plants Location",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                text: "Your Plants Location",
                onPressed: () {},
              ),
              const Divider(
                thickness: 1.0,
              ),
              TextButtonWidget(
                text: "Logout",
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
              ),
              const Divider(
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
