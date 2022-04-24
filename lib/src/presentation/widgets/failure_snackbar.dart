import 'package:find_thing/src/core/failure.dart';
import 'package:flutter/material.dart';

SnackBar failureSnackBar({Key? key,required Failure failure}){
  return SnackBar(content: Text(failure.message));
}