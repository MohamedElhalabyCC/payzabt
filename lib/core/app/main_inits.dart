import 'package:payzabt/core/helpers/bloc_observer.dart';
import 'package:payzabt/config/export/export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:payzabt/firebase_options.dart';
Future<void> mainInits() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await EasyLocalization.ensureInitialized();
  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);

  // ChuckerFlutter.showOnRelease = true;
  await AppPreferences().init();
  Bloc.observer = MyBlocObserver();
}
