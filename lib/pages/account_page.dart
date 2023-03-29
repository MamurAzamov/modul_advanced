import 'package:flutter/material.dart';
import 'package:modul_advanced/service/secure_service.dart';

import '../model/account_model.dart';
import '../service/log_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const String id = 'account_page';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = '';
  String useremail = '';
  String userphone = '';
  String userpassword = '';
  String userconfirmpsw = '';

  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("Let's Get Started",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(height: 10,),
                  Text("Create an account to Q Allure to get all features",style: TextStyle(color: Colors.grey[600]),),
                  const SizedBox(height: 40,),

                  // Name
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
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  //Email
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
                            icon: Icon(Icons.email_outlined),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  // Phone
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
                        controller: _phonecontroller,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.phone_android_outlined),
                            hintText: 'Phone',
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
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock_open_outlined),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  // Confirm Password
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
                        controller: _confirmcontroller,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock_open_outlined),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  // CREATE
                  Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[800],
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Users(
                            username = _namecontroller.text, useremail = _emailcontroller.text,
                              userphone = _phonecontroller.text, userpassword = _passwordcontroller.text,
                            userconfirmpsw = _confirmcontroller.text
                          ) ;
                          SecureService.storeApiKey('Name $username, Email $useremail, Phone $userphone, Password $userpassword, Confirm password $userconfirmpsw');
                          SecureService.loadApiKey().then((value) => {
                            LogService.w(value.toString()),
                          });
                        });
                      },
                      child: const Center(
                        child: Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 55,),

                  // LOGIN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.w700),),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text("Login here",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),),
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
