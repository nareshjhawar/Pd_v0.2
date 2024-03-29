import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './pages/user/start_screen.dart';
import 'package:provider/provider.dart';
import 'Utils/thems.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await TaskerPreference.init(); // for initial SharedPerfomance ..
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      builder: (context, _theme) {
        final themProvider = Provider.of<ThemProvider>(context);
        return MaterialApp(
          title: 'Prodo',
          debugShowCheckedModeBanner: false,
          themeMode: themProvider.themeMode,
          darkTheme: Mytheme.lightthem,
          theme: Mytheme.darkthem,
          // initialRoute: Routes.settings,
          // onGenerateRoute: RouterGenerator.generateRoutes,
          home: Start_screenWidget(),
        );
      });
}

