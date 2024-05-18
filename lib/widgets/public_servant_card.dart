import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gov_track_sa/utilities/month_number.dart';
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
    this.politicalParty,
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
  final String? politicalParty;
  final String? facebookLink;
  final String? twitterLink;
  final String? instagramLink;

  @override
  State<PublicServantCard> createState() => _PublicServantCardState();
}

class _PublicServantCardState extends State<PublicServantCard> {
  bool isBookmarked = false;
  bool isRoleOpen = true;
  bool isPreviousRolesOpen = true;
  bool isEducationOpen = true;
  bool isOtherPositionsOpen = true;

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

    final educationListLength = widget.education?.length ?? 0;
    final previousRolesListLength = widget.previousRoles?.length ?? 0;
    final otherPositionsListLength = widget.otherPositions?.length ?? 0;

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
                              "Born ${widget.dateOfBirth.day} "
                              "${getMonthName(widget.dateOfBirth.month)}"
                              "${widget.dateOfBirth.year}",
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
                      widget.roleDescription,
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
                    if (previousRolesListLength == 0) ...{
                      Text(
                        "None",
                        style: TextStyle(
                          fontSize: proportionalHeight(screenHeight, 13),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    } else ...{
                      for (var i = 0; i < previousRolesListLength; i++) ...{
                        Text(
                          "${widget.previousRoles?.keys.elementAt(i)}"
                          " (${widget.previousRoles?.values.elementAt(i).getFirstItem}"
                          " to ${widget.previousRoles?.values.elementAt(i).getSecondItem})",
                          style: TextStyle(
                            fontSize: proportionalHeight(screenHeight, 13),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: proportionalHeight(screenHeight, 5),
                        ),
                      }
                    },
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
                    if (educationListLength == 0) ...{
                      Text(
                        "None",
                        style: TextStyle(
                          fontSize: proportionalHeight(screenHeight, 13),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    } else ...{
                      for (var i = 0; i < educationListLength; i++) ...{
                        Text(
                          "${widget.education?.keys.elementAt(i)}"
                          " (${widget.education?.values.elementAt(i)})",
                          style: TextStyle(
                            fontSize: proportionalHeight(screenHeight, 13),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: proportionalHeight(screenHeight, 5),
                        )
                      }
                    },
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
                    if (otherPositionsListLength == 0) ...{
                      Text(
                        "None",
                        style: TextStyle(
                          fontSize: proportionalHeight(screenHeight, 13),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    } else ...{
                      for (var i = 0; i < otherPositionsListLength; i++) ...{
                        Text(
                          "${widget.otherPositions?.keys.elementAt(i)}"
                          " (${widget.otherPositions?.values.elementAt(i).getFirstItem}"
                          " to ${widget.otherPositions?.values.elementAt(i).getSecondItem})",
                          style: TextStyle(
                            fontSize: proportionalHeight(screenHeight, 14),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: proportionalHeight(screenHeight, 5),
                        ),
                      }
                    },
                  ],
                ),
              ),

              // Affiliations
              Text(
                "Affiliated with the ${widget.politicalParty}",
                style: const TextStyle(
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
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1952, 11, 17),
  role: "President of the Republic of South Africa",
  roleStartDate: DateTime(2018, 2, 15),
  roleDescription:
      "The president of South Africa is the head of state and head of government"
      " of the Republic of South Africa. The president directs the executive"
      " branch of the federal government and is the commander-in-chief of the"
      " South African National Defence Force. Between 1961 and 1994, the office"
      " of head of state was the state presidency. The president is elected by"
      " the National Assembly, the lower house of Parliament, and is usually the"
      " leader of the largest party, which has been the African National "
      " Congress since the first multiracial election was held on 27 April 1994."
      " The Constitution limits the president's time in office to two five-year"
      " terms. The president is required to be a member of the National Assembly"
      " at the time of the election. Upon election, the president immediately"
      " resigns their seat for the duration of the presidential term. The"
      " president may be removed either by a motion of no-confidence or an"
      " impeachment trial",
  previousRoles: {
    "Deputy President of South Africa": Pair(first: 2014, second: "2018"),
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
PublicServantCard thandiModise = PublicServantCard(
  imagePath: "thandi_modise.jpg",
  fullName: "Thandi",
  surname: "Modise",
  age: 68,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1953, 12, 25),
  role: "Chairperson of the National Council of Provinces",
  roleStartDate: DateTime(2019, 5, 22),
  roleDescription:
      "The chairperson of the National Council of Provinces is the presiding officer"
      " of the upper house of the Parliament of South Africa. The chairperson is"
      " responsible for overseeing the proceedings of the council and ensuring that"
      " debates are conducted in an orderly manner. They also represent the council"
      " in its relations with other institutions and perform other functions as"
      " assigned by the constitution or legislation.",
  previousRoles: {
    "Premier of North West Province": Pair(first: 2010, second: "2014"),
    "Member of the National Assembly of South Africa":
        Pair(first: 1994, second: "date"),
  },
  education: const {
    "Matric": "Dikwankwetla High School",
  },
);
PublicServantCard bhekiCele = PublicServantCard(
  imagePath: "bheki_cele.jpg",
  fullName: "Bheki",
  surname: "Cele",
  age: 69,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1952, 4, 22),
  role: "Minister of Police",
  roleStartDate: DateTime(2018, 2, 26),
  roleDescription:
      "The minister of police is responsible for overseeing the South African Police"
      " Service (SAPS) and implementing policies related to law enforcement and"
      " crime prevention. The minister works to ensure the safety and security of"
      " citizens and communities across the country.",
  previousRoles: {
    "Member of the National Assembly of South Africa":
        Pair(first: 2009, second: "date"),
    "Commissioner of the South African Police Service":
        Pair(first: 2009, second: "2011"),
  },
  education: const {
    "Bachelor of Arts degree": "University of Zululand",
    "Bachelor of Science degree in Education": "University of Zululand",
  },
);
PublicServantCard nosiviweMapisaNqakula = PublicServantCard(
  imagePath: "novisiwe_nqakula.jpg",
  fullName: "Nosiviwe",
  surname: "Mapisa-Nqakula",
  age: 65,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1956, 11, 13),
  role: "Minister of Defence and Military Veterans",
  roleStartDate: DateTime(2019, 5, 30),
  roleDescription:
      "The minister of defence and military veterans is responsible for overseeing"
      " the South African National Defence Force (SANDF) and ensuring national"
      " security and defense. The minister also works to address the needs and"
      " welfare of military veterans.",
  previousRoles: {
    "Minister of Correctional Services": Pair(first: 2014, second: "2019"),
    "Minister of Home Affairs": Pair(first: 2012, second: "2014"),
  },
  education: const {
    "Bachelor of Arts degree in Education": "University of Zululand",
  },
);
PublicServantCard davidMabuza = PublicServantCard(
  imagePath: "david_mabuza.jpg",
  fullName: "David",
  surname: "Mabuza",
  age: 62,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1960, 8, 25),
  role: "Deputy President of South Africa",
  roleStartDate: DateTime(2018, 2, 27),
  roleDescription:
      "The deputy president of South Africa is the second-highest executive"
      " position in the government. The deputy president supports the president in"
      " carrying out their duties and may take on specific responsibilities as"
      " assigned by the president.",
  previousRoles: {
    "Premier of Mpumalanga": Pair(first: 2009, second: "2018"),
  },
  education: const {
    "Bachelor of Arts degree": "University of South Africa",
  },
);
PublicServantCard thokoDidiza = PublicServantCard(
  imagePath: "thoko_didiza.jpg",
  fullName: "Thoko",
  surname: "Didiza",
  age: 52,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1969, 9, 27),
  role: "Minister of Agriculture, Land Reform and Rural Development",
  roleStartDate: DateTime(2019, 5, 30),
  roleDescription:
      "The minister of agriculture, land reform, and rural development is"
      " responsible for implementing policies related to agriculture, land reform,"
      " and rural development to promote food security and economic growth in rural"
      " areas.",
  previousRoles: {
    "Minister of Agriculture and Land Affairs":
        Pair(first: 1999, second: "2006"),
    "Minister of Public Works": Pair(first: 2006, second: "2008"),
  },
  education: const {
    "Master's degree in Administration": "University of Pretoria",
  },
);
PublicServantCard fikileMbalula = PublicServantCard(
  imagePath: "fikile_mbalula.jpg",
  fullName: "Fikile",
  surname: "Mbalula",
  age: 50,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1971, 4, 8),
  role: "Minister of Transport",
  roleStartDate: DateTime(2019, 5, 30),
  roleDescription:
      "The minister of transport is responsible for overseeing transportation"
      " systems and infrastructure in South Africa, including road networks,"
      " railways, airports, and public transport.",
  previousRoles: {
    "Minister of Police": Pair(first: 2017, second: "2019"),
    "Minister of Sport and Recreation": Pair(first: 2010, second: "2017"),
  },
  education: const {
    "Bachelor's degree in Political Science and Sociology":
        "University of the North",
    "Honorary Doctorate in Public Administration": "University of Limpopo",
  },
);
PublicServantCard gwenRamokgopa = PublicServantCard(
  imagePath: "gwen_ramokgopa.jpg",
  fullName: "Gwen",
  surname: "Ramokgopa",
  age: 56,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1965, 9, 23),
  role: "High Commissioner of South Africa to Kenya",
  roleStartDate: DateTime(2021, 3, 17),
  roleDescription:
      "The high commissioner of South Africa to Kenya represents the country's"
      " interests and fosters diplomatic relations between South Africa and Kenya.",
  previousRoles: {
    "Mayor of Tshwane": Pair(first: 2016, second: "2019"),
    "Member of the National Assembly of South Africa":
        Pair(first: 2002, second: "2016"),
  },
  education: const {
    "Bachelor of Medicine and Bachelor of Surgery": "University of Natal",
  },
);
PublicServantCard ronaldLamola = PublicServantCard(
  imagePath: "ronald_lamola.jpg",
  fullName: "Ronald",
  surname: "Lamola",
  age: 38,
  politicalParty: "African National Congress (ANC)",
  dateOfBirth: DateTime(1983, 9, 20),
  role: "Minister of Justice and Correctional Services",
  roleStartDate: DateTime(2019, 5, 30),
  roleDescription:
      "The minister of justice and correctional services is responsible for the"
      " administration of justice, legal services, and correctional services in"
      " South Africa.",
  previousRoles: {
    "Member of the National Assembly of South Africa":
        Pair(first: 2014, second: "date"),
  },
  education: const {
    "Bachelor of Laws degree": "University of Venda",
    "Bachelor of Arts degree in International Politics":
        "University of South Africa",
  },
);

List<Widget> leaders = [
  cyrilRamaphosa,
  thandiModise,
  bhekiCele,
  nosiviweMapisaNqakula,
  davidMabuza,
  thokoDidiza,
  fikileMbalula,
  gwenRamokgopa,
  ronaldLamola
];
