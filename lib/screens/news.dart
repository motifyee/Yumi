import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/screens/news_orders.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';

class News extends StatelessWidget {
  News({super.key});

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/location.svg',
                width: ThemeSelector.statics.iconSizeSmall,
                height: ThemeSelector.statics.iconSizeSmall,
              ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Column(
                children: [
                  Text(
                    '356-565 main St.',
                    style: TextStyle(
                      fontSize: ThemeSelector.fonts.font_12,
                      color: ThemeSelector.colors.secondaryFaint,
                    ),
                  ),
                  Text(
                    'New York NY 23212',
                    style: TextStyle(
                      fontSize: ThemeSelector.fonts.font_12,
                      color: ThemeSelector.colors.secondaryFaint,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => ThemeSelector.colors.success),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/images/opened.svg'),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                Text(
                  S.of(context).opened,
                  style: TextStyle(color: ThemeSelector.colors.onSuccess),
                )
              ],
            ),
          ),
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
