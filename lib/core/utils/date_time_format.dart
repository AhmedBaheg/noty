import 'package:intl/intl.dart';

class DateTimeFormat {

  String timeAgo(DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);

    if (diff.inSeconds < 60)  return 'Just now';
    if (diff.inMinutes < 60)  return '${diff.inMinutes}m ago';
    if (diff.inHours < 24)    return '${diff.inHours}h ago';
    if (diff.inDays == 1)     return 'Yesterday';
    if (diff.inDays < 7)      return '${diff.inDays}d ago';
    if (diff.inDays < 30)     return '${(diff.inDays / 7).floor()}w ago';
    if (diff.inDays < 365)    return '${(diff.inDays / 30).floor()}mo ago';
    return '${(diff.inDays / 365).floor()}y ago';
  }

  static String formatCreatedAt(DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);

    // إذا كانت الملاحظة كُتبت اليوم
    if (diff.inDays == 0) {
      return DateFormat('hh:mm a').format(createdAt); // 05:24 PM
    }
    // إذا كانت الملاحظة كُتبت بالأمس
    else if (diff.inDays == 1) {
      return 'Yesterday at ${DateFormat('hh:mm a').format(createdAt)}';
    }
    // إذا كانت الملاحظة خلال هذا الأسبوع
    else if (diff.inDays < 7) {
      return DateFormat('EEEE hh:mm a').format(createdAt); // Friday 05:24 PM
    }
    // 💡 هنا التعديل: أي ملاحظة أقدم من أسبوع تظهر بالتنسيق المطلوب تماماً كالصورة
    else {
      String datePart = DateFormat('dd MMM yyyy').format(createdAt); // 29 May 2025
      String timePart = DateFormat('hh:mm a').format(createdAt);     // 09:30 AM
      return '$datePart • $timePart';                                // دمجهم بالنقطة الوسطى
    }
  }

  static String formatCreatedAtDetailsNote(DateTime createdAt) {
    // تنسيق موحد وثابت يظهر دائماً بالتاريخ والوقت مع النقطة الوسطى
    String datePart = DateFormat('dd MMM yyyy').format(createdAt);
    String timePart = DateFormat('hh:mm a').format(createdAt);
    return '$datePart • $timePart';
  }


}