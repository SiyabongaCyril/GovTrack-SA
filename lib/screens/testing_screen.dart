import 'package:flutter/material.dart';
// import 'package:gov_track_sa/widgets/status_bar_container.dart';
// import '../utilities/dimension_methods.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double statusBarHeight = MediaQuery.of(context).padding.top;
//     double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;
//     //double screenWidth = MediaQuery.of(context).size.width;
//     return StatusBarContainer(
//       widget: Scaffold(
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             Text(
//               features[0],
//               style: TextStyle(
//                 fontSize: proportionalHeight(screenHeight, 16),
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             Text(
//               features[1],
//               style: TextStyle(
//                 fontSize: proportionalHeight(screenHeight, 16),
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             Text(
//               features[2],
//               style: TextStyle(
//                 fontSize: proportionalHeight(screenHeight, 16),
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             Text(
//               features[3],
//               style: TextStyle(
//                 fontSize: proportionalHeight(screenHeight, 16),
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// List<String> features = [
//   "View Politician's Profiles",
//   "Access Political Party Information",
//   "Do you want an aleter for the\nState of the Nation Address\nWe got you.",
//   "Offline Access?\nLet's get started."
// ];

class SwipeableTextScreen extends StatelessWidget {
  SwipeableTextScreen({super.key});

  final List<String> texts = [
    'Text 1',
    'Text 2',
    'Text 3',
    'Text 4',
    'Text 5',
    'Text 6',
    'Text 7',
    'Text 8',
    'Text 9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipeable Text Screen'),
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.grey[300],
            child: ListView.builder(
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(texts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
