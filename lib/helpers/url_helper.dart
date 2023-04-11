import 'package:intl/intl.dart';

class InfininHelpers {
  static List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static String  getMonthName(int month) {
    List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }

  static String getRestApiURL(String url) {
    final parts = url.toString().split('//');
    return [parts.first, ''].join('//') + parts.last;
  }

  static String getLegacyApiURLWithVersion(String url) {
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return url + '/api/v1';
  }

  static String dayOfMonth(DateTime _date) {
    var dateData = DateFormat('EEEE').format(_date);
    return dateData.substring(0, 3);
  }

  static String getAmPm(String displayTime) {
    var _formatedTime =
        DateFormat.jm().format(DateFormat("hh:mm:ss").parse(displayTime));
    var data = _formatedTime.split(':');
    var finalDate = '';
    finalDate = data[0];
    finalDate = finalDate + data[1].replaceAll('00', '');
    return finalDate;
  }
}
