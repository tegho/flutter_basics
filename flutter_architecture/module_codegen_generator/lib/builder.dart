library module_codegen_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:module_codegen_generator/src/module_codegen_generator.dart';

Builder codegenBuilder(BuilderOptions options) => SharedPartBuilder(
      [ContentGeneratorExt()],
      'xxx',
    );
