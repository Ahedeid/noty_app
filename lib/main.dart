import 'package:flutter/material.dart';
import 'package:noty_app/provider/auth_provider.dart';
import 'package:noty_app/provider/note_service.dart';
import 'package:noty_app/provider/noty_provider.dart';
import 'package:noty_app/provider/sheard_preferance/shared_pref.dart';
import 'package:noty_app/routes/app_router.dart';
import 'package:noty_app/routes/router_genaretor.dart';
import 'package:noty_app/routes/screen_name.dart';
import 'package:noty_app/utils/helper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();
  return runApp(const NotyApp());
}

class NotyApp extends StatefulWidget {
  const NotyApp({Key? key}) : super(key: key);

  @override
  State<NotyApp> createState() => _NotyAppState();
}


class _NotyAppState extends State<NotyApp> {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
      //  ChangeNotifierProvider(
      //    create: (context) => NoteService(),
      //  ),
        ChangeNotifierProvider(create: (_) => AuthProviderApi()),
         ChangeNotifierProvider(create: (_)=> NotyProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        title: 'Note App Tutorial',
        onGenerateRoute: RouteGenerator.onGenerateRoute,
         initialRoute: ScreenName.launchScreen,
        navigatorKey: AppRouter.navigatorKey,
         scaffoldMessengerKey: UtilsConfig.scaffoldKey,
      ),
    );
  }
}
