import 'widget_barrel.dart';

class PublicServantCard extends StatefulWidget {
  const PublicServantCard({super.key});

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
    double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
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
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: grey,
          //     width: 1.0,
          //   ),
          // ),
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
                          decoration: const BoxDecoration(
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
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/cyril_ramaphosa.jpg",
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
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: grey,
                            //     width: 1.0,
                            //   ),
                            // ),
                            margin: EdgeInsets.only(
                              top: proportionalWidth(screenWidth, 15),
                            ),
                            width: proportionalWidth(screenWidth, 140),
                            child: Text(
                              "Matamela Cyril Ramaphosa",
                              style: TextStyle(
                                fontSize: proportionalHeight(screenHeight, 13),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // Bookmark Icon
                          IconButton(
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
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     color: grey,
                        //     width: 1.0,
                        //   ),
                        // ),
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
                                "71 years old",
                                style: TextStyle(
                                  fontSize:
                                      proportionalHeight(screenHeight, 12),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),

                            // Date of birth
                            Text(
                              "Born 17 November 1952",
                              style: TextStyle(
                                fontSize: proportionalHeight(screenHeight, 12),
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
                  "President of the Republic of South Africa",
                  style: TextStyle(
                    fontSize: proportionalHeight(screenHeight, 12),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // ( Role held since 15 February 2018 )
              Container(
                padding: EdgeInsets.only(
                  bottom: proportionalHeight(screenHeight, 10),
                ),
                child: Text(
                  "(Role held since 15 February 2018)",
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
                  child:
                      CardDropdownItem(isItemOpen: isRoleOpen, title: "Role")),

              //  Role Description
              isRoleOpen
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial."
                        "The president of South Africa is the head of state and head of government of the Republic of South Africa. The president directs the executive branch of the federal government and is the commander-in-chief of the South African National Defence Force. Between 1961 and 1994, the office of head of state was the state presidency. The president is elected by the National Assembly, the lower house of Parliament, and is usually the leader of the largest party, which has been the African National Congress since the first multiracial election was held on 27 April 1994. The Constitution limits the president's time in office to two five-year terms. The president is required to be a member of the National Assembly at the time of the election. Upon election, the president immediately resigns their seat for the duration of the presidential term. The president may be removed either by a motion of no-confidence or an impeachment trial.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )
                  : Container(),

              // Previous roles dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPreviousRolesOpen = !isPreviousRolesOpen;
                  });
                },
                child: CardDropdownItem(
                    isItemOpen: isPreviousRolesOpen, title: "Previous Roles"),
              ),

              // Previous roles list
              isPreviousRolesOpen
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 5),
                          Text(
                            "President of South Africa (2018 to date)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Deputy President of South Africa (2014 to 2018)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "President of the African National Congress (2017 to date)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Deputy President of the African National Congress (2012 to 2017)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "President of the African National Congress Youth League (2008 to 2012)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Deputy President of the African National Congress Youth League (2004 to 2008)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  : Container(),

              // Education dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEducationOpen = !isEducationOpen;
                  });
                },
                child: CardDropdownItem(
                    isItemOpen: isEducationOpen, title: "Education"),
              ),

              // Qualifications list
              isEducationOpen
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 5),
                          Text(
                            "Bachelor of Arts degree in Political Science and Sociology (University of South Africa)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Bachelor of Technology degree in Policing (Tshwane University of Technology)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  : Container(),

              // Other positions dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherPositionsOpen = !isOtherPositionsOpen;
                  });
                },
                child: CardDropdownItem(
                    isItemOpen: isOtherPositionsOpen, title: "Other Positions"),
              ),

              // Other positions list
              isOtherPositionsOpen
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 5),
                          Text(
                            "Member of the National Executive Committee of the African National Congress (2007 to date)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Member of the National Working Committee of the African National Congress (2007 to date)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDropdownItem extends StatelessWidget {
  const CardDropdownItem(
      {super.key, required this.isItemOpen, required this.title});
  final bool isItemOpen;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isItemOpen
            ? const Icon(
                Icons.arrow_drop_down,
                color: orange,
              )
            : const Icon(
                Icons.arrow_right,
                color: orange,
              ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: navyBlue,
          ),
        ),
      ],
    );
  }
}
