import '../../provider/app_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountInformation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Builder(
      builder: (context) {
        final user=Provider.of<AppProvider>(context).user;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: (() {
                    if (context.locale == const Locale('en')) {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  }),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.blue,
                  )),
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.all(20.h),
            child: Card(
              elevation: 8,
              child: Container(
                height: 550.h,
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width-40) / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First_Name".tr(),style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text("Last_Name".tr(),style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text("Email".tr(),style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text("Phone_Number".tr(),style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width-40)/ 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.first_name!,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text(user.last_name!,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text(user.email!,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                          SizedBox(height: 30.h,),
                          Text(user.phoneNumber!,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
