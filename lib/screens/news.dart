import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/local_storage.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/location.dart';
import 'package:yumi/template/news_guide.dart';
import 'package:yumi/template/news_orders.dart';
import 'package:yumi/template/status_button.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    LocalStorage.sharedRef.getValue(LocalStorage.newsGuide).then((res) => {
          if (res != true)
            {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return NewsGuide();
                    });
              })
            }
        });

    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Column(
        children: [
          Location(),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          StatusButton(status: StatusEnum.opened),
          SizedBox(
            height: ThemeSelector.statics.defaultTitleGap,
          ),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    key: key,
                    label: S.of(context).orderReceived,
                    isActive: state.selectedList == 0,
                    onPressed: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 0));
                      _controller.jumpToPage(0);
                    },
                  ),
                  SizedBox(width: ThemeSelector.statics.defaultBlockGap),
                  ActionButton(
                    key: key,
                    label: S.of(context).preparing,
                    isActive: state.selectedList == 1,
                    onPressed: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 1));
                      _controller.jumpToPage(1);
                    },
                  ),
                  SizedBox(width: ThemeSelector.statics.defaultBlockGap),
                  ActionButton(
                    key: key,
                    label: S.of(context).ready,
                    isActive: state.selectedList == 2,
                    onPressed: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 2));
                      _controller.jumpToPage(2);
                    },
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                NewsOrders(data: [0, 1, 2, 3, 4, 5]),
                NewsOrders(data: [0]),
                NewsOrders(data: [0, 1, 2]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
