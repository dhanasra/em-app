import 'package:easy_localization/easy_localization.dart';
import 'package:em/app/app_cubits/themes_cubit.dart';
import 'package:em/presentation/settings/pages/app_settings/app_settings_viewmodel.dart';
import 'package:em/presentation/settings/widgets/currency_picker.dart';
import 'package:em/presentation/settings/widgets/date_slider.dart';
import 'package:em/resources/date_manager.dart';
import 'package:em/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../widgets/language_bottomsheet.dart';
import '../../widgets/theme_builder.dart';

class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {

  late AppSettingsViewModel _viewModel;

  @override
  void initState() {
    _viewModel = AppSettingsViewModel();
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: ColorManger.grey), splashRadius: AppSize.s18),
        title: const Text(AppStrings.settings).tr(),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz, color: ColorManger.grey), splashRadius: AppSize.s18)
        ],
      ),
      body: OptionsList(
        viewModel: _viewModel,
      ),
    );
  }
}


class OptionsList extends StatelessWidget {
  final AppSettingsViewModel viewModel;
  const OptionsList({
    Key? key,
    required this.viewModel  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.account,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
              radius: 18,
              child: const Icon(Icons.person, color: Colors.blueGrey, size: AppSize.s18,),
            ),
            title: Text(AppStrings.profile, style: Theme.of(context).textTheme.subtitle2).tr(),
            // onTap: ()=>Navigator.of(context).pushNamed(Routes.profile),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber.shade100,
              radius: 18,
              child: const Icon(FontAwesomeIcons.user, color: Colors.amber, size: AppSize.s18,),
            ),
            title: Text(AppStrings.premium, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: ColorManger.primary,
                  radius: AppSize.s10,
                  child: Icon(FontAwesomeIcons.gift, color: ColorManger.white, size: AppSize.s12,),
                ),
                const SizedBox(width: AppSize.s10,),
                Text("50% OFF", style: getRegularStyle(color: ColorManger.primary),).tr()
              ],
            ),
            // onTap: ()=>Navigator.of(context).pushNamed(Routes.premium),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.preferences,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade100,
              radius: 18,
              child: const Icon(FontAwesomeIcons.themeco, color: Colors.deepPurple, size: AppSize.s18,),
            ),
            title: Text(AppStrings.theme, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: const ThemeBuilder(),
          ),  
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 18,
              child: Icon(FontAwesomeIcons.moon, color: Colors.black, size: AppSize.s18,),
            ),
            title: Text(AppStrings.dynamicTheme, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: ValueListenableBuilder(
              valueListenable: viewModel.dynamicThemeNotifier, 
              builder: (_,__,___){
                return Text(viewModel.dynamicThemeNotifier.value ? AppStrings.on : AppStrings.off).tr();
              }),
            onTap: (){
              context.read<ThemesCubit>().switchDynamicTheme(!viewModel.dynamicThemeNotifier.value);
              viewModel.dynamicThemeNotifier.value = !viewModel.dynamicThemeNotifier.value;
            },
          ),  
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent.shade100,
              radius: 18,
              child: const Icon(FontAwesomeIcons.language, color: Colors.greenAccent, size: AppSize.s18,),
            ),
            title: Text(AppStrings.language, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: ValueListenableBuilder(
              valueListenable: viewModel.localeNotifier, 
              builder: (_,__,___){
                return Text(viewModel.localeNotifier.value).tr();
              }),
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  builder: (_)=> LanguageBottomSheet(
                    onChanged: (String lang)=>viewModel.localeNotifier.value = lang.getLocaleText(),
                  )
              );
            },
          ),  
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyanAccent.shade100,
              radius: 18,
              child: const Icon(FontAwesomeIcons.moneyCheck, color: Colors.cyanAccent, size: AppSize.s18,),
            ),
            title: Text(AppStrings.currency, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: ValueListenableBuilder(
              valueListenable: viewModel.currencyNotifier, 
              builder: (_,__,___){
                return Text(viewModel.currencyNotifier.value);
              }),
            onTap: (){

              showDialog(
                context: context, 
                builder: (_){
                  return Dialog(
                    child: CurrencyPicker(
                      onSelected: (v)=>viewModel.currencyNotifier.value = v,
                    ),
                  );
                });
            },
          ),  
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrange.shade100,
              radius: 18,
              child: const Icon(FontAwesomeIcons.calendar, color: Colors.deepOrange, size: AppSize.s18,),
            ),
            title: Text(AppStrings.dateFormat, style: Theme.of(context).textTheme.subtitle2).tr(),
            trailing: ValueListenableBuilder(
              valueListenable: viewModel.dateFormatNotifier, 
              builder: (_,__,___){
                return Text(getDate(format: viewModel.dateFormatNotifier.value));
              }),
            onTap: (){

              showDialog(
                context: context, 
                builder: (_){
                  return Dialog(
                    child: DateFormatPicker(
                      onPicked: (v)=>viewModel.dateFormatNotifier.value = v,
                      initial: viewModel.dateFormat,
                    )
                  );
              });
            },
          ),  
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.todo,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
              radius: 18,
              child: const Icon(Icons.mail, color: Colors.blueGrey, size: AppSize.s18,),
            ),
            title: Text('Contact Us', style: Theme.of(context).textTheme.subtitle2).tr(),
            // onTap: ()=>Navigator.of(context).pushNamed(Routes.profile),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
              radius: 18,
              child: const Icon(Icons.report, color: Colors.blueGrey, size: AppSize.s18,),
            ),
            title: Text('Report', style: Theme.of(context).textTheme.subtitle2).tr(),
            // onTap: ()=>Navigator.of(context).pushNamed(Routes.profile),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
              radius: 18,
              child: const Icon(Icons.people, color: Colors.blueGrey, size: AppSize.s18,),
            ),
            title: Text('Expenso Community', style: Theme.of(context).textTheme.subtitle2).tr(),
            // onTap: ()=>Navigator.of(context).pushNamed(Routes.profile),
          ),
        )
        
      ],
    );
  }
}

