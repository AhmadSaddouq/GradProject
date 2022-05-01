import 'dart:ui';

import 'package:flutter/material.dart';

Color getRoleColor(String? role) {
  if (role == "Doctor") {
    return Colors.green;
  } else if (role == "Violin Course") {
    return Colors.red;
  } else if (role == "Piano Course") {
    return Colors.blueAccent;
  } else if (role == "Solution Architect") {
    return Colors.amberAccent;
  } else if (role == "Project Manager") {
    return Colors.cyanAccent;
  } else if (role == "Business Analyst") {
    return Colors.deepPurpleAccent;
  } else if (role == "UI/UX Designer") {
    return Colors.indigoAccent;
  }
  return Colors.black38;
}
