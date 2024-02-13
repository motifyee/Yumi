import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/navigate_option.dart';
import 'package:yumi/statics/theme_statics.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatorBloc(),
      child: BlocBuilder<NavigatorBloc, NavigatesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: TextButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/images/side_bar.svg',
                  width: ThemeStatics.iconSizeSmall,
                  height: ThemeStatics.iconSizeSmall,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        'assets/images/notification.svg',
                        height: ThemeStatics.iconSizeSmall,
                        width: ThemeStatics.iconSizeSmall,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -5,
                        child: Container(
                          width: 15,
                          height: 15,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.fontSize),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              title: Center(
                child: Text(
                  S.of(context).yumi,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                ),
              ),
            ),
            bottomNavigationBar: NavigationBar(
              destinations: NavigateOptions.navigationDestination(),
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) {
                context
                    .read<NavigatorBloc>()
                    .add(NavigatorEvent(selectedIndex: index));
              },
            ),
            body: NavigateOptions.navigateList[state.selectedIndex].page,
          );
        },
      ),
    );
  }
}
