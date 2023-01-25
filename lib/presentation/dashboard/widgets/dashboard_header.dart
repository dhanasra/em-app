import 'package:em/resources/values_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardHeader extends StatelessWidget {
  final User user;
  const DashboardHeader({
    super.key,
    required this.user  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: AppSize.s18,
          backgroundImage: NetworkImage(user.photoURL??'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=retro&f=y'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning !', style: Theme.of(context).textTheme.bodyText2),
                Text(user.displayName!, style: Theme.of(context).textTheme.headline6)
              ]
            ),
          ),
        ),
        const Icon(FontAwesomeIcons.bell)
      ],
    );
  }
}