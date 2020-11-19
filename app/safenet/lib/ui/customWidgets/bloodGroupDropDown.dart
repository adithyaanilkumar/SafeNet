import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/register_model.dart';

class BloodGroupDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterModel>(builder: (context, model, child) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 158.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Color(0xff51adcf), width: 1.0)),
          child: DropdownButton<String>(
            underline: SizedBox(),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 30.0,
            value: model.dropdownValue,
            items: RegisterModel.dropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              model.updateDropDownValue(newValue);
            },
          ),
        ),
        // onTap: ,
      );
    });
  }
}
