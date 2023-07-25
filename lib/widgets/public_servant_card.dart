import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gov_track_sa/utilities/pair.dart';
import 'main_ui/drop_down_item.dart';
import 'social_media_icon_button.dart';
import 'widget_barrel.dart';

class PublicServantCard extends StatefulWidget {
  const PublicServantCard({
    super.key,
    required this.imagePath,
    required this.fullName,
    required this.surname,
    required this.age,
    required this.dateOfBirth,
    required this.role,
    required this.roleStartDate,
    required this.roleDescription,
    this.previousRoles,
    this.education,
    this.otherPositions,
    this.facebookLink,
    this.twitterLink,
    this.instagramLink,
  });
  final String imagePath;
  final String fullName;
  final String surname;
  final int age;
  final DateTime dateOfBirth;
  final String role;
  final DateTime roleStartDate;
  final String roleDescription;
  final Map<String, Pair<int, String>>? previousRoles;
  final Map<String, String>? education;
  final Map<String, Pair<int, String>>? otherPositions;
  final String? facebookLink;
  final String? twitterLink;
  final String? instagramLink;

  @override
  State<PublicServantCard> createState() => _PublicServantCardState();
}

class _PublicServantCardState extends State<PublicServantCard> {
  bool isBookmarked = false;
  bool isRoleOpen = false;
  bool isPreviousRolesOpen = false;
  bool isEducationOpen = false;
  bool isOtherPositionsOpen = false;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double bottomNavBarHeight = MediaQuery.of(context).padding.bottom;

