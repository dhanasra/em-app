import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_cubits/themes_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/theme_manager.dart';
import '../../../resources/values_manager.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, String>(
        builder: (_, theme){
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: ()=>BlocProvider.of<ThemesCubit>(context).changeTheme(THEME_GREY),
                child: CircleAvatar(
                  backgroundColor: ColorManger.grey,
                  radius: AppSize.s10,
                  child: theme==THEME_GREY
                      ? Icon(Icons.check, size: AppSize.s16, color: ColorManger.white)
                      : null,
                ),
              ),
              const SizedBox(width: AppSize.s10,),
              GestureDetector(
                onTap: ()=>BlocProvider.of<ThemesCubit>(context).changeTheme(THEME_COLORFUL),
                child: CircleAvatar(
                  backgroundColor: ColorManger.fBlue,
                  radius: AppSize.s10,
                  child: theme==THEME_COLORFUL
                      ? Icon(Icons.check, size: AppSize.s16, color: ColorManger.white)
                      : null,
                ),
              ),
              const SizedBox(width: AppSize.s10,),
              GestureDetector(
                onTap: ()=>BlocProvider.of<ThemesCubit>(context).changeTheme(THEME_DARK),
                child: CircleAvatar(
                  backgroundColor: ColorManger.darkGrey,
                  radius: AppSize.s10,
                  child: theme==THEME_DARK
                      ? Icon(Icons.check, size: AppSize.s16, color: ColorManger.white)
                      : null,
                ),
              ),
              const SizedBox(width: AppSize.s10,),
              GestureDetector(
                onTap: ()=>BlocProvider.of<ThemesCubit>(context).changeTheme(THEME_LIGHT),
                child: CircleAvatar(
                  backgroundColor: ColorManger.primary,
                  radius: AppSize.s10,
                  child: theme==THEME_LIGHT
                      ? Icon(Icons.check, size: AppSize.s16, color: ColorManger.white)
                      : null,
                ),
              )
            ],
          );
        }
    );
  }
}
