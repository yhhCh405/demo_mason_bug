import 'dart:io';

import 'package:mason/mason.dart';

List<File> _flist = [];

void run(HookContext context) {
  context.logger.info("Pre gen running...");
  innerListLoop("../../../lib/");
  print(_flist);
}

void innerListLoop(String path) {
  final entList = Directory(path).listSync();
  for (var fileEntity in entList) {
    if (fileEntity.statSync().type == FileSystemEntityType.file &&
        fileEntity.path.endsWith(".dart")) {
      _flist.add(File(fileEntity.path));
    } else if (fileEntity.statSync().type == FileSystemEntityType.directory) {
      innerListLoop(fileEntity.path);
    }
  }
}
