import 'record_list.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class RecordPassword extends StatelessWidget {
  const RecordPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PassRecord());
  }
}

class PassRecord extends StatefulWidget {
  const PassRecord({super.key});

  @override
  _PassRecordState createState() => _PassRecordState();
}

class _PassRecordState extends State<PassRecord> {
  String enteredPin = '';

  void onKeyPress(String value) {
    if (enteredPin.length < 4) {
      setState(() {
        enteredPin += value;
      });

      if (enteredPin.length == 4) {
        Future.delayed(Duration(milliseconds: 300), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ToRecordList()),
          );
        });
      }
    }
  }

  void onDelete() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  Widget buildPinDots({double size = 20}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: size * 0.3),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color:
                index < enteredPin.length
                    ? const Color.fromARGB(255, 204, 203, 203)
                    : Colors.white,
            border: Border.all(color: Colors.grey),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(height: 10),
          Text(
            "Jeon Jungkook",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.blue,
            ),
          ),
          Text(
            "Welcome to Record History",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              // fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Enter Password",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              // fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          buildPinDots(size: 31),
          SizedBox(height: 20),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemCount: 11,
              itemBuilder: (context, index) {
                int? num;
                if (index < 9) {
                  num = index + 1;
                } else if (index == 9) {
                  num = null;
                } else if (index == 10) {
                  num = 0;
                }
                return num != null
                    ? Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => onKeyPress(num.toString()),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "$num",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : Container();
              },
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onDelete,
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
