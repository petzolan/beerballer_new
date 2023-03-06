import 'package:beerballer_new/Models/firestoreModels/shopItem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/appVariables.dart';

class ShopExplanationCard extends StatelessWidget {
  ShopItem shopItem;

  ShopExplanationCard(this.shopItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: expl(context),
    );
  }

  Widget expl(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: AppVariables.backgroundGrey,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: new CachedNetworkImageProvider(
                      this.shopItem.imagePath,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        child: IconButton(
                          icon: AppVariables.backArrow,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  shopItem.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  this.shopItem.description,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  this.shopItem.price + " €",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppVariables.buttonColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _launchURL(
                          shopItem.weblink,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Jetzt entdecken ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.language,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "10% Rabatt mit dem Code: BOT10",
                  style:
                      TextStyle(fontSize: 13, color: AppVariables.buttonColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Divider(color: AppVariables.backgroundGrey),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      color: AppVariables.backgroundGrey,
                    ),
                    Text(
                      " Kostenloser Versand",
                      style: TextStyle(color: AppVariables.backgroundGrey),
                    ),
                    // Abstand zwischen zwei Strings.
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.refresh,
                      color: AppVariables.backgroundGrey,
                    ),
                    Text(
                      " Kostenlose Retouren",
                      style: TextStyle(color: AppVariables.backgroundGrey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Divider(color: AppVariables.backgroundGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Text(
                    "Produktinformationen",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Text(
                    this.shopItem.details,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

_launchURL(String weblink) async {
  if (await canLaunch(weblink)) {
    await launch(weblink);
  } else {
    throw 'Could not launch $weblink';
  }
}
