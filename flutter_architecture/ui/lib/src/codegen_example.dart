import 'package:module_codegen/module_codegen.dart';

part 'codegen_example.g.dart';

@AddName('myName')
class Test1 {
  final int var1;

  Test1(this.var1);
}

@AddName('theName')
class Test2 {
  final int var2;

  Test2(this.var2);
}
