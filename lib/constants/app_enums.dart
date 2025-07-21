import 'package:changisha/services/localization_service.dart';
import 'package:flutter/material.dart';

enum MaritalStatus {
  single(0, 'single'),
  married(1, 'married'),
  unknown(2, 'unknown');

  final int value;
  final String label;

  const MaritalStatus(this.value, this.label);

  static MaritalStatus fromValue(int value) {
    return MaritalStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MaritalStatus.single,
    );
  }

  static MaritalStatus fromLabel(String label, BuildContext context) {
    for (final status in MaritalStatus.values) {
      if (status.labelLocalized(context) == label) {
        return status;
      }
    }
    throw ArgumentError('No matching MaritalStatus for label: $label');
  }

  /// Returns the localized label for the current enum.
  String labelLocalized(BuildContext context) {
    switch (this) {
      case MaritalStatus.single:
        return Strings.instance.single; // Localized string for "single"
      case MaritalStatus.married:
        return Strings.instance.married; // Localized string for "married"
      case MaritalStatus.unknown:
        return Strings.instance.unknown; // Localized string for "unknown"
    }
  }

  /// Returns localized labels of all values in the enum.
  static List<String> localizedLabels(BuildContext context) {
    return MaritalStatus.values
        .map((status) => status.labelLocalized(context))
        .toList();
  }
}

enum GenderStatus {
  Unknown(0, 'Unknown'),
  male(1, 'Male'),
  female(2, 'Female');

  final int value;
  final String label;

  const GenderStatus(this.value, this.label);

  static GenderStatus fromValue(int value) {
    return GenderStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => GenderStatus.Unknown,
    );
  }

  static GenderStatus fromLabel(String label) {
    return GenderStatus.values.firstWhere(
      (e) => e.label == label,
      orElse: () => GenderStatus.Unknown,
    );
  }

  static GenderStatus fromLocalizedLabel(String label, BuildContext context) {
    for (final status in GenderStatus.values) {
      if (status.toLocalizedString(context) == label) {
        return status;
      }
    }
    throw ArgumentError('No matching GenderStatus for label: $label');
  }

  String toLocalizedString(BuildContext context) {
    switch (this) {
      case GenderStatus.Unknown:
        return Strings.instance.unknown;
      case GenderStatus.male:
        return Strings.instance.male;
      case GenderStatus.female:
        return Strings.instance.female;
    }
  }

  static List<String> localizedLabels(BuildContext context) {
    return GenderStatus.values
        .map((status) => status.toLocalizedString(context))
        .toList();
  }
}
