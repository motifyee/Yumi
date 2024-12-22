import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';
import 'package:yumi/generated/l10n.dart';

class BasketMealCard extends StatelessWidget {
  BasketMealCard({
    super.key,
    required this.invoiceDetails,
    required this.indexInList,
  });

  final InvoiceDetail invoiceDetails;
  final int indexInList;

  final _debouncer = Debouncer(milliseconds: 3000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: CommonDimens.defaultGap),
      child: Container(
        decoration: BoxDecoration(
          color: CommonColors.background,
          boxShadow: [
            BoxShadow(
              color: CommonColors.shadow.withOpacity(.05),
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimens.defaultTitleGap,
            vertical: CommonDimens.defaultLineGap,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invoiceDetails.meal?.name ?? '',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: CommonFontSize.font_18,
                                  ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: CommonDimens.defaultGapExtreme,
                              child: TextCurrency(
                                value: invoiceDetails.productVarintPrice ?? 0,
                                fontSize: CommonFontSize.font_14,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(30, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                if (invoiceDetails.quantity == '1') {
                                  context.read<BasketCubit>().removeMeal(
                                        invoiceDetails: invoiceDetails,
                                      );
                                } else {
                                  context.read<BasketCubit>().updateMeal(
                                        invoiceDetails: invoiceDetails,
                                        indexInList: indexInList,
                                        newQuantity:
                                            '${int.parse(invoiceDetails.quantity) - 1}',
                                        note: invoiceDetails.note,
                                      );
                                }
                              },
                              child: Text(
                                '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: CommonDimens.defaultTitleGapLarge,
                              child: TextFormFieldTemplate(
                                isDense: true,
                                borderStyle:
                                    TextFormFieldBorderStyle.borderNone,
                                initialValue: invoiceDetails.quantity,
                                textInputType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^[1-9][0-9]*'),
                                  ),
                                ],
                                onChange: (value) {
                                  context.read<BasketCubit>().updateMeal(
                                        invoiceDetails: invoiceDetails,
                                        indexInList: indexInList,
                                        newQuantity: value,
                                        note: invoiceDetails.note,
                                      );
                                },
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(30, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                context.read<BasketCubit>().updateMeal(
                                      invoiceDetails: invoiceDetails,
                                      indexInList: indexInList,
                                      newQuantity:
                                          '${int.parse(invoiceDetails.quantity) + 1}',
                                      note: invoiceDetails.note,
                                    );
                              },
                              child: Text(
                                '+',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: CommonDimens.defaultGapXXL,
                    height: CommonDimens.defaultGapXXL,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        CommonDimens.defaultBorderRadius,
                      ),
                    ),
                    child: Image.memory(
                      Uri.parse(invoiceDetails.meal?.photo ?? '')
                              .data
                              ?.contentAsBytes() ??
                          Uint8List(0),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/354.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                S.of(context).specialRequest,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: CommonDimens.defaultLineGap),
              TextFormFieldTemplate(
                isDense: true,
                borderStyle: TextFormFieldBorderStyle.borderNone,
                hintText: S.of(context).anythingElseWeNeedToKnow,
                label: S.of(context).addANote,
                initialValue: invoiceDetails.note,
                onChange: (value) {
                  _debouncer.run(() {
                    context.read<BasketCubit>().updateMeal(
                          invoiceDetails: invoiceDetails,
                          indexInList: indexInList,
                          newQuantity: invoiceDetails.quantity,
                          note: value,
                        );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
