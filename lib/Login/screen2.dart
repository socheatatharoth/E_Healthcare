

import 'package:flutter/material.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.pop(context);
                    },
                   child: Row(
                    // mainAxisSize: MainAxisSize.min, // Make row fit content
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18,color: Color.fromARGB(255, 50, 105, 201),),  // Reduce spacing between icon and text
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 105, 201),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                    ),
                 ),
                 SizedBox(height: 20,),
               
                   Center(
                    child: SizedBox(
                      width: 190,
                      child: Text('Answer the Question below',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,))),
                   ),

                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("What is your pet's name?", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[500]),),
                ),
                SizedBox(height: 10,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        labelText: "Enter security question answer",
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold
                        ),
                       
                        filled: false,
                        // fillColor: Color(0xFFD7DEFC), 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("What school did you attend for sixth grade?", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[500]),),
                ),
                SizedBox(height: 10,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        labelText: "Enter security question answer",
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold
                        ),
                       
                        filled: false,
                        // fillColor: Color(0xFFD7DEFC), 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
              
                 
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 132, 245),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                  ),
                ),
                 SizedBox(
                      height: 60,
                    ),
                     SizedBox(
        
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width:210,  child: Text("Don't remember the answers to your security questions? click",style: TextStyle(color: Colors.black),)),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const Register()));
                              },
                              child: Text("here",style: TextStyle(color: Colors.blueAccent),),
                            ),
                            
                          ],
                        ),
                     ),
              ],
            ),
        
        ),
      );
  }
}

