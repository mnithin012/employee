part of 'employee_details_cubit.dart';

@immutable
class EmployeeDetailsState {
  bool isLoading;
  List<EmployeeDetailsStateList> employeeDetailsReports;
  List<EmployeeAddressDetails> employeeAddressDetailsReports;
  List<EmployeeCompanyDetails> employeeCompanyDetailsReports;
  EmployeeDetailsState(this.isLoading, this.employeeDetailsReports);
}

class EmployeeCompanyDetails {
  String companyName;
  String catchPhrase;
  String bs;
  EmployeeCompanyDetails(this.companyName, this.catchPhrase, this.bs);
}

class EmployeeAddressDetails {
  String street;
  String suite;
  String city;
  String zipcode;
  EmployeeAddressDetails(this.street, this.suite, this.city, this.zipcode);
}

class EmployeeDetailsStateList {
  int id;
  String name;
  String userName;
  String eMail;
  String profileImage;
  String phone;
  String website;
  String companyName;
  String catchPhrase;
  String bs;
  String street;
  String suite;
  String city;
  String zipcode;
  EmployeeDetailsStateList(
      this.id,
      this.name,
      this.userName,
      this.eMail,
      this.profileImage,
      this.phone,
      this.website,
      );
}