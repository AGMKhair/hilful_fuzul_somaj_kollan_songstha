import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/constants/app_theme.dart';
import 'core/router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),     // iPhone X base (mobile-first)
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
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