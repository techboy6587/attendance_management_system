import 'package:attendance_management_system/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attendancepage.dart';

class SemesterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SemesterPageState();
}

class SemesterPageState extends State<SemesterPage> {
  final List<String> _schools = [
    'USAR',
    'USDI',
  ];
  final List<String> _usarCourses = [
    'AIDS',
    'AIML',
    'IIOT',
    'AR',
  ];
  final List<String> _usdiCourses = [
    'Industrial Design',
    'Interaction Design',
    'Interior Design'
  ];

  final List<String> _subjects = [
    'Computer Networks',
    'AI & its applications',
  ];
  String? _dropDownValue;
  String? _selectedSchool;
  String? _selectedBranch;
  final List<String> _batch = ['B1', 'B2'];
  String? _selectedBatch;
  final List<String> _semester = ['1', '2', '3'];
  String? _selectedSemester;

  List<String> branches = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          SharedPreferences pref = 
                            await SharedPreferences.getInstance();
                          await pref.clear();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                        },
                        style: 
                        ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color.fromRGBO(4, 29, 83, 1)),
                        
                            
                          ),
                        icon: Icon(
                          Icons.logout_sharp,
                          color: Colors.white,
                        ),
                        label: Text('Logout',
                  )
                ),
                  ))  
            ],
        
        )
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 10,
              child: Center(
                child: Icon(
                  Icons.person_rounded,
                  size: 60,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // margin: const EdgeInsets.fromLTRB(120, 251, 0, 0),
                    // padding: const EdgeInsets.fromLTRB(120, 251, 0, 0),
                    child: Text(
                      "Rahul Johari",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.fromLTRB(43, 24, 43, 0),
                    child: Text(
                      "Professor",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(4, 29, 83, 1),
                              ),
                              margin: EdgeInsets.all(10.0),
                              width: 320,
                              alignment: Alignment.center,
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(5),
                                isExpanded: true,
                                iconEnabledColor: Colors.white,
                                value: _selectedSchool,
                                underline: SizedBox(),
                                items: _schools
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Center(
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: onChangedCallback,
                                hint: Center(
                                  child: Text(
                                    "Select School",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                dropdownColor: Color.fromRGBO(0, 70, 121, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(4, 29, 83, 1),
                              ),
                              width: 320,
                              alignment: Alignment.center,
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(5),
                                isExpanded: true,
                                iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: _selectedBranch,
                                items: branches
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Center(
                                          child: Text(item,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        )))
                                    .toList(),
                                onChanged: (branch) =>
                                    setState(() => _selectedBranch = branch!),
                                hint: Center(
                                  child: Text(
                                    "Select Branch",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                dropdownColor: Color.fromRGBO(0, 70, 121, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(4, 29, 83, 1),
                              ),
                              width: 320,
                              alignment: Alignment.center,
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                                iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: _selectedBatch,
                                items: _batch
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Center(
                                          child: Text(item,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        )))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => _selectedBatch = item!),
                                hint: Center(
                                  child: Text(
                                    "Select Batch",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                dropdownColor: Color.fromRGBO(0, 70, 121, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(4, 29, 83, 1),
                              ),
                              width: 320,
                              alignment: Alignment.center,
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(5),
                                isExpanded: true,
                                iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: _selectedSemester,
                                items: _semester
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Center(
                                          child: Text(item,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              )),
                                        )))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => _selectedSemester = item!),
                                hint: Center(
                                  child: Text(
                                    "Select Semester",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                dropdownColor: Color.fromRGBO(0, 70, 121, 1),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(4, 29, 83, 1),
                                ),
                                width: 320,
                                alignment: Alignment.center,
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(5),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  value: _dropDownValue,
                                  items: _subjects
                                      .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                                      .toList(),
                                  onChanged: (item) =>
                                      setState(() => _dropDownValue = item!),
                                  hint: const Center(
                                    child: Text(
                                      "Select Subject",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  dropdownColor: Color.fromRGBO(0, 70, 121, 1),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 50),
                    backgroundColor: Color.fromRGBO(0, 70, 121, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AttendancePage()));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void onChangedCallback(school) {
    if (school == 'USAR') {
      branches = _usarCourses;
    } else if (school == 'USDI') {
      branches = _usdiCourses;
    } else {
      branches = [];
    }
    setState(() {
      _selectedBranch = null;
      _selectedBatch = null;
      _selectedSemester = null;
      _selectedSchool = school;
    });
  }
}
