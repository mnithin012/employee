import 'package:employees_app/Data/Constants.dart';
import 'package:employees_app/Widgets/Emp_list_Widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit/employee_details_cubit.dart';

class EmployeeDetailsApp extends StatefulWidget {
  static const String routeNameEmployee = "EmployeeDetailsApp";
  String profileDp;
  String nameValue;
  String mailId;
  EmployeeDetailsApp({this.profileDp, this.nameValue, this.mailId});
  @override
  _EmployeeDetailsAppState createState() => _EmployeeDetailsAppState();
}

class _EmployeeDetailsAppState extends State<EmployeeDetailsApp> {
  String profile;
  String name;
  String mail;
  @override
  void initState() {
    profile = widget.profileDp;
    name = widget.nameValue;
    mail = widget.mailId;
    _loadData();
    super.initState();
  }

  _loadData() {
    context.read<EmployeeDetailsCubit>().fetchEmployeeDetails();
  }



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.secondary,
          title: Text("Employee Details Data"),
        ),
        body: BlocBuilder<EmployeeDetailsCubit, EmployeeDetailsState>(
          builder: (context, reportState) => reportState.isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenSize.height * 0.2),
                    Center(child: Constants.customLoader()),
                  ],
                )
              : reportState.employeeDetailsReports.isEmpty
                  ? Column(
                      children: <Widget>[
                        SizedBox(height: screenSize.height * 0.2),
                        Center(child: Constants.customLoader()),
                      ],
                    )
                  : Container(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, item) =>
                                AnimationConfiguration.staggeredList(
                                  position: item,
                                  duration: const Duration(milliseconds: 400),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: EmployeeListDetails(
                                        reportState
                                            .employeeDetailsReports[item].id,
                                        widget.nameValue,
                                        reportState.employeeDetailsReports[item]
                                            .userName,
                                        widget.mailId,
                                        widget.profileDp,
                                        reportState.employeeDetailsReports[item]
                                            .street,
                                        reportState
                                            .employeeDetailsReports[item].suite,
                                        reportState
                                            .employeeDetailsReports[item].city,
                                        reportState.employeeDetailsReports[item]
                                            .zipcode,
                                        reportState
                                            .employeeDetailsReports[item].phone,
                                        reportState.employeeDetailsReports[item]
                                            .website,
                                        reportState.employeeDetailsReports[item]
                                            .companyName,
                                        reportState.employeeDetailsReports[item]
                                            .catchPhrase,
                                        reportState
                                            .employeeDetailsReports[item].bs,
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
        ));
  }
}
