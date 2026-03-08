import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/constants/app_theme.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {await Firebase.initializeApp();}catch(e){}

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: appRouter,
            title: 'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(context),
          );
        },
      ),
    ),
  );
}
