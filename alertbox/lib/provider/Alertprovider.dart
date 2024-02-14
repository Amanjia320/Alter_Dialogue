// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier {
  String selectedWorkType;
  String selectedExperienceLevel;
  String selectedLocation;

  DropdownProvider()
      : selectedWorkType = 'Option 1',
        selectedExperienceLevel = 'Option 1',
        selectedLocation = 'Option 1';

  // get selectedValue => null;

  void updateWorkType(String value) {
    selectedWorkType = value;
    notifyListeners();
    // ignore: avoid_print
    print('WorkType Updated: $selectedWorkType');
  }

  void updateExperienceLevel(String value) {
    selectedExperienceLevel = value;
    notifyListeners();
  }

  void updateLocation(String value) {
    selectedLocation = value;
    notifyListeners();
    // ignore: avoid_print
    print('WorkType Updated: $selectedExperienceLevel');
  }

  void updateSelectedValue(Object? value) {}
}
