import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/app/pages/order/widgets/text_quntaty.dart';

class ProductInCard extends StatelessWidget {
  const ProductInCard({
    super.key,
    required this.isView,
    required this.maxWidth,
    required this.invoiceDetails,
  });

  final bool isView;
  final double maxWidth;
  final InvoiceDetails invoiceDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (invoiceDetails.note != null && invoiceDetails.note != '') {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(CommonDimens.defaultLineGap),
              decoration: BoxDecoration(
                  color: CommonColors.background,
                  borderRadius: BorderRadius.circular(CommonDimens.defaultGap)),
              child: Text(
                invoiceDetails.note ?? '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        }
      },
      child: SizedBox(
        width: isView ? maxWidth : 50,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _ProductImage(
              invoiceDetails: invoiceDetails,
            ),
            AnimatedSize(
              duration: CommonDimens.animationDuration,
              child: SizedBox(
                width: isView ? maxWidth - 50 : 0,
                child: Row(
                  children: [
                    const SizedBox(width: CommonDimens.defaultGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (invoiceDetails.product?.productName ?? '')
                                .replaceAll('[SoftDeleted]', ''),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            invoiceDetails.product?.ingredients
                                    ?.map((e) => '${e.portionGrams} ${e.name}')
                                    .join(', ') ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: CommonFontSize.font_9,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          Text(
                            invoiceDetails.note ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextCurrency(
                            value: invoiceDetails.productVarintPrice ?? 0.0,
                            fontSize: CommonFontSize.font_14),
                        TextQuantity(
                          value: invoiceDetails.quantity ?? 0.0,
                          fontSize: CommonFontSize.font_10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  _ProductImage({required this.invoiceDetails});
  InvoiceDetails invoiceDetails;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(CommonDimens.defaultBorderRadiusSmall),
          ),
          child: Image.memory(
            Uri.parse(invoiceDetails.image ?? '').data?.contentAsBytes() ??
                Uint8List(0),
            width: CommonDimens.iconSizeLarge,
            height: CommonDimens.iconSizeLarge,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/354.jpeg',
              width: CommonDimens.iconSizeLarge,
              height: CommonDimens.iconSizeLarge,
              fit: BoxFit.fill,
            ),
          ),
        ),
        if (invoiceDetails.note == null || invoiceDetails.note != '')
          Positioned(
            top: (CommonDimens.defaultGap / 2) * -1,
            left: (CommonDimens.defaultGap / 2) * -1,
            child: SvgPicture.asset('assets/images/label_yellow.svg'),
          ),
      ],
    );
  }
}
