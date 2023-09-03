import 'package:flutter/material.dart';
import 'package:hcmumass/widget/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hcmumass/widget/signup_screen.dart';

class SignInOption extends StatefulWidget {
  const SignInOption({super.key});

  @override
  State<SignInOption> createState() {
    return _SignInOptionState();
  }
}

class _SignInOptionState extends State<SignInOption> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void saveUserInfo() async {
    final url = Uri.http('172.16.2.38:4000', '/auth/sign_in');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      ),
    );

    print(response.statusCode);
    if (!context.mounted) {
        return;
      }

    //List<Map<String,dynamic>> resData = json.decode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void toSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Alegreya',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Usually forget your pills? Sign in now, I can help you!',
          style: TextStyle(
            color: Color.fromARGB(158, 255, 255, 255),
            fontFamily: 'Alegreya Sans',
            fontSize: 19,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 38, 253, 135)),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _passwordController,
          obscureText: passwordVisible,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 38, 253, 135)),
            ),
            hintText: "Password",
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
            //helperText: "Password must contain special character",
            helperStyle: TextStyle(color: Colors.green),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off),
              color: Colors.white,
              onPressed: () {
                setState(
                  () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
            ),
            alignLabelWithHint: false,
            filled: true,
          ),
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
        ),
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot your password?',
                style: TextStyle(
                  color: Color.fromARGB(255, 151, 147, 147),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          content,
          ElevatedButton(
            onPressed: saveUserInfo,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 60),
              backgroundColor: const Color(0xFF7C9A92),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(
                fontFamily: 'Alegreya Sans',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Dont have account?',
                style: TextStyle(
                  color: Color.fromARGB(255, 148, 140, 140),
                  fontSize: 15,
                ),
              ),
              TextButton(
                onPressed: toSignUpScreen,
                child: const Text('Sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
