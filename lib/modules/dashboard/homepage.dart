import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_tree/styles/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Menu Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/plant_icon.svg', height: 20.0, width: 20.0,
              color: AppColors.black,
            ),
            label: "Plants",
            activeIcon: SvgPicture.asset(
              'assets/svg/icons/plant_icon.svg', height: 25.0, width: 25.0,
              color: AppColors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/icons/camera_icon.svg", height: 20.0, width: 20.0,

              color: AppColors.black,
            ),
            label: "Search",
            activeIcon: SvgPicture.asset(
              'assets/svg/icons/camera_icon.svg', height: 25.0, width: 25.0,
              color: AppColors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/disease_icon.svg', height: 20.0, width: 20.0,
              color: AppColors.black,
            ),
            label: "Disease",
            activeIcon: SvgPicture.asset(
              'assets/svg/icons/disease_icon.svg', height: 25.0, width: 25.0,
              color: AppColors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/menu_icon.svg', height: 20.0, width: 20.0,
              color: AppColors.black,
            ),
            label: "Menu",
            activeIcon: SvgPicture.asset(
              'assets/svg/icons/menu_icon.svg', height: 25.0, width: 25.0,
              color: AppColors.green,
            ),
          ),
        ],
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.green,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
      // bottomNavigationBar: Row(

      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         SvgPicture.asset(
      //           'assets/svg/icons/plant_icon.svg',
      //           color: AppColors.black,
      //         ),
      //         Text(
      //           "Plants",
      //           style: TextStyles.body,
      //         )
      //       ],
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         SvgPicture.asset(
      //           'assets/svg/icons/camera_icon.svg',
      //           color: AppColors.black,
      //         ),
      //         Text(
      //           "Search",
      //           style: TextStyles.body,
      //         )
      //       ],
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         SvgPicture.asset(
      //           'assets/svg/icons/disease_icon.svg',
      //           color: AppColors.black,
      //         ),
      //         Text(
      //           "Disease",
      //           style: TextStyles.body,
      //         )
      //       ],
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         SvgPicture.asset(
      //           'assets/svg/icons/menu_icon.svg',
      //           color: AppColors.black,
      //         ),
      //         Text(
      //           "Menu",
      //           style: TextStyles.body,
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
