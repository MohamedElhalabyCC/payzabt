import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/home/views/widgets/spendings_tip_container.dart';
import 'package:payzabt/features/home/views/widgets/transaction_card.dart';

import '../../../../config/export/export.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.sizeBoxH,
        SpendingTipContainer(),
        20.sizeBoxH,
        _buildSectionTitle(
          context,
          LocaleKeys.recentTransactions.tr(),
          () => context.pushNamed(AppRoute.transactionsView),
        ),
        12.sizeBoxH,
        ListView.builder(
          itemCount: 2,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => TransactionCard(
            title: "Internet",
            date: "12 jan 2022",
            method: "In Cash",
            cost: "500",
          ).paddingOnly(bottom: 16.h),
        ),
        90.sizeBoxH,
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    void Function() onTap,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          appTextStyle: TextStyles.styleParagraphRegular16(
            context,
            color: const Color(0xff0E4D6C),
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onTap,
          child: AppText(
            text: LocaleKeys.viewAll.tr(),
            appTextStyle: TextStyles.styleParagraphRegular12(
              context,
              color: const Color(0xff0E4D6C),
            ),
          ),
        ),
      ],
    );
  }
}
