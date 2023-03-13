import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/router.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: darkConfig,
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: darkConfig.value ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true, // Material3 Migration
          // textTheme: GoogleFonts.itimTextTheme(),
          textTheme: Typography.blackMountainView,
          brightness: Brightness.light,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFe9435A),
          ), // cupertino Search cursor 색은 여기서
          splashColor: Colors.transparent, // ListTile 탭 효과 끄기
          // highlightColor: Colors.transparent, // ListTile 꾹 누르는 효과 끄기
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            centerTitle: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.black,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true, // Material3 Migration
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFe9435A),
          ),
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.grey.shade900,
            color: Colors.grey.shade900,
          ),
          // textTheme: GoogleFonts.itimTextTheme(
          //   ThemeData(brightness: Brightness.dark).textTheme,
          // ),
          textTheme: Typography.whiteMountainView,
          scaffoldBackgroundColor: Colors.black,
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade800,
          ),
          primaryColor: const Color(0xFFE9435A),
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
