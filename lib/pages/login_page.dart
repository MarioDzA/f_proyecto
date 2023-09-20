import 'package:f_elproyecto/pages/controllers/authcontroller.dart';
import 'package:f_elproyecto/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final _gradeController = TextEditingController();
  final _schoolController = TextEditingController();
  final dateInput = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  _login(theEmail, thePassword) async {
    logInfo('_login $theEmail $thePassword');
    try {
      await authenticationController.login(theEmail, thePassword);
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Enter",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const Key('TextFormFieldemail'),
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: 'Email'),
              ),TextFormField(
                key: const Key('TextFormFieldpassword'),
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                key: const Key('TextFormFieldBirthday'),
                controller: dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Birth date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate!);

                  setState(() {
                    dateInput.text = formattedDate;
                  });
                },
              ),
              TextFormField(
                key: const Key('TextFormFieldAge'),
                controller: _gradeController,
                decoration: const InputDecoration(labelText: 'Grade'),
              ),
              TextFormField(
                key: const Key('TextFormFieldSchool'),
                controller: _schoolController,
                decoration: const InputDecoration(labelText: 'School'),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  key: const Key('ButtonLoginSubmit'),
                   onPressed: (){Get.to( HomePage( key: const Key('HomePage'),));},
                  //() async {
                  //         // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                  //         FocusScope.of(context).requestFocus(FocusNode());
                  //         final form = _formKey.currentState;
                  //         form!.save();
                  //         if (_formKey.currentState!.validate()) {
                  //           await _login(
                  //               controllerEmail.text, controllerPassword.text);
                  //         }
                  //       },
                  child: const Text('Submit'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
