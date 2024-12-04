import 'package:get/route_manager.dart';

import '../../../components/auth/mystring.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    fra: fr,
  };
}
