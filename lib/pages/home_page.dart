import 'package:flutter/material.dart';
import 'package:modul_advanced/pages/account_page.dart';

import '../model/user_model.dart';
import '../service/log_service.dart';
import '../service/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userpost = '';

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Image
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/loginpage.webp')
                      )
                    ),
                  ),
                  const Text('Welcome back!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(height: 10,),
                  Text('Log in to your existant account of Q Allure',style: TextStyle(color: Colors.grey[600]),),
                  const SizedBox(height: 40,),

                  // Email
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                      ),
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_outline),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  // Password
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                      ),
                      child: TextField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock_outline),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Forgot Password?',style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  // LOGIN
                  Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[900],
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          var user = User(userpost = _emailcontroller.text, userpost = _passwordcontroller.text) ;
                          PrefService.storeUser(user);
                          PrefService.loadUser().then((value) => {
                            LogService.i(value!.toJson().toString()),
                          });
                        });
                      },
                      child: const Center(
                        child: Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  const Text("Or connect using", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      // Facebook
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[900],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.facebook, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      // Google
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.g_mobiledata_outlined, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 55,),

                  // Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.w700),),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () =>
                        Navigator.pushNamed(context, AccountPage.id),
                        child: const Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}