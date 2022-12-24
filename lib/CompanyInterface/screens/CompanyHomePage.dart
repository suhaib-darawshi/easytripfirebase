
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../App_Router/App_Router.dart';
import '../../UserInterface/widgets/CustomTripWidget.dart';
import '../../provider/CompanyProvider.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyProvider>(builder: (context, provider, c) {
      return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: provider.companyTrips.length,
                itemBuilder: (context, index) {
                  return CustomTripWidget(provider.companyTrips[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRouter.router.push("AddTrip");
          },
          child: Icon(
            Icons.add,
            size: 35.w,
          ),
        ),
      );
    });
  }
}
