// import 'package:flutter/material.dart';

// class Textfield extends StatelessWidget {
//   Textfield(
//       {Key? key,
//       required this.text,
//       required this.boolian,
//       required this.textInputType,
//       required this.inputvalue})
//       : super(key: key);
//   final String text;
//   final bool boolian;
//   final TextInputType textInputType;
//   late String inputvalue;
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: textInputType,
//       obscureText: boolian,
//       textAlign: TextAlign.center,
//       onChanged: (value) {
//         value = inputvalue;
//       },
//       decoration: InputDecoration(
//         hintText: text,
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 20,
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.orange,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//           borderSide: BorderSide(
//             color: Colors.blue,
//             width: 2,
//           ),
//         ),
//       ),
//     );
//   }
// }
