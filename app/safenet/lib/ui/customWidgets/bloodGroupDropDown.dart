import 'package:flutter/material.dart';
import 'package:safenet/core/viewmodals/register_model.dart';

class BloodGroupDropDown extends StatefulWidget {
  @override
  _BloodGroupDropDownState createState() => _BloodGroupDropDownState();
}

class _BloodGroupDropDownState extends State<BloodGroupDropDown> {
  String dropdownValue = 'A+';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 158.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.lightBlueAccent, width: 1.0)),
        child: DropdownButton<String>(
          underline: SizedBox(),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30.0,
          value: dropdownValue,
          items: RegisterModel.dropDownItems
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
        ),
      ),
      // onTap: ,
    );
  }
}
