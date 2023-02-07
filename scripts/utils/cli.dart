import 'dart:io';

printRed(text) {
  print('\x1B[31m${text.toString()}\x1B[0m');
}

printGreen(text) {
  print('\x1B[32m${text.toString()}\x1B[0m');
}

printYellow(text) {
  print('\x1B[33m${text.toString()}\x1B[0m');
}

printBlue(text) {
  print('\x1B[34m${text.toString()}\x1B[0m');
}

printMagenta(text) {
  print('\x1B[35m${text.toString()}\x1B[0m');
}

printCyan(text) {
  print('\x1B[36m${text.toString()}\x1B[0m');
}

printWhite(text) {
  print('\x1B[37m${text.toString()}\x1B[0m');
}

exitWithMsg({String? error, String? warning}) {
  if (error != null) printRed('❌ $error');
  if (warning != null) printYellow('📜! $warning');

  print('\nSTACK TRACE WAS:');
  printBlue(StackTrace.current);
  exit(-1);
}
