import '/utilities/navigators.dart';
import 'status_bar_container.dart';
import 'widget_barrel.dart';
import '/screens/governance_screen.dart';
import '/screens/home_screen.dart';
import '/screens/elections_screen.dart';
import '/screens/profiles_screen.dart';

enum MenuItems { settings, logout }

// Main UI root widget: HomeScreen
class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  int _selectedItemIndex = 0;

  changeSelectedItem(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  List screens = [
    const HomeScreen(),
    const ProfilesScreen(),
    const GovernanceScreen(),
    const ElectionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return StatusBarContainer(
      color: white,
      widget: Scaffold(
        // App Bar (Menu, Title, Search, Profile Avatar)
        appBar: AppBar(
          //Current Tab Title
          title: const Text(
            "Home",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
          //Menu and Menu Items
          leading: PopupMenuButton<MenuItems>(
            onSelected: (value) {
              switch (value) {
                case MenuItems.settings:
                  //Navigator.pushNamed(context, settings);
                  break;
                case MenuItems.logout:
                  navigatePushNamedAndRemoveUntil(context, login);
                  break;
              }
            },
            icon: const Icon(
              Icons.menu_rounded,
              color: black,
              size: 30,
            ),
            itemBuilder: (context) {
              return [
                // Settings
                PopupMenuItem(
                  value: MenuItems.settings,
                  child: Row(
                    children: const [
                      Icon(Icons.settings_rounded),
                      Text("Settings"),
                    ],
                  ),
                ),
                // Logout
                PopupMenuItem(
                  value: MenuItems.logout,
                  child: Row(
                    children: const [
                      Icon(Icons.logout_rounded),
                      Text("Logout"),
                    ],
                  ),
                ),
              ];
            },
          ),
          backgroundColor: white,
          actions: [
            //Search Icon
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: black,
                size: 30,
              ),
              onPressed: () {},
            ),
            //Profile Avatar
            Container(
              width: 35,
              height: 35,
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                backgroundColor: navyBlue,
                //backgroundImage: AssetImage("assets/images/profile.jpg")
                child: Text(
                  "C",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      color: white),
                ),
              ),
            ),
          ],
        ),
        // Bottom Navigation Bar (Home, Profiles, Governance, Politics)
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedItemIndex,
          backgroundColor: white,
          selectedItemColor: navyBlue,
          unselectedItemColor: black,
          showUnselectedLabels: true,
          onTap: (index) => changeSelectedItem(index),
          //equal spacing for all items
          type: BottomNavigationBarType.fixed,
          items: const [
            // Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            // Profiles
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profiles",
            ),
            // Governance
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel_rounded),
              label: "Governance",
            ),
            // Politics
            BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded),
              label: "Elections",
            ),
          ],
        ),
        body: Center(
          child: screens.elementAt(_selectedItemIndex),
        ),
      ),
    );
  }
}
