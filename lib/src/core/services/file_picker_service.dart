import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

abstract class FilePickerService {
  Future<String?> pickImportFile();
}

@LazySingleton(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  @override
  Future<String?> pickImportFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx', 'xls'],
    );
    return result?.files.single.path;
  }
}
