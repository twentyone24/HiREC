// ignore_for_file: file_names, constant_identifier_names

const int _BITCOUNT = 30;
const _BITMASK = (1 << _BITCOUNT ~/ 2) - 1;
const String _ALPHABET = "AG8FOLE2WVTCPY5ZH3NIUDBXSMQK7946";

class Crypt {
  static int _roundFunction(int number) =>
      (((number ^ 47894) + 25) << 1) & _BITMASK;

  static int _crypt(int number) {
    int left = number >> (_BITCOUNT ~/ 2);
    int right = number & _BITMASK;
    for (int round = 0; round < 10; ++round) {
      left = left ^ _roundFunction(right);
      int temp = left;
      left = right;
      right = temp;
    }
    return left | (right << (_BITCOUNT ~/ 2));
  }

  static String _couponCode(int n) {
    int number = _crypt(n);
    String b = "";
    for (int i = 0; i < 6; ++i) {
      b += (_ALPHABET[number & ((1 << 5) - 1)]);
      number = number >> 5;
    }
    return b;
  }

  static int _codeFromCoupon(String coupon) {
    int n = 0;
    for (int i = 0; i < 6; ++i) {
      n = n | ((_ALPHABET.indexOf(coupon[i])) << (5 * i));
    }

    return _crypt(n);
  }

  static String generateCoupon(int phoneNo) {
    int lastDigit = phoneNo % 10;
    int phoneNo9 = phoneNo ~/ 10;
    return _couponCode(phoneNo9) + lastDigit.toString();
  }

  static int decryptCoupon(String couponCode) {
    int lastDigit = int.parse(couponCode.substring(6));
    String sixDigitCode = couponCode.substring(0, 6);
    return (_codeFromCoupon(sixDigitCode) * 10) + lastDigit;
  }
}
