import 'package:flutter/material.dart';
import 'package:restoration_api_workshop/ui/utils/cities.dart';

class RestorableCities extends RestorableValue<Cities> {
  @override
  Cities createDefaultValue() => Cities.santiagoDeCompostela;

  @override
  void didUpdateValue(Cities? oldValue) {
    if (oldValue != null && oldValue.name != value.name) {
      notifyListeners();
    }
  }

  @override
  Cities fromPrimitives(Object? data) {
    if (data == null) {
      return createDefaultValue();
    }
    return Cities.values[data as int];
  }

  @override
  Object? toPrimitives() {
    return value.index;
  }
}
