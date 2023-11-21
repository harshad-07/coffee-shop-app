// import 'package:coffee_app_ui/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff52555a),
      keyboardAppearance: Brightness.dark,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.search,
            color: Color(0xff52555a),
          ),
        ),
        hintText: "Find Your Coffee...",
        hintStyle: const TextStyle(color: Color(0xff52555a), fontSize: 20),
        fillColor: const Color(0xff141921),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
