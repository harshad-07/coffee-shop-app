import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget formTextField({
  required String hintText,
  required String labelText,
  required FormFieldValidator validator,
  required TextEditingController controller,
  required bool obsecureText,
  Function(String)? onChanged,
  Widget? suffix,
  TextInputType? type,
}) {
  return TextFormField(
    keyboardType: type,
    onChanged: onChanged,
    obscureText: obsecureText,
    controller: controller,
    validator: validator,
    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    cursorColor: const Color(0xFFD17842),
    style: const TextStyle(fontSize: 18),
    cursorHeight: 24,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
      suffixIcon: suffix,
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabled: true,
      filled: true,
      fillColor: const Color(0xFF602400).withOpacity(0.2),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Color(0xFFD17842)),
      contentPadding: const EdgeInsets.all(22),
      // hintStyle: TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
