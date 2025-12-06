import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

/// Stub implementation for non-web platforms
Future<
  void
>
viewPdfWeb(
  Uint8List pdfData,
) async {
  // This should never be called on non-web platforms
  throw UnsupportedError(
    'Web view not supported on this platform',
  );
}

/// Mobile/Desktop implementation using Printing.layoutPdf
Future<
  void
>
viewPdfMobile(
  Uint8List pdfData,
) async {
  await Printing.layoutPdf(
    onLayout:
        (
          PdfPageFormat format,
        ) async => pdfData,
  );
}
