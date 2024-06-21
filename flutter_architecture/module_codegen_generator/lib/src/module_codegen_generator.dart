import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:module_codegen/module_codegen.dart';

class ContentGeneratorExt extends GeneratorForAnnotation<AddName> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final output = StringBuffer();

    final String name = 'getName';
    final String value =
        annotation.objectValue.getField(name)?.toStringValue() ?? '';

    output.writeln(
      'extension ${element.name}Advanced on ${element.name} { String $name() {return \'$value\';}}',
    );

    return output.toString();
  }
}
