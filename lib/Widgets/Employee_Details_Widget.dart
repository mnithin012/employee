
import 'package:employees_app/Data/Constants.dart';
import 'package:employees_app/Screens/emp_screen/Employee_Data_Screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class EmployeesPageCard extends StatelessWidget {
  final int id;
  final String name;
  final String userName;
  final String eMail;
  final String profileImage;
  final String phone;
  final String website;
  final String companyName;
  final String catchPhrase;
  final String bs;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  EmployeesPageCard(
      this.id,
      this.name,
      this.userName,
      this.eMail,
      this.profileImage,
      this.phone,
      this.website,
      this.companyName,
      this.catchPhrase,
      this.bs,
      this.street,
      this.suite,
      this.city,
      this.zipcode);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          child: ListTile(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmployeeDetailsApp(
                            profileDp: profileImage,
                            nameValue: name,
                            mailId: eMail,
                          ))),
            },
            leading: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: FadeInImage(
                  image: profileImage == ""
                      ? AssetImage("assets/icons/user.png")
                      : NetworkImage(profileImage, scale: 1),
                  placeholder: AssetImage("assets/icons/user.png"),
                )),
            title: Text(
              "Employee ID : ${id.toString()}",
              style: TextStyle(
                  color: Constants.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name : ${name.toString()}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Constants.black,
                  ),
                ),
                Text(
                  "${eMail.toString()}",
                  style: TextStyle(fontSize: 15.0, color: Constants.black),
                ),
                Text(
                  "Company Name : ${companyName.toString()}",
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15.0, color: Constants.black),
                ),

              ],
            ),

          )),
    );
  }
}
