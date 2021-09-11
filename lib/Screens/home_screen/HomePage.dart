import 'package:dio/dio.dart';
import 'package:employees_app/Data/Constants.dart';
import 'package:employees_app/Screens/emp_screen/cubit/employee_details_cubit.dart';
import 'package:employees_app/Screens/search_part/cubit/search_filter_cubit.dart';
import 'package:employees_app/Widgets/Employee_Details_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  static const routeNameHomePage = "/HomePage";
  //get Date year Dynamically
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formattedDateYear = formatter.format(now).substring(0, 4);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controls the text label we use as a search bar
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  // for http requests
  String _searchText = "";
  List names = new List();
  // names we get from API
  List filteredNames = new List();
  // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');
  TextEditingController searchController = TextEditingController();
  void _getNames() async {
    final response =
        await dio.get('http://www.mocky.io/v2/5d565297300000680030a986');
    List tempList = new List();
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }

    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  @override
  void initState() {
    _loadData();
    searchController.addListener(searchEmployeeReports);
    super.initState();
  }

  void searchEmployeeReports() {
    if (searchController.text.length != 1) {
      context
          .read<EmployeeDetailsCubit>()
          .searchEmployeeList(searchController.text);
    }
  }

  _loadData() {
    context.read<EmployeeDetailsCubit>().fetchEmployeeDetails();
  }

  void selectSearch(BuildContext context, bool isSelected) {
    context.read<SearchFilterCubit>().selectSearch(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Constants.primary,
          title: BlocBuilder<SearchFilterCubit, SearchFilterState>(
            builder: (context, searchState) => searchState.isSearchPressed
                ? Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(color: Constants.AppbarText),
                      cursorColor: Constants.AppbarText,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Enter a search term',
                          hintStyle: TextStyle(color: Constants.AppbarText)),
                      controller: searchController,
                      keyboardType: TextInputType.text,
                    ),
                  )
                : Text(
                    "Employees Data",
                    style: TextStyle(color: Constants.AppbarText),
                  ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Constants.buttontxt,
                  size: 30.0,
                ),
                onPressed: () => {
                      _searchPressed(),
                      selectSearch(context, false),
                      searchController.text = "",
                    }),
            BlocBuilder<SearchFilterCubit, SearchFilterState>(
                builder: (context, searchState) {
              return searchState.isSearchPressed
                  ? IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.white,
                      onPressed: () {
                        _searchPressed();
                        selectSearch(context, false);
                        searchController.text = "";
                      })
                  : IconButton(
                      icon: Icon(Icons.person_search_rounded),
                      color: Colors.white,
                      onPressed: () {
                        _searchPressed();
                        selectSearch(context, true);
                      },
                    );
            }),
          ],
        ),
        body: Container(
          child: BlocBuilder<EmployeeDetailsCubit, EmployeeDetailsState>(
            builder: (context, reportState) => Column(children: <Widget>[
              reportState.isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: screenSize.height * 0.3),
                        Center(child: Constants.customLoader()),
                      ],
                    )
                  : reportState.employeeDetailsReports.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: screenSize.height * 0.3),
                            Center(
                              child: Center(child: Constants.customLoader()),
                            ),
                          ],
                        )
                      : AnimationLimiter(
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, item) =>
                                      AnimationConfiguration.staggeredList(
                                        position: item,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: EmployeesPageCard(
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .id,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .name,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .userName,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .eMail,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .profileImage,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .phone,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .website,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .companyName,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .catchPhrase,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .bs,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .street,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .suite,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .city,
                                              reportState
                                                  .employeeDetailsReports[item]
                                                  .zipcode,
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ),
            ]),
          ),
        ));
  }
}
