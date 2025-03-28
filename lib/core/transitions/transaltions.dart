import 'package:get/get.dart';
import 'package:one_project_fierbase/core/transitions/ar.dart';
import 'package:one_project_fierbase/core/transitions/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': EnTransaltions.enUS,  
    'ar': AtTransaltions.arSy,   
  };
}