import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Widget backArrow = SvgPicture.asset(
    'assets/images/svg/arrow.svg',
    width: 20,
    fit: BoxFit.scaleDown,
  );

  final Widget redRightArrow = SvgPicture.asset(
    'assets/images/svg/red-right-arrow.svg',
    width: 15,
    fit: BoxFit.scaleDown,
  );

  final Widget googleAsset = SvgPicture.asset(
    'assets/images/svg/google.svg',
    width: 25,
    fit: BoxFit.scaleDown,
  );
  final Widget facebookAsset = SvgPicture.asset(
    'assets/images/svg/facebook.svg',
    width: 25,
    fit: BoxFit.scaleDown,
  );

  Widget build(BuildContext context) {
    const mainBgColor = Color(0xfff9f9f9);
    //const white = Color(0xffffffff);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainBgColor,
          toolbarHeight: 30,
          elevation: 0,
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: mainBgColor,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          backArrow,
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              'Sign up',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(height: 70),
                  const Card(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Name',
                          floatingLabelStyle: TextStyle(height: 3),
                          contentPadding: EdgeInsets.only(left: 15, right: 15)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Card(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Email',
                          floatingLabelStyle: TextStyle(height: 3),
                          contentPadding: EdgeInsets.only(left: 15, right: 15)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Card(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Password',
                          floatingLabelStyle: TextStyle(height: 3),
                          contentPadding: EdgeInsets.only(left: 15, right: 15)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      redRightArrow,
                    ],
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Or sign up with social account",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: googleAsset,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: facebookAsset,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50)
          ],
        ));
  }
}