    double screenHeight = MediaQuery.of(context).size.height -
        statusBarHeight -
        appBarHeight -
        bottomNavBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Card(
        elevation: 0,
        color: white,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: proportionalWidth(screenWidth, 10),
            vertical: proportionalHeight(screenHeight, 5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Public Servant Card Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Public Servant Image
                  Padding(
                    padding: EdgeInsets.only(
                      right: proportionalWidth(screenWidth, 16),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: proportionalWidth(screenWidth, 116),
                          height: proportionalHeight(screenHeight, 116),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: orange,
                          ),
                        ),
                        Container(
                          width: proportionalWidth(screenWidth, 112),
                          height: proportionalHeight(screenHeight, 112),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          width: proportionalWidth(screenWidth, 110),
                          height: proportionalHeight(screenHeight, 110),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/${widget.imagePath}",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Public Servant Details
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Name
                          Container(
                            margin: EdgeInsets.only(
                              top: proportionalWidth(screenWidth, 15),
                            ),
                            width: proportionalWidth(screenWidth, 140),
                            child: Text(
                              "${widget.fullName} ${widget.surname}",
                              style: TextStyle(
                                fontSize: proportionalHeight(screenHeight, 14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // Bookmark Icon
                          IconButton(
                            alignment: AlignmentDirectional.bottomEnd,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                isBookmarked = !isBookmarked;
                              });
                            },
                            icon: isBookmarked
                                ? Icon(
                                    Icons.bookmark_rounded,
                                    size: proportionalWidth(screenWidth, 20),
                                    color: orange,
                                  )
                                : Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: proportionalWidth(screenWidth, 20),
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: proportionalWidth(screenWidth, 180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Age
                            Container(
                              padding: EdgeInsets.only(
                                top: proportionalHeight(screenHeight, 5),
                                bottom: proportionalHeight(screenHeight, 5),
                              ),
                              child: Text(
                                "${widget.age} years old",
                                style: TextStyle(
                                  fontSize:
                                      proportionalHeight(screenHeight, 13),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),

                            // Date of birth
                            Text(
                              "Born 17 November 1952",
                              style: TextStyle(
                                fontSize: proportionalHeight(screenHeight, 13),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),

              // Role
              Container(
                padding: EdgeInsets.only(
                  top: proportionalHeight(screenHeight, 10),
                  bottom: proportionalHeight(screenHeight, 2),
                ),
                child: Text(
                  widget.role,
                  style: TextStyle(
                    fontSize: proportionalHeight(screenHeight, 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Role Period
              Container(
                padding: EdgeInsets.only(
                  bottom: proportionalHeight(screenHeight, 10),
                ),
                child: Text(
                  "(Role held since ${widget.roleStartDate.day} ${getMonthName(widget.roleStartDate.month)} ${widget.roleStartDate.year})",
                  style: TextStyle(
                    fontSize: proportionalHeight(screenHeight, 12),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),

              // Role dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isRoleOpen = !isRoleOpen;
                  });
                },
                child: DropdownItem(
                  isItemOpen: isRoleOpen,
                  title: "Role",
                  content: [
                    Text(
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial.",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              // Previous roles dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPreviousRolesOpen = !isPreviousRolesOpen;
                  });
                },
                child: DropdownItem(
                  isItemOpen: isPreviousRolesOpen,
                  title: "Previous Roles",
                  content: [
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      widget.previousRoles!.keys.elementAt(0),
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 13),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      "Deputy President of South Africa (2014 to 2018)",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                  ],
                ),
              ),

              // Education dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEducationOpen = !isEducationOpen;
                  });
                },
                child: DropdownItem(
                  isItemOpen: isEducationOpen,
                  title: "Education",
                  content: [
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      "Bachelor of Arts degree in Political Science and Sociology (University of South Africa)",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      "Bachelor of Technology degree in Policing (Tshwane University of Technology)",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              // Other positions dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherPositionsOpen = !isOtherPositionsOpen;
                  });
                },
                child: DropdownItem(
                  isItemOpen: isOtherPositionsOpen,
                  title: "Other Positions",
                  content: [
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      "Member of the National Executive Committee of the African National Congress (2007 to date)",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: proportionalHeight(screenHeight, 5)),
                    Text(
                      "Member of the National Working Committee of the African National Congress (2007 to date)",
                      style: TextStyle(
                        fontSize: proportionalHeight(screenHeight, 14),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              // Affiliations
              const Text(
                "Affiliated with the African National Congress (ANC).",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),

              SizedBox(
                height: proportionalHeight(screenHeight, 20),
              ),

              // Social media icons
              Padding(
                padding: EdgeInsets.only(
                  left: proportionalWidth(screenWidth, 10),
                ),
                child: Row(
                  children: [
                    // Facebook
                    SocialMediaIconButton(
                      iconData: FontAwesomeIcons.facebook,
                      onPressed: () {},
                    ),

                    // Twitter
                    SocialMediaIconButton(
                      iconData: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),

                    // Instagram
                    SocialMediaIconButton(
                      iconData: FontAwesomeIcons.instagram,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Create a public servant card for the president of the African National Congress
PublicServantCard cyrilRamaphosa = PublicServantCard(
  imagePath: "cyril_ramaphosa.jpg",
  fullName: "Cyril Matamela",
  surname: "Ramaphosa",
  age: 71,
  dateOfBirth: DateTime(1952, 11, 17),
  role: "President of the Republic of South Africa",
  roleStartDate: DateTime(2018, 2, 15),
  roleDescription:
      "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial.",
  previousRoles: {
    "Deputy President of South Africa": Pair(first: 2014, second: "2018"),
    "President of the African National Congress":
        Pair(first: 2017, second: "date"),
    "Deputy President of the African National Congress":
        Pair(first: 2012, second: "2017"),
    "President of the African National Congress Youth League":
        Pair(first: 2008, second: "2012"),
    "Deputy President of the African National Congress Youth League":
        Pair(first: 2004, second: "2008"),
  },
  education: const {
    "Bachelor of Arts degree in Political Science and Sociology":
        "University of South Africa",
    "Bachelor of Technology degree in Policing":
        "Tshwane University of Technology",
  },
  otherPositions: {
    "Member of the National Executive Committee of the African National Congress":
        Pair(first: 2007, second: "date"),
    "Member of the National Working Committee of the African National Congress":
        Pair(first: 2007, second: "date"),
  },
);

// function: return a month name from a month number
String getMonthName(int monthNumber) {
  // Create a list of month names in order
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // Validate the month number to be within the range 1-12
  if (monthNumber < 1 || monthNumber > 12) {
    throw ArgumentError('Invalid month number: $monthNumber');
  }

  // Subtract 1 from the month number to access the corresponding index in the list
  return months[monthNumber - 1];
}
