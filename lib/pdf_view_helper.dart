import 'dart:typed_data';
import 'package:flutter/foundation.dart'
    show
        kIsWeb;

// Conditional imports for web
import 'pdf_view_stub.dart' if (dart.library.html) 'pdf_view_web.dart' as platform;

/// Views PDF file in a cross-platform way
/// Works in both debug and release modes
Future<
  void
>
viewPdf(
  Uint8List pdfData,
) async {
  if (kIsWeb) {
    await platform.viewPdfWeb(
      pdfData,
    );
  } else {
    await platform.viewPdfMobile(
      pdfData,
    );
  }
}
