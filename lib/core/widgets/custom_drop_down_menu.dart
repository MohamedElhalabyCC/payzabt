import 'package:dropdown_button2/dropdown_button2.dart';
import '../../config/export/export.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.hintText,
    required this.dropdownMenuEntries,
    this.labelText,
    this.width = double.infinity,
    required this.onSubmit,
    required this.childBuilder,
    this.selectedItemBuilder,
    this.value,
    this.errorText,
    this.borderRadius,
    this.enabledColor,
    this.focusColor,
    this.hasShadow = false,
    this.prefixIcon,
    this.iconColor,
    this.icon,
    this.fillColor,
    this.title,
    this.titleStyle, this.height, this.hintStyle, this.titleColor,
  });

  final String hintText;
  final String? title; // ⭐ عنوان فوق الدروب داون
  final TextStyle? titleStyle,hintStyle; // ⭐ ستايل العنوان
  final double? borderRadius,height;
  final Color? enabledColor, focusColor, iconColor, fillColor,titleColor;
  final T? value;
  final String? labelText;
  final List<T> dropdownMenuEntries;
  final double width;
  final IconData? icon;
  final void Function(T?) onSubmit;
  final Widget Function(T?) childBuilder;
  final Widget? prefixIcon;
  final Widget Function(T?)? selectedItemBuilder;
  final String? errorText;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// ========== العنوان =============
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: AppText(
              text: title!,
              appTextStyle: titleStyle ?? TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: titleColor??AppColors.lightSecondary,
              ),
            ),
          ),

        /// ========== الدروب داون ==========
        DropdownButtonFormField2<T>(
          menuItemStyleData: MenuItemStyleData(
            padding: EdgeInsetsDirectional.only(start: 4.w),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: DynamicColors.background(context),
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 1,
            maxHeight: 200.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w)
          ),
          buttonStyleData: ButtonStyleData(padding: EdgeInsets.zero),
          alignment: AlignmentDirectional.centerStart,
          isDense: true,
          isExpanded: true,
          iconStyleData: IconStyleData(
            icon: Icon(icon ?? Icons.keyboard_arrow_down, color: iconColor??Colors.black,size: 22,),
          ),
          focusNode: FocusNode(),
          hint: AppText(
            text: hintText,
            appTextStyle: hintStyle??TextStyles.styleParagraphRegular14(
              context,
              color: Colors.black26.withValues(alpha: 0.5),
            ),
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: height??80),
            contentPadding: EdgeInsets.only(
              left: 0.w,
              right: 6.w,
              top: 2.h,
              bottom: 2.h,
            ),
            hintStyle: TextStyles.styleParagraphRegular14(
              context,
              color: Colors.black26.withValues(alpha: 0.5),
            ),
            hintMaxLines: 1,
            floatingLabelStyle: TextStyles.styleSubtitleMedium14(context),
            prefixIcon: prefixIcon,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(color: AppColors.textError),
            ),
            focusColor: DynamicColors.background(context),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: fillColor ?? DynamicColors.background(context),
            errorStyle: TextStyles.styleSubtitleMedium14(
              context,
              color: AppColors.textError,
            ),
            errorMaxLines: 1,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 0,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(
                color:
                    focusColor ?? Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(
                color:
                    enabledColor ?? Colors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(
                color:
                    enabledColor ?? Colors.transparent,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: const BorderSide(),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(color: AppColors.textError),
            ),
          ),
          onChanged: onSubmit,
          autovalidateMode: AutovalidateMode.always,
          items: dropdownMenuEntries
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: e == (value as String?)
                      ? selectedItemBuilder!(e)
                      : childBuilder(e),
                ),
              )
              .toList(),
          autofocus: true,
          selectedItemBuilder: selectedItemBuilder != null
              ? (context) => dropdownMenuEntries
                    .map((e) => selectedItemBuilder!(e))
                    .toList()
              : null,
        ),
      ],
    );
  }
}
