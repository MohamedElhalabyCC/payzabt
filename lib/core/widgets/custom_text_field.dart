// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui' as ui;

import 'package:payzabt/core/helpers/main_function.dart';

import '../../config/export/export.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? enabled;

  final double? tPadding, bPadding, lPadding, rPadding, borderRadius;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;

  final int? hintMaxLine;
  final TextStyle? floatingLabelStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? enabledColor, cursorColor, fillColor, focusColor,titleColor;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool? autoCorrect, isFill, showCounter;
  final ValueChanged<String>? onFieldSubmitted;
  final String? title;
  final String? otherSideTitle;
  final ui.TextDirection? textDirection;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final int? maxLength;
  final int? maxLines;
  final bool? readOnly;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;

  // الإضافات الجديدة
  final bool showCountry;
  final List<CountryItem>? countries;
  final CountryItem? selectedCountry;
  final void Function(CountryItem?)? onCountryChanged;
  final String initvalue;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.titleColor,
    this.obscureText = false,
    this.autofillHints = const [],
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputBorder,
    this.inputFormatters = const [],
    this.labelStyle,
    this.hintStyle,
    this.tPadding,
    this.bPadding,
    this.lPadding,
    this.rPadding,
    this.borderRadius,
    this.textAlign,
    this.focusNode,
    this.hintMaxLine,
    this.floatingLabelStyle,
    this.fillColor,
    this.autoCorrect,
    this.isFill,
    this.showCounter = true,
    this.enabledColor,
    this.cursorColor,
    this.focusColor,
    this.enabled,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.title,
    this.otherSideTitle,
    this.textDirection,
    this.showCountry = false,
    this.countries,
    this.selectedCountry,
    this.onCountryChanged,
    this.onEditingComplete,
    this.onTapOutside,
    this.initvalue = '',
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null || widget.otherSideTitle != null) ...[
            Row(
              children: [
                if (widget.title != null) ...[
                  Expanded(
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: widget.titleColor??AppColors.lightSecondary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 6),
          ],
          Directionality(
            textDirection: widget.textDirection != null
                ? widget.textDirection!
                : context.isRTL()
                ? ui.TextDirection.rtl
                : ui.TextDirection.ltr,
            child: Row(
              children: [
                if (widget.showCountry && widget.countries != null) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: DynamicColors.textColor(context),
                      border: Border.all(color: DynamicColors.border(context)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CountryItem>(
                        value: widget.selectedCountry,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: widget.onCountryChanged,
                        items: widget.countries!
                            .map(
                              (country) => DropdownMenuItem(
                                value: country,
                                child: Row(
                                  children: [
                                    Text(country.flag),
                                    const SizedBox(width: 6),
                                    Text(
                                      country.code,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
                Expanded(
                  child: TextFormField(
                    onEditingComplete: widget.onEditingComplete,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    textAlign: widget.textAlign ?? TextAlign.start,
                    focusNode: widget.focusNode,
                    validator:
                        widget.validator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return isEnglish()
                                ? "This field can't be empty"
                                : "لا يمكن ان يكون هذا الحقل فارغا";
                          }
                          return null;
                        },
                    readOnly: widget.readOnly ?? false,
                    onTap: widget.onTap,
                    onTapOutside: widget.onTapOutside,
                    // initialValue: widget.initvalue,
                    obscureText: widget.obscureText == true
                        ? _obscureText
                        : false,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    onChanged: widget.onChanged,
                    maxLength: widget.maxLength,
                    autofillHints: widget.autofillHints,
                    maxLines: widget.maxLines,
                    inputFormatters: widget.inputFormatters,
                    textInputAction: widget.textInputAction,
                    autovalidateMode:
                        widget.autovalidateMode ?? AutovalidateMode.onUnfocus,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 10.r,
                        ),
                        borderSide: BorderSide(color: AppColors.textError),
                      ),
                      labelText: widget.labelText,
                      labelStyle:
                          widget.labelStyle ??
                          TextStyles.styleSubtitleMedium14(context),
                      hintStyle:
                          widget.hintStyle ??
                          TextStyles.styleParagraphRegular14(
                            context,
                            color: Colors.black26.withValues(alpha: 0.5),
                          ),
                      hintMaxLines: widget.hintMaxLine ?? 500,
                      floatingLabelStyle:
                          widget.floatingLabelStyle ??
                          TextStyles.styleSubtitleMedium10(context),
                      hintText: widget.hintText,
                      prefixIcon: widget.prefixIcon,
                      filled: widget.isFill ?? true,
                      errorStyle: TextStyle(
                        color: AppColors.textError,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      errorMaxLines: 1,
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 50,
                        minHeight: 0,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 0,
                      ),
                      fillColor:
                          widget.fillColor ??
                          DynamicColors.textColorInverse(context),
                      focusColor:
                          widget.focusColor ??
                          DynamicColors.textColorInverse(context),
                      contentPadding: EdgeInsets.only(
                        left: widget.lPadding ?? 15.w,
                        right: widget.rPadding ?? 15.w,
                        top: widget.tPadding ?? 8.h,
                        bottom: widget.bPadding ?? 8.h,
                      ),
                      focusedBorder: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.focusColor ??
                                    AppColors.lightSecondary,
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 10.r,
                              ),
                              borderSide: BorderSide(
                                color:
                                    widget.focusColor ??
                                    AppColors.lightSecondary,
                              ),
                            ),
                      suffixIcon: widget.obscureText == true
                          ? IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black.withValues(alpha: 0.6),
                                size: 26.h,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )
                          : widget.suffixIcon,
                      enabledBorder: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ?? Colors.transparent,
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 10.r,
                              ),
                              borderSide: BorderSide(
                                color: widget.enabledColor ?? Color(0xffD8DADC),
                              ),
                            ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 40.r,
                        ),
                        borderSide: BorderSide(
                          color:
                              widget.enabledColor ?? AppColors.lightSecondary,
                        ),
                      ),
                      border: (widget.enabled == true)
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    widget.enabledColor ??
                                    AppColors.lightSecondary,
                              ),
                            )
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                widget.borderRadius ?? 10.r,
                              ),
                              borderSide: BorderSide(
                                color: widget.enabledColor ?? Color(0xffD8DADC),
                              ),
                            ),
                      counterText: widget.showCounter == true ? null : "",
                      counterStyle: const TextStyle(fontSize: 0, height: 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// كلاس يمثل الدولة
class CountryItem {
  final String code; // مثل +20
  final String flag; // مثل 🇪🇬

  CountryItem({required this.code, required this.flag});
}
