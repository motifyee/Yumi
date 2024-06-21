import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/local_storage.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/order/widgets/chef_order.dart';
import 'package:yumi/template/location.dart';
import 'package:yumi/template/news_guide.dart';
import 'package:yumi/template/status_button.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final PageController _controller = PageController(initialPage: 1);
  final MenuTarget _menuTarget = MenuTarget.order;

  @override
  Widget build(BuildContext context) {
    bool isShown = false;
    LocalStorage.sharedRef.getValue(LocalStorage.newsGuide).then((res) {
      if (res != true) {
        if (!isShown) {
          isShown = true;
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const NewsGuide();
                });
          });
        }
      }
    });

    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Column(
        children: [
          const Location(),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          StatusButton(),
          SizedBox(
            height: ThemeSelector.statics.defaultTitleGap,
          ),
          Expanded(
              child:
                  ChefOrder(controller: _controller, menuTarget: _menuTarget)),
        ],
      ),
    );
  }
}
