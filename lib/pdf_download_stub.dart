import 'dart:typed_data';
import 'package:printing/printing.dart';

/// Stub implementation for non-web platforms
Future<
  void
>
downloadPdfWeb(
  Uint8List pdfData,
  String filename,
) async {
  // This should never be called on non-web platforms
  throw UnsupportedError(
    'Web download not supported on this platform',
  );
}

/// Mobile/Desktop implementation using Printing.sharePdf
Future<
  void
>
downloadPdfMobile(
  Uint8List pdfData,
  String filename,
) async {
  await Printing.sharePdf(
    bytes: pdfData,
    filename: filename,
  );
}
