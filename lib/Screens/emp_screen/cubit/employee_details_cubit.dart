import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'employee_details_state.dart';

class EmployeeDetailsCubit extends Cubit<EmployeeDetailsState> {
  EmployeeDetailsCubit() : super(EmployeeDetailsState(false, []));
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
  List<EmployeeDetailsStateList> employeesDetailsReportList = [];
  Future<void> saveAllEmployeesData() async {
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
  Future<void> fetchEmployeeDetails() async {
    employeesDetailsReportList = [];
    emit(EmployeeDetailsState(
      false,
      employeesDetailsReportList,
    ));
    final url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");
    final String currentTimeZone =
    await FlutterNativeTimezone.getLocalTimezone();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate",
      "Accept-Language": "en-US,en;q=0.5",
      "Connection": "keep-alive",
      "Host": "www.mocky.io",
      "Upgrade-Insecure-Requests": "1",
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0',
    };

    try {
      final response = await http.get(url, headers: headers);
      print(response);
      final responseData = json.decode(response.body);
      print("responseData-------$responseData");
      final responseBodyData = responseData;
      print(responseBodyData);
      responseBodyData.forEach((item) {
        print("item-------$item");
        employeesDetailsReportList.add(EmployeeDetailsStateList(
          id = item["id"],
          name = item["name"],
          userName = item["username"],
          eMail = item["email"],
          profileImage = item["profile_image"],
          phone = item["phone"],
          website = item["website"],

        ));
      });
    } catch (error) {
      throw (error);
    }

    emit(EmployeeDetailsState(false, employeesDetailsReportList));
  }

  void clearData() {
    emit(EmployeeDetailsState(false, employeesDetailsReportList));
  }

  void searchEmployeeList(String employeeName) {
    print(employeeName);

  }
}
