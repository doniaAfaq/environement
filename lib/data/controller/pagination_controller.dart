import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  IconData paginationNext = Icons.keyboard_arrow_left_rounded;
  IconData paginationPervious = Icons.keyboard_arrow_right_rounded;

  void changeButtonDirection(String localeDirection) {
    if (localeDirection == 'ar') {
      paginationNext = Icons.keyboard_arrow_left_rounded;
      paginationPervious = Icons.keyboard_arrow_right_rounded;
      update();
    } else if (localeDirection == 'en') {
      paginationNext = Icons.keyboard_arrow_right_rounded;
      paginationPervious = Icons.keyboard_arrow_left_rounded;
      update();
    }  
  }
}
