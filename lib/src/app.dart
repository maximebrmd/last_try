import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:last_try/src/blocs/bloc_provider.dart';
import 'package:last_try/src/blocs/trickTips_bloc.dart';
import 'package:last_try/src/ui/tricktips_screen.dart';
import 'package:universal_html/html.dart';
import '../generated/l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Try',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      locale: kIsWeb
          ? Locale.fromSubtags(
              languageCode: Intl.canonicalizedLocale(window.navigator.language))
          : null,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // TODO: Navbar
      home: BlocProvider<TrickTipsBloc>(
        bloc: TrickTipsBloc(),
        child: TrickTipsScreen(),
      ),
    );
  }
}
