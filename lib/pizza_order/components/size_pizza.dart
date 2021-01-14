import 'package:flutter/material.dart';

enum SizePizzaValue{
  s,
  m,
  l,
}

class SizePizzaState {
  final SizePizzaValue value;
  final double factor;

  SizePizzaState(this.value) : factor = _getFactorBySize(value);
  static double _getFactorBySize(SizePizzaValue value){
    switch (value){
      case SizePizzaValue.s:
        return 0.75;
      case SizePizzaValue.m:
        return 0.85;
      case SizePizzaValue.l:
        return 1.0;
    }
    return 0.85;
  }
}
