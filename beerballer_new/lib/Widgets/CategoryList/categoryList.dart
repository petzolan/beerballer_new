import 'package:beerballer_new/utils/appVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  Function callback;
  List<String> stream;

  CategoryList(
    this.callback,
    this.stream,
  );

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoryList> {
  int _selectedIndex = 0;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  Widget build(BuildContext context) {
    return _listCategory();
  }

  double _calcPosition(List<String> list, int currIndex) {
    double width = 0.0;
    for (int i = 0; i < currIndex; i++) {
      width += (list[currIndex].length.toDouble() * 9) + 5;
    }
    width += list[currIndex].length.toDouble() * 9 * 0.2;
    return width;
  }

  Widget _listCategory() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(this.widget.stream);
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: this.widget.stream.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 5,
          );
        },
        clipBehavior: Clip.none,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () async {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
              index == 0
                  ? await _controller.animateTo(
                      0,
                      duration: Duration(
                        seconds: 1,
                      ),
                      curve: Curves.easeIn,
                    )
                  : await _controller.animateTo(
                      _calcPosition(this.widget.stream, index),
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      curve: Curves.easeIn,
                    );
              this.widget.callback(
                    this.widget.stream[index],
                  );
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: queryData.size.width * 0.01,
              ),
              primary: Colors.transparent,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width:
                  (this.widget.stream[index].characters.length.toDouble() + 1) *
                      10,
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? AppVariables.buttonColor
                    : AppVariables.brightAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  this.widget.stream[index],
                  style: TextStyle(
                    color:
                        _selectedIndex == index ? Colors.white : Colors.black,
                    fontWeight: _selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
