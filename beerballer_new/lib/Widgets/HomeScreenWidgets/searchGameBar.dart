import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchGameBar extends StatefulWidget {
  bool isTapped = false;
  Function onTap;
  
  SearchGameBar(this.onTap);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchGameBar> {
  Icon icon = Icon(Icons.arrow_back_sharp);
  final fieldText = TextEditingController();

  // tell the hometab that we are currently searching for a game
  _tellParent(String val) async {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentList =
        await searchByName(val);

    setState(() {
      this.widget.onTap(documentList, val != "");
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            // Searchbar
            child: TextField(
              onChanged: (value) {
                _tellParent(value);
              },
              controller: fieldText,
              style: TextStyle(color: AppVariables.darkAccent),
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Suche ein Spiel",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppVariables.darkAccent,
                ),
                border: InputBorder.none,
                labelStyle: new TextStyle(
                  color: AppVariables.darkAccent,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.all(5),
                  color: AppVariables.darkAccent,
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _tellParent("");
                    fieldText.clear();
                    setState(() {
                      FocusScope.of(context).unfocus();
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // serach the current value in the textfield in firestore
  searchByName(String val) {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentList = Stream.empty();
    if (val.isEmpty) {
      documentList = FirebaseFirestore.instance
          .collection("game_collection")
          .get()
          .asStream()
          .asBroadcastStream();
    } else {
      documentList = FirebaseFirestore.instance
          .collection("game_collection")
          .where("case_search", arrayContains: val.toLowerCase())
          .get()
          .asStream()
          .asBroadcastStream();
    }
    return documentList;
  }
}
