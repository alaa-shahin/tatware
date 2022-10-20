import 'package:tatware/routes/app_routes.dart';
import 'package:tatware/theme/light_theme.dart';

import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => OKToast(
        position: ToastPosition.center,
        child: MaterialApp.router(
          title: 'Tatware Demo',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: lightTheme,
          themeMode: ThemeMode.light,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
