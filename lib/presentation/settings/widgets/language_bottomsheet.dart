import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/app_prefs.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/language_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';
class LanguageBottomSheet extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const LanguageBottomSheet({
    Key? key,
    required this.onChanged  
  }) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late String _gValue;
  late AppPreferences _preferences;

  @override
  void initState() {
    _preferences = AppPreferences();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    _gValue = context.locale.getLocaleString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Text(AppStrings.selectLanguage,
              style: getRegularStyle(color: ColorManger.grey1, fontSize: FontSize.s16)).tr(),
        ),

        const Divider(height: 0,),

        ...appLanguages.map((e)=>getRadioItem(e)).toList()

      ],
    );
  }

  Widget getRadioItem(String languageType){

    return RadioListTile(
      value: languageType,
      groupValue: _gValue,
      onChanged: (val)=>updateLocale(val.toString()),
      title: Text(languageType.getLocaleText(), style: Theme.of(context).textTheme.subtitle2),
    );
  }

  void updateLocale(String lang) async {
    _gValue = lang;
    setState(() {});
    context.setLocale(lang.getLocale());
    widget.onChanged(lang);
    await _preferences.saveLanguage(lang).then((value) => Navigator.pop(context));
  }
}
