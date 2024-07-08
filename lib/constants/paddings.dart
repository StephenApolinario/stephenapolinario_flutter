import 'package:flutter/material.dart';

double desktopHorizontalPadding(BuildContext context) {
  const double maxScreenWidth = 1920;
  const double minScreenWidth = 1368;
  const double minPaddingFactor = 0.02;
  const double maxPaddingFactor = 0.15;
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth <= minScreenWidth) {
    return minPaddingFactor * screenWidth;
  } else if (screenWidth >= maxScreenWidth) {
    return screenWidth * maxPaddingFactor;
  } else {
    double normalizedWidth =
        (screenWidth - minScreenWidth) / (maxScreenWidth - minScreenWidth);
    return screenWidth * normalizedWidth * maxPaddingFactor;
  }
}

double mobileHorizontalPadding(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  const double baseValue = 10;
  const double scalingFactor = 0.0001;

  double calculatedPadding =
      baseValue + (screenWidth * screenWidth * scalingFactor);

  if (calculatedPadding < baseValue) {
    calculatedPadding = baseValue;
  } else if (calculatedPadding > 100) {
    calculatedPadding = 100;
  }
  return calculatedPadding;
}
