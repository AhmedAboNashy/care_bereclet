import 'package:care_brecelet/view/homeScreen/HomeScreen.dart';
import 'package:care_brecelet/view/homeScreen/patient_details.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = 'search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> searchList = [
    "Ahmed",
    "Mohamed",
    "Arwa",
    "Hassan",
    "esmail",
    "Sama",
    "Mahmoud",
    "Nada",
    "Nermine",
    "",
    "Papaya",
    "Raspberry",
    "Strawberry",
    "Tomato",
    "Watermelon",
  ];

  bool noSearch = false;
  TextEditingController? controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller!.addListener(_searchResult);
  }

  void _searchResult() {
    setState(() {
      noSearch = controller!.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context, PatientDetails.routeName);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
          decoration: BoxDecoration(
              color: Color(0xFF9177DC).withOpacity(.5),
              borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                _searchResult();
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Search .. ',
                  hintStyle: TextStyle(
                      fontSize: 24, color: Colors.grey.withOpacity(.9))),

            ),
          ),
        ),
      ),
      body: Center(
        child: noSearch
            ? Icon(
                Icons.add_alarm_sharp,
              )
            : Icon(
                Icons.search_off,
                size: 100,
                color: Colors.purple.shade400,
              ),
      ),
    );
  }

}

// List<Widget>(BuildContext context) {
//   // Build the clear button.
// }
//
// @override
// Widget buildLeading(BuildContext context) {
//   // Build the leading icon.
// }
//
// @override
// Widget buildResults(BuildContext context) {
//   // Build the search results.
// }
//
// @override
// Widget buildSuggestions(BuildContext context) {
//   // Build the search suggestions.
// }
// }

