import 'package:easy_localization/easy_localization.dart';
import 'package:easy_trip/provider/CompanyProvider.dart';
import 'package:easy_trip/provider/app_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'App_Router/App_Router.dart';
import 'CompanyInterface/screens/CompanyHomePage.dart';
import 'CompanyInterface/screens/CompanySignUp.dart';
import 'CompanyInterface/screens/addTripScreen.dart';
import 'UserInterface/screens/DetailPage.dart';
import 'UserInterface/screens/FilteredTripPage.dart';
import 'UserInterface/screens/History.dart';
import 'UserInterface/screens/HomeScreen.dart';
import 'UserInterface/screens/View.dart';
import 'UserInterface/screens/account_information.dart';

import 'UserInterface/screens/login_screen.dart';
import 'UserInterface/screens/sign_up_screen.dart';
import 'UserInterface/screens/updateinformation.dart';
import 'UserInterface/screens/welcomeScreen.dart';
import 'date_repo/database_handler.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SQL.sql.initDatabase();

  runApp(Material());
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/languages',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return AppProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (context) => CompanyProvider(),
          )
        ],
        child: Builded(),
      ),
    );
  }
}

class Builded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 891),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: Provider.of<AppProvider>(context).isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          navigatorKey: AppRouter.router.navigatorKey,
          routes: {
            'Home': (context) => HomeView(),
            'sign_up': (context) => SignUp(),
            'update_user_page': (context) => UpdateUserPage(),
            'HomeScreen': (context) => HomeScreen(),
            "LogIn": (context) => LoginScreen(),
            "FilteredTripScreen": (context) => FilteredTripScreen(),
            "AccountInformation": (context) => AccountInformation(),
            "DetailPage": (context) => DetailPage(),
            "History": (context) => HistoryScreen(),
            "CompanySignUp": (context) => CompanySignUp(),
            'companyHomePage': (context) => CompanyHomePage(),
            "AddTrip": (context) => AddTrip()
          },
          home: WelcomeScreen(),
        );
      },
    );
  }
}
