import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/view/dashboardpage/dashboardpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedUserType = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 46, 77),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 52, 87),
        title: Text('Email Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  boo: false,
                  string1: 'Please enter the username',
                  string2: 'Username'),
              SizedBox(height: 16.0),
              CustomTextFormField(
                  boo: true,
                  string1: 'Please enter the password',
                  string2: 'password'),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                dropdownColor: Color.fromARGB(255, 11, 55, 91),
                style: TextStyle(color: Colors.white),
                value: _selectedUserType,
                items: [
                  DropdownMenuItem(
                    value: 'Student',
                    child: Text('Student'),
                  ),
                  DropdownMenuItem(
                    value: 'Admin',
                    child: Text('Admin'),
                  ),
                  DropdownMenuItem(
                    value: 'Teacher',
                    child: Text('Teacher'),
                  ),
                  DropdownMenuItem(
                    value: 'Parent',
                    child: Text('Parent'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedUserType = value!;
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'User Type',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 61, 107)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login operation
                    Get.off(StudentDashboard());
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField CustomTextFormField(
      {required String string1, required String string2, required bool boo}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return string1;
        }
        return null;
      },
      obscureText: boo,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            //borderRadius: BorderRadius.circular()
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 108, 100, 100))),
        labelText: string2,
      ),
    );
  }
}
