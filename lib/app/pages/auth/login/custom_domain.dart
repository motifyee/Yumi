import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:common_code/common_code.dart';

class CustomDomain extends StatelessWidget {
  CustomDomain({super.key});

  final GlobalKey<FormState> domainFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => _DomainForm(
              domainFormKey: domainFormKey,
            ),
          );
        },
        child: Icon(
          Icons.dns_outlined,
          color: CommonColors.secondaryTant,
        ));
  }
}

class _DomainForm extends StatefulWidget {
  const _DomainForm({required this.domainFormKey});

  final GlobalKey<FormState> domainFormKey;

  @override
  State<_DomainForm> createState() => _DomainFormState();
}

class _DomainFormState extends State<_DomainForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: widget.domainFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimens.defaultGap,
            vertical: CommonDimens.defaultBlockGap,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormFieldTemplate(
                      borderStyle: TextFormFieldBorderStyle.borderedCircle,
                      label: S.of(context).domain,
                      initialValue: originApi,
                      onSave: (value) => BaseUrl.set(value),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.domainFormKey.currentState?.save();
                        context.router.maybePop();
                      },
                      child: Container(
                          padding:
                              const EdgeInsets.all(CommonDimens.defaultGap),
                          decoration: BoxDecoration(
                              color: CommonColors.primary,
                              borderRadius: BorderRadius.circular(
                                  CommonDimens.defaultBlockGap)),
                          child: Icon(
                            Icons.dns,
                            color: CommonColors.onPrimary,
                          ))),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${S.of(context).currentDomain}: ',
                  ),
                  Expanded(
                    child: Text(
                      originApi,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      BaseUrl.set(defaultOriginApi);
                    }),
                    child: Text(S.of(context).reset),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
