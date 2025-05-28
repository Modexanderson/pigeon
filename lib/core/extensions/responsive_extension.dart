import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? mS, // 375
    T? mN, // 390
    T? mL, // 419
    T? tS, // 600
    T? tL, // 850
    T? dx, // 1024
    T? dxL, //1280
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (dxL ?? dx ?? tL ?? tS ?? mL ?? mN ?? mS ?? defaultVal)
        : wd >= 1024
            ? (dx ?? tL ?? tS ?? mL ?? mN ?? mS ?? defaultVal)
            : wd >= 850
                ? (tL ?? tS ?? mL ?? mN ?? mS ?? defaultVal)
                : wd >= 600
                    ? (tS ?? mL ?? mN ?? mS ?? defaultVal)
                    : wd >= 419
                        ? (mL ?? mN ?? mS ?? defaultVal)
                        : wd >= 390
                            ? (mN ?? mS ?? defaultVal)
                            : wd >= 375
                                ? (mS ?? defaultVal)
                                : defaultVal;
  }
}
