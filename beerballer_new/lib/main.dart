import 'package:beerballer_new/Models/currentUserModel.dart';
import 'package:beerballer_new/Models/sideMenuModel.dart';
import 'package:beerballer_new/Screens/Authenticate/wrapper.dart';
import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  // initalize app on firebase (connect database)
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

await Firebase.initializeApp(
    options: FirebaseOptions(
        appId: '1:583223795298:ios:8091dbe3344c11184cbb3b',
        apiKey: 'AIzaSyA32ej1Z6NDi7NdN3NoPydvPbxEEBRfKHw',
        projectId: 'beerballertrinkspielapp',
        messagingSenderId: '583223795298',
        iosBundleId: 'com.example.beerballerIos',
      )
  );  // run App
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SideMenuModel()),
        ChangeNotifierProvider(create: (context) => CurrentUserModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        decorationColor: Colors.white);
    return StreamProvider<User?>.value(
      initialData: null,
      value: AuthService.instance.user,
      // Theme of the App
      child: MaterialApp(
        title: 'BeerBaller',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: "Roboto Condensed",
          primaryColor: Colors.white,
          primarySwatch: MaterialColor(
            0xFF898989,
            AppVariables.darkAccentColor,
          ),
          textTheme: newTextTheme,
        ),
        darkTheme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        // Go to login/register or directly to the app (if logged in)
        home: GestureDetector(
          // to unfocus when u click anywhere but in a textfield (like searchbar)
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Wrapper(),
        ),
      ),
    );
  }
}
