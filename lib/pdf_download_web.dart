import 'dart:html' as html;
import 'dart:typed_data';
import 'package:printing/printing.dart';

/// Web implementation using dart:html for direct download
Future<
  void
>
downloadPdfWeb(
  Uint8List pdfData,
  String filename,
) async {
  try {
    // Use dart:html to trigger download
    final blob = html.Blob(
      [
        pdfData,
      ],
      'application/pdf',
    );
    final url = html.Url.createObjectUrlFromBlob(
      blob,
    );
    final anchor =
        html.AnchorElement(
            href: url,
          )
          ..setAttribute(
            'download',
            filename,
          )
          ..style.display = 'none';
    html.document.body?.append(
      anchor,
    );
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(
      url,
    );
  } catch (
    e
  ) {
    // Fallback to Printing.sharePdf if direct download fails
    await Printing.sharePdf(
      bytes: pdfData,
      filename: filename,
    );
  }
}

/// Stub for mobile on web platform
Future<
  void
>
downloadPdfMobile(
  Uint8List pdfData,
  String filename,
) async {
  // This should never be called on web
  throw UnsupportedError(
    'Mobile download not supported on web platform',
  );
}
