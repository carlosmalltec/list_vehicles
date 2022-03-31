import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static String? formatPrice(String? price) {
    if (isNullOrEmpty(price) || price == 0.toString()) return null;
    var _price = price.toString().replaceAll(',', '.');
    double value = double.parse(_price.toString());
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ " + formatter.format(value);
    return newText;
  }

  static String? formatURLImage(String? imageUrl) {
    if (isNullOrEmpty(imageUrl) || imageUrl == '') return null;
    bool _containsHttp = imageUrl?.contains('http://') ?? false;
    if (_containsHttp) {
      var _newImage = imageUrl?.replaceAll('http://', 'https://');
      imageUrl = _newImage;
    } else {
      bool _containsHttp = imageUrl?.contains('https://') ?? false;
      if (!_containsHttp) imageUrl = null;
    }
    return imageUrl;
  }

  static bool isNullOrEmpty(String? value, {bool considerWhiteSpaceAsEmpty = false}) {
    RegExp _emptyRegex = RegExp(r'^\s*$');
    if (considerWhiteSpaceAsEmpty) return value == null || _emptyRegex.hasMatch(value);
    return value?.isEmpty ?? true;
  }
}
