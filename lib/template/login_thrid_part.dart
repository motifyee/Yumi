import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';

class LoginThirdPart extends StatelessWidget {
  const LoginThirdPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                    color: Theme.of(context).colorScheme.secondaryContainer),
              )),
              Text(
                S.of(context).orSignUpWith,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                    color: Theme.of(context).colorScheme.secondaryContainer),
              )),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(20, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: SvgPicture.asset(
                    'assets/images/apple.svg',
                    width: 20,
                    height: 20,
                  )),
              const SizedBox(width: 10),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(20, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    width: 20,
                    height: 20,
                  )),
              const SizedBox(width: 10),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(20, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: SvgPicture.asset(
                    'assets/images/x.svg',
                    width: 20,
                    height: 20,
                  )),
              const SizedBox(width: 10),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(20, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    width: 20,
                    height: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
