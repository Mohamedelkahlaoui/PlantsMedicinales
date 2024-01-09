import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plantesmedicinales/constants.dart';
import 'package:plantesmedicinales/models/plants.dart';
import 'package:plantesmedicinales/ui/screens/cart_page.dart';
import 'package:plantesmedicinales/ui/screens/favorite_page.dart';
import 'package:plantesmedicinales/ui/screens/home_page.dart';
import 'package:plantesmedicinales/ui/screens/profile_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  int _bottomNavIndex = 0;

//List of the pages.
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addToCartPlants: myCart,
      ),
      const ProfilePage(),
    ];
  }

//List of the pages icons.
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

//List of the pages titles.
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         child: const SignIn(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
              final List<Plant> addToCartPlants = Plant.addedToCartPlants();

              favorites = favoritedPlants;
              myCart = addToCartPlants.toSet().toList();
            });
          }),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  static bool isDark = false;

  static ThemeMode get themeMode {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
