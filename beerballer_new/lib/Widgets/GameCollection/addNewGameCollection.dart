import 'package:beerballer_new/Screens/Tabs/popupEmoji.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';

class AddNewGameCollection extends StatefulWidget {
  const AddNewGameCollection({Key? key}) : super(key: key);

  @override
  State<AddNewGameCollection> createState() => _AddNewGameCollectionState();
}

class _AddNewGameCollectionState extends State<AddNewGameCollection> {

    void _showAddDialouge(context) {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopupEmoji();
        },
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _showAddDialouge(context);
          },
        );
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppVariables.buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
