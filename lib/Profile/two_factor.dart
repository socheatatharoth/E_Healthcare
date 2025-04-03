
import 'package:flutter/material.dart';

class TwoFactor extends StatefulWidget {
  const TwoFactor({super.key});

  @override
  State<TwoFactor> createState() => _TwoFactorState();
}

class _TwoFactorState extends State<TwoFactor> {
  bool _ischecked = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;
  @override
  Widget build(BuildContext context) {
    return
      // debugShowCheckedModeBanner: false,
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_ios),
                     color: Colors.white,
                     onPressed: () {
                        Navigator.pop(context);    
                      },
                        ),
          title: Center(child: Text("Two-Factor Authentication",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          backgroundColor: Color.fromARGB(255, 50, 105, 201),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 25,top: 25,right: 10),
            child: Container(
              // Main column
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add extra security to your account", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(height: 15,),
                  Text('Two-factor authentication protects your account by requiring an additional code when you log in on a device we don\'t recognize',
                    style: TextStyle(fontSize: 13)
                  ),
                  SizedBox(height: 20,),
                  Text('Choose your security method',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // each row
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Biometric', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                            Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Recommended',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 108, 247, 166)),),
                                SizedBox(width: 10,),
                                SizedBox(
                                  width: 160,
                                  child: Text('We\'ll scan your ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                                )
                              ],
                              ),
                            SizedBox(
                            width: 200,
                            child: Text('fingerprint or face id, so you just use your fingerprint or face id to unlock your account',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                            ),
                            ],
                          ),
          
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                                      icon: Icon(
                                        _ischecked
                                            ? Icons.radio_button_checked // Show password icon
                                            : Icons.radio_button_off,
                                            color: _ischecked ? Colors.blue : Colors.grey,// Hide password icon
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _ischecked = !_ischecked;  // Toggle password visibility
                                        });
                                      },
                                    ),
                          ), 
                        ],
                       ),
                       SizedBox(height: 30,),
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Authentication app', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                            
                            SizedBox(
                            width: 240,
                            child: Text('We\'ll recommend an app to download if you don\'t have one. It will generate a code you\'ll enter when you log in',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                            ),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                                      icon: Icon(
                                        _ischecked2
                                            ? Icons.radio_button_checked // Show password icon
                                            : Icons.radio_button_off,
                                            color: _ischecked2 ? Colors.blue : Colors.grey,// Hide password icon
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _ischecked2 = !_ischecked2;  // Toggle password visibility
                                        });
                                      },
                                    ),
                          ), 
                        ],
                       ), 
                       SizedBox(height: 30,),
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SMS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                            
                            SizedBox(
                            width: 240,
                            child: Text('We\'ll send a code to the mobile number you choose',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
                            ),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: IconButton(
                                      icon: Icon(
                                        _ischecked3
                                            ? Icons.radio_button_checked // Show password icon
                                            : Icons.radio_button_off,
                                            color: _ischecked3 ? Colors.blue : Colors.grey,// Hide password icon
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _ischecked3 = !_ischecked3;  // Toggle password visibility
                                        });
                                      },
                                    ),
                          ), 
                        ],
                       ),

                      ],
                    ),
                  ),
                   SizedBox(height: 130,),
                     Column(
                       children: [
                         Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: const Color.fromARGB(245, 67, 66, 66)
                              )
                            )
                          ),
                        
                         ),
                         SizedBox(height: 5,),
                         ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 50, 105, 201)
                            ), 
                            child: Center(child: Text('Next',style: TextStyle(color: Colors.white),),
                            )
                          ),
                       ],
                     )
                ],
              ),
            ),
          ),
          
        ),
      );
  }
}