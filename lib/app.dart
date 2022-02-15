import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class QrReader extends StatelessWidget {
  const QrReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QrReader",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
