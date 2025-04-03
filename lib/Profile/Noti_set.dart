import 'package:flutter/material.dart';

class Noti_setting extends StatefulWidget {
  const Noti_setting({super.key});

  @override
  State<Noti_setting> createState() => _Noti_settingState();
}

class _Noti_settingState extends State<Noti_setting> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;
  bool _ischecked4 = false;
  bool _ischecked5 = false;
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
          title: Center(child: Text("Notification Setting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          backgroundColor: Color.fromARGB(255, 50, 105, 201),
        
        ),
        body: Padding(padding: EdgeInsets.only(left: 30, right: 20,top: 25),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Text('Show notifications',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked = !_ischecked;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Floating Notifications',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                        Text('allow floating notifications',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)
                      ],
                    ),
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked1
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked1 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked1 = !_ischecked1;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
              
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lock screen Notifications',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                        Text('allow lock screen notifications',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)
                      ],
                    ),
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked2
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked2 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked2 = !_ischecked2;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
              
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Text('Allow sound',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked3
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked3 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked3 = !_ischecked3;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
             
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Text('Allow vibration',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked4
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked4 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked4 = !_ischecked4;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
              
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: Text('Allow using LED light',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                    ),
                  IconButton(
                      icon: Icon(
                        _ischecked5
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked5 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked5 = !_ischecked5;  // Toggle password visibility
                            });
                          },
                        ),
                ],
              ),
            ],
          )
            
        ),
      );
    
  }
}