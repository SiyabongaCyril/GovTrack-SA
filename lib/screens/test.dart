// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:gov_track_sa/utilities/show_error_dialog.dart';
// import '../services/auth/govtracksa_auth.dart';
// import '../utilities/controllers.dart';
// import '../utilities/enums.dart';
// import '../utilities/navigators.dart';
// import 'mainui_styles_and_widgets.dart';
// import 'status_bar_container.dart';
// import 'widget_barrel.dart';
// import '../screens/governance.dart';
// import '../screens/home.dart';
// import '../screens/elections.dart';
// import '../screens/profiles.dart';

// // Main UI root widget: HomeScreen
// class MainUI extends StatefulWidget {
//   const MainUI({super.key});

//   @override
//   State<MainUI> createState() => _MainUIState();
// }

// class _MainUIState extends State<MainUI> {
//   int _selectedItemIndex = 0;
//   bool _searching = false;

//   changeSelectedItem(int index) {
//     setState(() {
//       _selectedItemIndex = index;
//     });
//   }

//   List screens = [
//     const HomeScreen(),
//     const ProfilesScreen(),
//     const GovernanceScreen(),
//     const ElectionsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     ;
//     double statusBarHeight = MediaQuery.of(context).padding.top;
//     double appBarHeight = kToolbarHeight;
//     double screenHeight =
//         MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
//     double screenWidth = MediaQuery.of(context).size.width;

//     String getEmailFirstLetter() {
//       // Update this to be a method in auth helper auth service
//       // It's not good practice calling Firebase in the UI
//       final user = FirebaseAuth.instance.currentUser;
//       log("${user ?? "No User"}");
//       return user!.email.toString()[0].toUpperCase();
//     }

//     return StatusBarContainer(
//       color: white,
//       widget: Scaffold(
//         backgroundColor: white,

//         drawer: const LeftDrawer(),

//         endDrawer: const RightDrawer(),

//         appBar: _searching == false
//             // App Bar (Menu, Title, Search, Profile Avatar),
//             ? AppBar(
//                 backgroundColor: white,

//                 leading: Builder(builder: (context) {
//                   return IconButton(
//                     onPressed: () {
//                       Scaffold.of(context).openDrawer();
//                     },
//                     icon: Icon(
//                       Icons.menu,
//                       color: black,
//                       size: proportionalWidth(screenWidth, 25),
//                     ),
//                   );
//                 }),

//                 // Title: Dropdown Menu and Menu Items
//                 // to select a tab: Home, Profiles, Governance, Elections
//                 title: DropdownButton<int>(
//                   dropdownColor: white,
//                   alignment: Alignment.center,
//                   underline: Container(),
//                   borderRadius: BorderRadius.circular(20),
//                   icon: const Icon(
//                     Icons.arrow_drop_down_rounded,
//                     color: black,
//                     size: 30,
//                   ),
//                   value: _selectedItemIndex,
//                   onChanged: (index) {
//                     setState(() {
//                       _selectedItemIndex = index ?? _selectedItemIndex;
//                     });
//                   },
//                   items: const [
//                     DropdownMenuItem<int>(
//                       value: 0,
//                       child: Text(
//                         "Home",
//                         style: dropDownMenuTextStyle,
//                       ),
//                     ),
//                     DropdownMenuItem<int>(
//                       value: 1,
//                       child: Text(
//                         "Profiles",
//                         style: dropDownMenuTextStyle,
//                       ),
//                     ),
//                     DropdownMenuItem<int>(
//                       value: 2,
//                       child: Text(
//                         "Governance",
//                         style: dropDownMenuTextStyle,
//                       ),
//                     ),
//                     DropdownMenuItem<int>(
//                       value: 3,
//                       child: Text(
//                         "Elections",
//                         style: dropDownMenuTextStyle,
//                       ),
//                     ),
//                   ],
//                 ),

//                 // App Bar's Search and Profile Avatar
//                 actions: [
//                   //Search Icon
//                   IconButton(
//                     icon: Icon(
//                       Icons.search_rounded,
//                       color: black,
//                       size: proportionalWidth(screenWidth, 25),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _searching = !_searching;
//                       });
//                     },
//                   ),

//                   //Profile Avatar
//                   Builder(builder: (context) {
//                     return IconButton(
//                       padding: EdgeInsets.only(
//                         right: proportionalWidth(screenWidth, 12),
//                       ),
//                       onPressed: () {
//                         Scaffold.of(context).openEndDrawer();
//                       },
//                       icon: CircleAvatar(
//                         backgroundColor: navyBlue,
//                         child: Text(
//                           getEmailFirstLetter(),
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                               color: white),
//                         ),
//                       ),
//                     );
//                   }),
//                 ],
//               )

