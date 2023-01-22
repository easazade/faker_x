// ignore_for_file: unused_import

import 'dart:mirrors';

import 'package:fake_it/fake_it.dart';
import 'package:equatable/equatable.dart';

void main(List<String> args) {
  currentMirrorSystem().libraries.values.forEach((element) {
    // print(element.uri);
    if (element.uri ==
        Uri.parse(
            'package:fake_it/src/locales/en_us/datasources/person.dart')) {
      print('found it');
      print(element.declarations.length);
      element.declarations.forEach((key, value) {
        print(value.simpleName);
      });
    }
  });

  // final libMirror = currentMirrorSystem().findLibrary(Symbol('fake_it'));

  // print(libMirror.declarations.length);

  // for (var element in libMirror.declarations.entries) {
  //   final DeclarationMirror var1 = element.value;
  //   print(var1.simpleName);
  //   print(libMirror.getField(var1.simpleName).reflectee);
  //   // final varMirror = var1 as VariableMirror;
  //   // print(var1);
  // }
}