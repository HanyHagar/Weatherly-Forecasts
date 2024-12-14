import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weatherly_forecasts/const/const_text.dart';
import 'features/home/data/model/astro_model.dart';
import 'features/home/data/model/condition_model.dart';
import 'features/home/data/model/current_model.dart';
import 'features/home/data/model/day_model.dart';
import 'features/home/data/model/forecast_model.dart';
import 'features/home/data/model/forecastday_model.dart';
import 'features/home/data/model/location_model.dart';
import 'features/home/data/model/weather_model.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'my_bloc_opserver.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(ForecastdayAdapter());
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(DayAdapter());
  Hive.registerAdapter(ConditionAdapter());
  Hive.registerAdapter(AstroAdapter());
  Hive.registerAdapter(LocationAdapter());
  // Open Hive boxes (example box)
  await Hive.openBox<WeatherModel>(kHiveBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weatherly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const SplashView();
        },
      ),
    );
  }
}

/*{
  "Splash_description":"ابقَ على اطلاع دائم بأحوال الطقس مع توقعاتنا وتحديثاتنا الفورية. يوفر لك weathrly بيانات دقيقة وتنبيهات شخصية. استكشف الظروف الحالية والتوقعات على مدار الساعة والأسبوع.",
  "Today": "اليوم",
  "Day_Forecasts": "٧ أيام المقبلة",
  "Other_Location": "أماكن أخري"
}*/
/*
* {
  "splash_description":"stay up to date with weather conditions through our forecasts and real-time updates. weathrly provides accurate data and personalized alerts. explore current conditions and hourly and weekly forecasts.",
  "Today": "Today",
  "Days_Forecasts": "7-Day Forecasts",
  "Other_Location": "Other Location"

}*/
