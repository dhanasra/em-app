import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/string_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';

class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.check_box_outline_blank, color: ColorManger.grey), splashRadius: AppSize.s18),
        title: const Text(AppStrings.settings).tr(),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz, color: ColorManger.grey), splashRadius: AppSize.s18)
        ],
      ),
      body: const OptionsList(),
    );
  }
}


class OptionsList extends StatelessWidget {
  const OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.account,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),
        ListTile(
          title: Text(AppStrings.profile, style: Theme.of(context).textTheme.subtitle2).tr(),
          // onTap: ()=>Navigator.of(context).pushNamed(Routes.profile),
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.premium, style: Theme.of(context).textTheme.subtitle2).tr(),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: ColorManger.primary,
                radius: AppSize.s10,
                child: Icon(Icons.card_giftcard, color: ColorManger.white, size: AppSize.s12,),
              ),
              const SizedBox(width: AppSize.s10,),
              Text("50% OFF", style: getRegularStyle(color: ColorManger.primary),).tr()
            ],
          ),
          // onTap: ()=>Navigator.of(context).pushNamed(Routes.premium),
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.inviteFriends, style: Theme.of(context).textTheme.subtitle2).tr(),
        ),
        const Divider(height: 0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.preferences,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),
        ListTile(
          title: Text(AppStrings.theme, style: Theme.of(context).textTheme.subtitle2).tr(),
          // trailing: const ThemeBuilder(),
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.dynamicTheme, style: Theme.of(context).textTheme.subtitle2).tr(),
          trailing: Text(AppStrings.on,
              style: getMediumStyle(color: ColorManger.grey, fontSize: FontSize.s16)),
          onTap: (){},
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.language, style: Theme.of(context).textTheme.subtitle2).tr(),
          onTap: (){
            // showModalBottomSheet(
            //     context: context,
            //     builder: (_)=>const LanguageBottomSheet()
            // );
          },
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.currency, style: Theme.of(context).textTheme.subtitle2).tr()
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.dateFormat, style: Theme.of(context).textTheme.subtitle2).tr()
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.carryForward, style: Theme.of(context).textTheme.subtitle2).tr()
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.notificationSound, style: Theme.of(context).textTheme.subtitle2).tr()
        ),
        const Divider(height: 0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppPadding.p16,AppPadding.p16,AppPadding.p16,0),
          child: Text(AppStrings.todo,
              style: getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14)).tr(),
        ),
        ListTile(
          title: Text(AppStrings.prioritySupport, style: Theme.of(context).textTheme.subtitle2).tr(),
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.support, style: Theme.of(context).textTheme.subtitle2).tr(),
        ),
        const Divider(height: 0,),
        ListTile(
          title: Text(AppStrings.community, style: Theme.of(context).textTheme.subtitle2).tr(),
        ),
        const Divider(height: 0,),
      ],
    );
  }

}