//             // App Bar (Back Arrow, Search Bar)
//             : AppBar(
//                 backgroundColor: white,

//                 leadingWidth: proportionalWidth(screenWidth, 30),

//                 //Back Arrow
//                 leading: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_rounded,
//                     color: black,
//                     size: proportionalWidth(screenWidth, 22),
//                   ),
//                   onPressed: () {
//                     AppControllers.searchBarController.clear();
//                     setState(() {
//                       _searching = !_searching;
//                     });
//                   },
//                 ),

//                 // Search Bar
//                 title: SizedBox(
//                   height: proportionalHeight(screenHeight, 40),
//                   width: proportionalWidth(screenWidth, 330),
//                   child: TextField(
//                     controller: AppControllers.searchBarController,
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.search,
//                     style: dropDownMenuTextStyle,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(
//                         left: proportionalWidth(screenWidth, 0),
//                         right: proportionalWidth(screenWidth, 10),
//                         bottom: proportionalHeight(screenHeight, 2),
//                       ),
//                       border: searchBarBorder,
//                       enabledBorder: searchBarBorder,
//                       focusedBorder: searchBarBorder,
//                       hintText: "Search",
//                       hintStyle: dropDownMenuTextStyle.copyWith(
//                         color: black.withOpacity(0.4),
//                       ),
//                       prefixIcon: IconButton(
//                         icon: Icon(
//                           Icons.search_rounded,
//                           color: black,
//                           size: proportionalWidth(screenWidth, 20),
//                         ),
//                         onPressed: () {},
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           Icons.clear_outlined,
//                           color: black,
//                           size: proportionalWidth(screenWidth, 20),
//                         ),
//                         onPressed: () =>
//                             AppControllers.searchBarController.clear(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//         // Bottom Navigation Bar (Home, Profiles, Governance, Politics)
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedItemIndex,
//           backgroundColor: white,
//           selectedItemColor: navyBlue,
//           unselectedItemColor: black,
//           showUnselectedLabels: true,
//           onTap: (index) => changeSelectedItem(index),
//           //equal spacing for all items
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             // Home
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_rounded),
//               label: "Home",
//             ),
//             // Profiles
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_rounded),
//               label: "Profiles",
//             ),
//             // Governance
//             BottomNavigationBarItem(
//               icon: Icon(Icons.gavel_rounded),
//               label: "Governance",
//             ),
//             // Politics
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people_rounded),
//               label: "Elections",
//             ),
//           ],
//         ),

//         body: Center(
//           child: screens.elementAt(_selectedItemIndex),
//         ),
//       ),
//     );
//   }
// }

// class LeftDrawer extends StatelessWidget {
//   const LeftDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ;
//     double statusBarHeight = MediaQuery.of(context).padding.top;
//     double appBarHeight = kToolbarHeight;
//     double screenHeight =
//         MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Drawer(
//       width: proportionalWidth(screenWidth, screenWidth / 2),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       backgroundColor: white,
//       child: Column(
//         children: [
//           // Drawer Header
//           DrawerHeader(
//             child: Text(
//               "GovTrackSA",
//               style: TextStyle(
//                 fontSize: proportionalHeight(screenHeight, 16),
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),

//           // Settings
//           ListTile(
//             leading: Icon(
//               Icons.settings,
//               size: proportionalWidth(screenWidth, 15),
//             ),
//             title: const Text(
//               "Settings",
//               style: dropDownMenuTextStyle,
//             ),
//             onTap: () {
//               Navigator.pushNamed(context, settings);
//             },
//           ),

//           // Logout
//           ListTile(
//             leading: Icon(
//               Icons.logout,
//               size: proportionalWidth(screenWidth, 15),
//             ),
//             title: const Text(
//               "Logout",
//               style: dropDownMenuTextStyle,
//             ),
//             onTap: () async {
//               showErrorDialog(
//                 context,
//                 "Are you sure you want to logout?",
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RightDrawer extends StatelessWidget {
//   const RightDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ;
//     //double statusBarHeight = MediaQuery.of(context).padding.top;
//     //double appBarHeight = kToolbarHeight;
//     //double screenHeight =
//     //MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Drawer(
//       width: proportionalWidth(screenWidth, screenWidth / 1.5),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           bottomLeft: Radius.circular(20),
//         ),
//       ),
//       child: ListTile(
//         leading: const Icon(
//           Icons.person,
//         ),
//         title: Text(
//           AppAuth.auth.currentUser?.userId ?? "No User",
//           style: dropDownMenuTextStyle,
//         ),
//       ),
//     );
//   }
// }

