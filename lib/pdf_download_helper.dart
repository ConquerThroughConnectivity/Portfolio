import 'dart:typed_data';
import 'package:flutter/foundation.dart'
    show
        kIsWeb;

// Conditional imports for web
import 'pdf_download_stub.dart' if (dart.library.html) 'pdf_download_web.dart' as platform;

/// Downloads PDF file in a cross-platform way
/// Works in both debug and release modes
Future<
  void
>
downloadPdf(
  Uint8List pdfData,
  String filename,
) async {
  if (kIsWeb) {
    await platform.downloadPdfWeb(
      pdfData,
      filename,
    );
  } else {
    await platform.downloadPdfMobile(
      pdfData,
      filename,
    );
  }
}
