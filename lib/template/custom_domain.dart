import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';

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
          color: ThemeSelector.colors.secondaryTant,
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
          padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.defaultGap,
            vertical: ThemeSelector.statics.defaultBlockGap,
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
                      onSave: (value) => DioClient.setOriginApi(value),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.domainFormKey.currentState?.save();
                        context.router.maybePop();
                      },
                      child: Container(
                          padding:
                              EdgeInsets.all(ThemeSelector.statics.defaultGap),
                          decoration: BoxDecoration(
                              color: ThemeSelector.colors.primary,
                              borderRadius: BorderRadius.circular(
                                  ThemeSelector.statics.defaultBlockGap)),
                          child: Icon(
                            Icons.dns,
                            color: ThemeSelector.colors.onPrimary,
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
                      DioClient.setOriginApi(defaultOriginApi);
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
