// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fyphammad/components/email_and_pass_text_field.dart';
import 'package:fyphammad/src/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 25, 37),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth * 0.06,
                ),
              ),
              Text(
                "Connect with your friends today",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomTextField(
                color: Colors.transparent,
                icon: Icon(Icons.email),
                text: "Enter your username",
                obsecure: false,
              ),
              CustomTextField(
                color: Colors.transparent,
                icon: Icon(Icons.email),
                text: "Enter email address",
                obsecure: false,
              ),
              CustomTextField(
                color: Colors.transparent,
                icon: Icon(Icons.email),
                text: "Enter Phone number",
                obsecure: false,
              ),
              CustomTextField(
                color: Colors.transparent,
                icon: Icon(Icons.password),
                text: "Enter Password",
                obsecure: true,
              ),
              SizedBox(height: screenHeight * 0.01),

              //SignUPBTN
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    color: const Color(0xffFE6262),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              //Divider\
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Or With",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              //Facebook btn
              GestureDetector(
                onTap: () {
                  print("Facebook btn");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    color: const Color(0xffFE6262),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/facebook.png",
                          height: 25,
                        ),
                        SizedBox(
                          width: screenHeight * 0.01,
                        ),
                        Text(
                          "Login with Facebook",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //login with ggolge
              GestureDetector(
                onTap: () {
                  print("Google btn");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/google.png",
                          height: 25,
                        ),
                        SizedBox(
                          width: screenHeight * 0.01,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.042,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),

              GestureDetector(
                onTap: () {
                  print("dont have an account");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?       ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
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
