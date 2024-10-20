import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  final TextStyle? style;

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    required this.style,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField2<String>(
        value: value,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: style,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        items: _buildMenuItems(context),
        onChanged: onChanged,
        style: style,
        isExpanded: true,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildMenuItems(BuildContext context) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (int i = 0; i < items.length; i++) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: items[i],
          child: Text(
            items[i],
            style: style!.copyWith(
              color: value == items[i] ? style!.color : Colors.black,
            ),
          ),
        ),
      );
      if (i < items.length - 1) {
        menuItems.add(
          DropdownMenuItem<String>(
            enabled: false,
            child: Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ),
        );
      }
    }
    return menuItems;
  }
}
