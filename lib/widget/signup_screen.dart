import 'package:flutter/material.dart';
import 'package:hcmumass/widget/sign_up_option.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 25,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF0A2654),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/image/logo.png'),
              const SizedBox(
                height: 30,
              ),
              SignUpOption(),
            ],
          ),
        ),
      ),
    );
  }
}