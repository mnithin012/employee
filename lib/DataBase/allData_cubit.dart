import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import 'all_Data_State.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseState());
  List _allConnectedDevices;
  Box storageBox;
  Map _allVitalsData = {};
  List openedData;
  int id = 0;
  String name = "";
  String userName = "";
  String eMail = "";
  String profileImage = "";
  String phone = "";
  String website = "";
  String street = "";
  String suite = "";
  String city = "";
  String zipcode = "";
  String companyName = "";
  String catchPhrase = "";
  String bs = "";
  Future<void> saveAllVitalsData() async {
    Map<String, dynamic> data = {
      "id": id,
      "name": name == "" ? "NA" : name,
      "username": userName == "0" ? "NA" : userName,
      "email": eMail == " " ? "NA" : eMail,
      "profile_image": profileImage == "" ? "NA" : profileImage,
      "address": {
        "street": street == "" ? "NA" : street,
        "suite": suite == " " ? "NA" : suite,
        "city": city == " " ? "NA" : city,
        "zipcode": zipcode == " " ? "NA" : zipcode,
      },
      "phone": phone == "" ? "NA" : phone,
      "website": website == "" ? "NA" : website,
      "company": {
        "name": companyName == "" ? "NA" : companyName,
        "catchPhrase": catchPhrase == " " ? "NA" : catchPhrase,
        "bs": bs == " " ? "NA" : bs,
      },
    };
    //_connectedDevice = device;
    await openBox();
    //to check hive is empty for storing first device
    if (storageBox.isEmpty) {
      await addData(data);
    } else if (storageBox.isNotEmpty) {
      await storageBox.clear();
      await addData(data);
    }
    openedData = storageBox.toMap().values.toList();
    openedData = storageBox.toMap().values.toList();
    print("------OPENDATA: $openedData");
    Map<dynamic, dynamic> datas = storageBox.toMap().values.first;
    var id1 = data["id"];
    print("---------------$id1=====");
    //_allVitalsData = openedData;
    print("-----------data---------$data==-----------");
  }

  Future<void> loadStoredAllVitalsData() async {
    await openBox();
    Map<dynamic, dynamic> data = {
      "id": id,
      "name": name == "" ? "NA" : name,
      "username": userName == "0" ? "NA" : userName,
      "email": eMail == " " ? "NA" : eMail,
      "profile_image": profileImage == "" ? "NA" : profileImage,
      "address": {
        "street": street == "" ? "NA" : street,
        "suite": suite == " " ? "NA" : suite,
        "city": city == " " ? "NA" : city,
        "zipcode": zipcode == " " ? "NA" : zipcode,
      },
      "phone": phone == "" ? "NA" : phone,
      "website": website == "" ? "NA" : website,
      "company": {
        "name": companyName == "" ? "NA" : companyName,
        "catchPhrase": catchPhrase == " " ? "NA" : catchPhrase,
        "bs": bs == " " ? "NA" : bs,
      },
    };
    if (storageBox.isNotEmpty && storageBox.toMap().values.length != 0) {
      data = storageBox.toMap().values.first;
    }
    _allVitalsData = data;
  }

  Map get allVitalsData => _allVitalsData;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    storageBox = await Hive.openBox("AllEmployeesData");
  }

  Future addData(Map<String, dynamic> data) async {
    await storageBox.add(data);
  }

  getApplicationDocumentsDirectory() {}
}
