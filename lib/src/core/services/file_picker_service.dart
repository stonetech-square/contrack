import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

abstract class FilePickerService {
  Future<String?> pickCsvFile();
}

@LazySingleton(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  @override
  Future<String?> pickCsvFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    return result?.files.single.path;
  }
}
