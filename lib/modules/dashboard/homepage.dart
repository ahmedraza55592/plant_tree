import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/index.dart';
import 'package:plant_tree/routes.dart';
import 'package:plant_tree/styles/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_tree/widgets/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyPlantss(),
    Library(),
    Disease(),
    Menu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    addUserData();
    super.initState();
  }

  addUserData() async {
    final _userProvider = Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
    // await _userProvider.getPlantInfoLength(_userProvider.getUser.uid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        unSelectedColor: AppColors.black,
        backgroundColor: AppColors.green,
        selectedColor: AppColors.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(
              iconName: "assets/svg/icons/plant_icon.svg", text: 'Home'),
          FABBottomAppBarItem(
              iconName: "assets/svg/icons/library_icon.svg", text: 'Library'),
          FABBottomAppBarItem(
              iconName: "assets/svg/icons/disease_icon.svg", text: 'Disease'),
          FABBottomAppBarItem(
              iconName: "assets/svg/icons/menu_icon.svg", text: 'Menu'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.addPlants),
        child: Container(
            padding: EdgeInsets.only(left: 8.0.w),
            alignment: Alignment.center,
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight,
                  colors: AppColors.appBarColor),
            ),
            child: SvgPicture.asset("assets/svg/icons/add_plant.svg")),
        elevation: 2.0,
      ),

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         end: Alignment.centerLeft,
      //         begin: Alignment.centerRight,
      //         colors: AppColors.appBarColor),
      //   ),
      //   child: BottomNavigationBar(
      //     unselectedItemColor: Colors.black,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/svg/icons/plant_icon.svg',
      //           height: 20.0,
      //           width: 20.0,
      //           color: AppColors.black,
      //         ),
      //         label: "Plants",
      //         activeIcon: SvgPicture.asset(
      //           'assets/svg/icons/plant_icon.svg',
      //           height: 25.0,
      //           width: 25.0,
      //           color: AppColors.white,
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           "assets/svg/icons/library_icon.svg",
      //           height: 20.0,
      //           width: 20.0,
      //           color: AppColors.black,
      //         ),
      //         label: "Library",
      //         activeIcon: SvgPicture.asset(
      //           'assets/svg/icons/library_icon.svg',
      //           height: 25.0,
      //           width: 25.0,
      //           color: AppColors.white,
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/svg/icons/disease_icon.svg',
      //           height: 20.0,
      //           width: 20.0,
      //           color: AppColors.black,
      //         ),
      //         label: "Disease",
      //         activeIcon: SvgPicture.asset(
      //           'assets/svg/icons/disease_icon.svg',
      //           height: 25.0,
      //           width: 25.0,
      //           color: AppColors.white,
      //         ),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.menu,
      //           color: AppColors.black,
      //         ),
      //         label: "Menu",
      //         activeIcon: Icon(
      //           Icons.menu,
      //           size: 25.0,
      //           color: AppColors.white,
      //         ),
      //       ),
      //     ],
      //     backgroundColor: Colors.transparent,
      //     selectedItemColor: AppColors.white,
      //     onTap: _onItemTapped,
      //     currentIndex: _selectedIndex,
      //     type: BottomNavigationBarType.fixed,
      //   ),
      // ),
    );
  }
}
