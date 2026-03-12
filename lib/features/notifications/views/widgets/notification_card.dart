import '../../../../config/export/export.dart'; // Adjust based on your file structure

class NotificationCard extends StatefulWidget {
  final String title;
  final String description;
  final String time;
  final String iconPath;
  final bool initialIsRead;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.iconPath,
    this.initialIsRead = false,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  late bool isRead;

  @override
  void initState() {
    super.initState();
    isRead = widget.initialIsRead;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRead = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(12.h), // Adjusted padding for better internal spacing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          // BORDER LOGIC: Change color based on isRead
          border: Border.all(
            width: 1.35,
            color: isRead ? const Color(0xFFE2E8F0) : const Color(0xFF95F6E4),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: -1,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Forces icons to the top
          children: [
            // LEADING SECTION
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffFFFBEB),
              ),
              child: AppImageView(
                widget.iconPath,
                height: 24.h,
                width: 24.w,
              ),
            ),
            SizedBox(width: 12.w),

            // MIDDLE CONTENT (Title, Description, Time)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: widget.title,
                    appTextStyle: TextStyles.styleParagraphRegular16(
                      context,
                      color: const Color(0xff101828),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: widget.description,
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: const Color(0xff4A5565),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppText(
                    text: widget.time,
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: const Color(0xff99A1AF),
                    ),
                  ),
                ],
              ),
            ),

            // TRAILING SECTION
            if (!isRead) // REMOVE TRAILING LOGIC: Only show if not read
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: const Icon(
                  Icons.circle,
                  color: Color(0xff00BBA7),
                  size: 10,
                ),
              ),
          ],
        ),
      ),
    );
  }
}