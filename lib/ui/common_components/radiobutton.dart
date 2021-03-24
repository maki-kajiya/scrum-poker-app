import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// FormFieldでラップし、onSavedを使えるようにする
class RadioListTileField extends FormField {
  final FormFieldSetter onSaved;
  final List<String> confidentList;
  final List<int> confidentValueList;
  final int currentConfident;
  final Color contentsBackgroundColor;
  final int index;
  final Function onChanged;
  final double errorTextFontSize;
  RadioListTileField({
    this.onSaved,
    this.confidentList,
    this.confidentValueList,
    this.currentConfident,
    this.contentsBackgroundColor,
    this.index,
    this.onChanged,
    this.errorTextFontSize = 11.0,
  }) : super(
            onSaved: onSaved,
            builder: (FormFieldState state) {
              return RadioListTile(
                value: confidentValueList[index],
                activeColor: contentsBackgroundColor,
                groupValue: currentConfident,
                title: Text(confidentList[index]),
                onChanged: onChanged,
              );
            });
}
