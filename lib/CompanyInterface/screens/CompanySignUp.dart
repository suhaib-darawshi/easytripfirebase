
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../App_Router/App_Router.dart';
import '../../provider/CompanyProvider.dart';
import '../../provider/app_provider.dart';

class CompanySignUp extends StatelessWidget {
  const CompanySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                Provider.of<CompanyProvider>(context, listen: false)
                    .setLocaleFromButton();
                context.setLocale(
                    Provider.of<CompanyProvider>(context, listen: false)
                        .getLocale());
              }),
              icon: const Icon(
                Icons.language,
                color: Colors.blue,
              ))
        ],
        leading: IconButton(
            onPressed: () => AppRouter.router.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        backgroundColor: Provider.of<CompanyProvider>(context).isDark
            ? Colors.black
            : Colors.white,
        elevation: 0,
      ),
      body: Consumer<CompanyProvider>(builder: (context, provider, x) {
        return Form(
          key: provider.signUpKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300.w,
                  alignment: Alignment.center,
                  child: Image.asset(
                    provider.isDark
                        ? 'assets/imgs/demologodark.PNG'
                        : 'assets/imgs/demologo.PNG',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        provider.requiredValidation(value ?? ''),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.abc,
                        color: provider.isDark ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Company_Name".tr(),
                    ),
                    controller: provider.CompanyNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) => provider.emailValidation(value ?? ''),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.abc,
                        color: provider.isDark ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Company Email".tr(),
                    ),
                    controller: provider.CompanyEmailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        provider.requiredValidation(value ?? ''),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: provider.isDark ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Address".tr(),
                    ),
                    controller: provider.CompanyAddressController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) =>
                        provider.passwordValidation(value ?? ''),
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_open,
                        color: provider.isDark ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Password".tr(),
                    ),
                    controller: provider.CompanyPasswordController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) => provider.phoneValidation(value ?? ''),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: provider.isDark ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: "Phone_Number".tr(),
                    ),
                    controller: provider.CompanyPhoneController,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await provider.signUp();
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            provider.isDark ? Colors.black : Colors.white,
                        elevation: 0),
                    child: Text(
                      "Sign_Up".tr(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 23,
                          backgroundColor:
                              provider.isDark ? Colors.black : Colors.white),
                    ))
              ],
            ),
          ),
        );
      }),
      backgroundColor: Provider.of<AppProvider>(context).isDark
          ? Colors.black
          : Colors.white,
    );
  }
}
