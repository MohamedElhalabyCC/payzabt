import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/savings/views/widgets/dialog.dart';
import 'package:payzabt/features/transactions/views/widgets/add_category_dialog.dart';

import '../../../../config/export/export.dart';

class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  static final categories = [
    {"icon": Assets.imagesSvgHamburger, "title": LocaleKeys.food.tr()},
    {"icon": Assets.imagesSvgTrace, "title": LocaleKeys.fuel.tr()},
    {"icon": Assets.imagesSvgHealthcare, "title": LocaleKeys.health.tr()},
    {"icon": Assets.imagesSvgBill, "title": LocaleKeys.bills.tr()},
    {"icon": Assets.imagesSvgCar, "title": LocaleKeys.transportation.tr()},
    {"icon": Assets.imagesSvgGroceryCart, "title": LocaleKeys.grocery.tr()},
    {"icon": Assets.imagesSvgRent, "title": LocaleKeys.rent.tr()},
    {"icon": Assets.imagesSvgCircus, "title": LocaleKeys.entertainment.tr()},
    {"icon": Assets.imagesSvgInvesment, "title": LocaleKeys.investment.tr()},
    {"icon": Assets.imagesSvgTravelAndTourism, "title": LocaleKeys.travel.tr()},
    {"icon": Assets.imagesSvgGiftBox, "title": LocaleKeys.gifts.tr()},
    {"icon": Assets.imagesSvgShoppingCart, "title": LocaleKeys.shopping.tr()},
    {"icon": Assets.imagesSvgWeightlifting, "title": LocaleKeys.gym.tr()},
    {"icon": Assets.imagesSvgPay, "title": LocaleKeys.salary.tr()},
    {"icon": Assets.imagesSvgApplePay, "title": LocaleKeys.applePay.tr()},
    {"icon": Assets.imagesSvgHomeFilled, "title": LocaleKeys.home.tr()},
    {"icon": Assets.imagesSvgMenu, "title": LocaleKeys.others.tr()},
    {"icon": Assets.imagesSvgList, "title": LocaleKeys.addNewCategory.tr()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
      decoration: BoxDecoration(
        color: Color(0xffF7FAFC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 134.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Color(0xFFC1C1C5),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          16.sizeBoxH,
          AppText(
            text: LocaleKeys.selectCategory.tr(),
            appTextStyle: TextStyles.styleParagraphRegular16(
              context,
              color: AppColors.lightSecondary,
            ).copyWith(fontWeight: FontWeight.w500),
          ),
          16.sizeBoxH,
          CustomTextField(
            focusColor: Colors.transparent,
            enabledColor: Colors.transparent,
            prefixIcon: AppImageView(Assets.imagesSvgSearchIcon, width: 24.w, height: 24.h),
            hintText: LocaleKeys.searchCategories.tr(),
            fillColor: Colors.white,
            height: 40.h,
            validator: (_){return;},
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 20,
                offset: Offset(7, 6),
                spreadRadius: 0,
              ),
            ],
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),
          16.sizeBoxH,
          Expanded(
            child: ListView.builder(
              itemCount:categories.length,
              shrinkWrap: true,
              itemBuilder:
              (context,index) => _buildCategoryTile(
                context,
                title: categories[index]["title"] ?? "n/a",
                onTap: () {
                  if(index+1 == categories.length){
                    showAnimatedAutoDismissDialog(context,AddCategoryDialogContent());
                  }
                },
                isLast: index+1 == categories.length,
                icon: categories[index]["icon"] ?? "n/a",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(
    BuildContext context, {
    required void Function()? onTap,
    required bool isLast,
    required String title,
    required String icon,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          visualDensity: VisualDensity(vertical: -4,horizontal: -2),
          minLeadingWidth: 5.w,
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffC1C1C5).withValues(alpha: 0.4),
            ),
            child: AppImageView(icon, width: 26.w, height: 26.h),
          ),
          title: AppText(
            text: title,
            appTextStyle: TextStyles.styleParagraphRegular16(
              context,
              color: AppColors.lightSecondary,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.add_circle_outline,
            size: 22,
            color: AppColors.lightSecondary,
          ),
        ),
        !isLast?
          Divider(
            color: Color(0xffC1C1C5).withValues(alpha: 0.4),
            thickness: 0.5,
          ):12.sizeBoxH,
      ],
    );
  }
}
