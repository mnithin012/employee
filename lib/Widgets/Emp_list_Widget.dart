
import 'package:employees_app/Data/Constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeListDetails extends StatelessWidget {
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
  EmployeeListDetails(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  FadeInImage(
                    image: profileImage == ""
                        ? AssetImage("assets/icons/user.png")
                        : NetworkImage(profileImage, scale: 1),
                    placeholder: AssetImage("assets/icons/user.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Employee Name",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "${name.toString()}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "UserName",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "${userName.toString()}",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "E-Mail",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "${eMail.toString()}",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Website",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "${street.toString()}",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Company",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "Degard Technology",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Street",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "${street.toString()}",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "City",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "${city.toString()}",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "PostCode",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Constants.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                      Expanded(
                        child: Text(
                          "6278963",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Constants.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
