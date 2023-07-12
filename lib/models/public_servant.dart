class PublicServant {
  int id;
  String fullName;
  String surname;
  int age;
  DateTime dateOfBirth;
  String? currentRole;
  String? roleUID;
  String? roleOfTheUID;
  List<String>? previousRoles;
  String education;
  List<String>? otherPositions;
  String? politicalPartyAffiliation;

  PublicServant({
    required this.id,
    required this.fullName,
    required this.surname,
    required this.age,
    required this.dateOfBirth,
    this.currentRole,
    required this.roleUID,
    required this.roleOfTheUID,
    this.previousRoles,
    required this.education,
    this.otherPositions,
    this.politicalPartyAffiliation,
  }) : assert(previousRoles != null || currentRole != null,
            'At least one of previousRoles or currentRole must be provided.');

  Map<String, dynamic> get attributes => {
        'fullName': fullName,
        'surname': surname,
        'age': age,
        'dateOfBirth': dateOfBirth,
        'currentRole': currentRole ?? 'none',
        'roleUID': roleUID ?? 'none',
        'roleOfTheUID': roleOfTheUID ?? 'none',
        'previousRoles': previousRoles ?? ['none'],
        'education': education,
        'otherPositions': otherPositions ?? ['none'],
        'politicalPartyAffiliation': politicalPartyAffiliation ?? 'none',
      };
}
