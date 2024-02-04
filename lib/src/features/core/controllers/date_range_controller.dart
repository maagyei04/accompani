import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateRangeController extends GetxController {
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().add(const Duration(days: 7)).obs;

  Future<void> selectDateRange() async {
    await initializeDateFormatting('en'); 
       
    final DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      initialDateRange: DateTimeRange(start: startDate.value, end: endDate.value),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (picked != null && picked != DateTimeRange(start: startDate.value, end: endDate.value)) {
      startDate(picked.start);
      endDate(picked.end);

    }
  }
}

