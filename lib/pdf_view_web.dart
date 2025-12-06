import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

/// Web implementation using data URL to open PDF in new window
Future<
  void
>
viewPdfWeb(
  Uint8List pdfData,
) async {
  try {
    // Convert PDF bytes to base64
    final base64Pdf = base64Encode(
      pdfData,
    );
    // Create data URL
    final dataUrl = 'data:application/pdf;base64,$base64Pdf';
    // Open PDF in new window/tab
    html.window.open(
      dataUrl,
      '_blank',
    );
  } catch (
    e
  ) {
    // Fallback to Printing.layoutPdf if direct view fails
    await Printing.layoutPdf(
      onLayout:
          (
            PdfPageFormat format,
          ) async => pdfData,
    );
  }
}

/// Stub for mobile on web platform
Future<
  void
>
viewPdfMobile(
  Uint8List pdfData,
) async {
  // This should never be called on web
  throw UnsupportedError(
    'Mobile view not supported on web platform',
  );
}
