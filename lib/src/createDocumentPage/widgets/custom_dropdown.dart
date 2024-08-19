import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField2<String>(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
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
        items: _buildMenuItems(),
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
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

  List<DropdownMenuItem<String>> _buildMenuItems() {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (int i = 0; i < items.length; i++) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: items[i],
          child: Text(items[i]),
        ),
      );
      if (i < items.length - 1) {
        menuItems.add(
          DropdownMenuItem<String>(
            enabled: false, // Disable the divider from being selectable
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
