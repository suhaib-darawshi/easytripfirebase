import '../widgets/MostPopular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../widgets/travelBlog.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<AppProvider>(context).isDark
          ? Colors.black
          : Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Text(
              "Travel_Blog".tr(),
              style: TextStyle(fontSize: 36.h),
            ),
          ),
          Expanded(
            flex: 2,
            child: TravelBlog(),
          ),
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most_Popular".tr(),
                  style: TextStyle(fontSize: 20.h),
                ),
                Text(
                  "View_All".tr(),
                  style: TextStyle(fontSize: 16.h, color: Colors.deepOrange),
                )
              ],
            ),
          ),
          Expanded(flex: 1, child: MostPopular())
        ],
      ),
    );
  }
}
