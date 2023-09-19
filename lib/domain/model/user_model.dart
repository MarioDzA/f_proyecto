class User {
  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthday,
    required this.grade,
    required this.school,
    required this.difficulty,
    required this.lastresult,
  });

  int? id;
  String firstName;
  String lastName;
  String email;
  int password;
  String birthday;
  String grade;
  String school;
  String difficulty;
  String lastresult;

  String get name => '$firstName $lastName';

  String get emailAddress => email;
  String get getbirthday => birthday;
  String get getgrade => grade;
  String get getschool => school;
  String get getdifficulty => difficulty;
  String get getlastresult => lastresult;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        password: json["password"] ?? "somepassword",
        birthday: json["birthday"] ?? "somebirthday",
        grade: json["grade"] ?? "somegrade",
        school: json["school"] ?? "someschool",
        difficulty: json["getdifficulty"] ?? "somegetdifficulty",
        lastresult: json["lastresult"] ?? "somelastresult",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": email,
        "birthday": birthday,
        "grade": grade,
        "school": school,
        "difficulty": difficulty,
        "lastresult": lastresult,
      };
}