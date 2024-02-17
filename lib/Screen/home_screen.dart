import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fundraiser/Screen/second_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CountryCode? selectedCountry;

  Future<void> _login() async {
    final String apiUrl = 'https://hexeros.com/dev/fund-tool/api/V1/login';

    if (selectedCountry == null) {
      // Handle the case where the user hasn't selected a country code
      print('Please select a country code');
      return;
    }

    Map<String, dynamic> data = {
      'country_code': selectedCountry!.dialCode,
      'mobile': phoneNumberController.text,
      'password': passwordController.text,
      // Add other necessary parameters
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful login, navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      // Handle unsuccessful login (show error message, etc.)
      print('Login failed. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_image.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/Fundtool_image.png',
                      height: constraints.maxHeight * 0.1,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                          ),
                        ),
                        const Text(
                          'Please Login your Account',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          width: constraints.maxWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 16,
                              ),
                            ],
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Image.asset('assets/icons/mobile.png'),
                              border: InputBorder.none,
                              icon:  CountryCodePicker(
                                onChanged: (code) {
                                  setState(() {
                                    selectedCountry = code;
                                  });
                                },
                                initialSelection: 'IN',
                                favorite: ['+91', 'IN'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              hintText: 'Phone Number',
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.06,
                          width: constraints.maxWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 16,
                              ),
                            ],
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                'assets/icons/eye-slash.png',
                              ),
                              border: InputBorder.none,
                              hintText: ' Password',
                              hintStyle: const TextStyle(
                                color: Color(0xff222939),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            color: Color(0xff545454),
                          ),
                        ),
                        InkWell(
                          onTap: _login,
                          child: Container(
                            height: constraints.maxHeight * 0.08,
                            width: constraints.maxWidth * 0.75,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xff2b607b8c),
                                  blurRadius: 16,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(
                                colors: [Color(0xff2C82AF), Color(0xff295772)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: "Didn't get any account? ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff212121),
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2B607B),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
