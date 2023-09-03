import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hcmumass/widget/home_screen.dart';

class SignUpOption extends StatefulWidget {
  const SignUpOption({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInOptionState();
  }
}

class _SignInOptionState extends State<SignUpOption> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _FirstNameController = TextEditingController();
  final _LastNameController = TextEditingController();
  final _emailController = TextEditingController();

  bool passwordVisible = false;

  void _submitUserInfo() async {
    final url = Uri.http('172.16.2.38:4000', '/auth/sign_up');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'username': _usernameController.text,
          'password': _passwordController.text,
          'first_name': _FirstNameController.text,
          'last_name': _LastNameController.text,
          'email': _emailController.text,
        },
      ),
    );
    print(response.statusCode);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Alegreya',
          ),
        ),
        const Text(
          'Sign up to help you remember to take your medication on time',
          style: TextStyle(
            color: Color.fromARGB(158, 255, 255, 255),
            fontFamily: 'Alegreya Sans',
            fontSize: 19,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _FirstNameController,
          decoration: const InputDecoration(
            label: Text('First Name'),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
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
          height: 10,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _LastNameController,
          decoration: const InputDecoration(
            //label: ,
            label: Text('Last Name'),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
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
          height: 10,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _usernameController,
          decoration: const InputDecoration(
            label: Text('Username'),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
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
          height: 10,
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'email',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 148, 140, 140),
              fontSize: 18,
              fontFamily: 'Alegreya Sans',
            ),
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
          height: 10,
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
            labelText: "Password",
            labelStyle: const TextStyle(
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
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 14),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            content,
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _submitUserInfo,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                backgroundColor: const Color(0xFF7C9A92),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Alegreya Sans',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
