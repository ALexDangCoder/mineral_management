extension PhoneNumberFormatting on String {
  /// Format số điện thoại Việt Nam: "0987654321" -> "0987 654 321"
  String get formatPhoneNumber {
    // Loại bỏ ký tự không phải số
    final digits = replaceAll(RegExp(r'\D'), '');

    if (digits.length <= 4) return digits;

    // Chia nhóm 4 - 3 - 3
    final part1 = digits.substring(0, 4);
    final part2 = digits.length > 4 ? digits.substring(4, digits.length.clamp(4, 7)) : '';
    final part3 = digits.length > 7 ? digits.substring(7) : '';

    return [part1, part2, part3].where((p) => p.isNotEmpty).join(' ');
  }
}
