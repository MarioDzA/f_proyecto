import 'package:f_elproyecto/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key,})
      : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _schoolController = TextEditingController();
  final dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form( key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
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
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  key: const Key('TextFormFieldSchool'),
                  controller: _schoolController,
                  decoration: const InputDecoration(labelText: 'School'),
                ),
                ElevatedButton(
                  key: const Key('ButtonLoginSubmit'),
                  onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      Get.to(HomePage(
                            key: const Key('HomePage'),));
/*                      if (form.validate()) {
                        if (widget.email == _emailController.text &&
                            widget.password == _passwordController.text) {
                          Get.to(HomePage(
                            key: const Key('HomePage'),
                            loggedEmail: _emailController.text,
                            loggedPassword: _passwordController.text,
                          ));
                        } else {
                          const snackBar = SnackBar(
                            content: Text('User or password nok'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     }
*/                    },
                  child: const Text('Submit'),
          ),]
          ),
          ),
          ),
      ),
    );
  }
}