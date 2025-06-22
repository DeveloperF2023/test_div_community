import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:test_div_community/core/constants/app_assets.dart';
import 'package:test_div_community/features/domain/entities/attendance/attendance_by_date_entity.dart';

Future<void> generateAttendancePdf(List<AttendanceByDateEntity> records) async {
  final pdf = pw.Document();
  final dateFormat = DateFormat('yyyy-MM-dd');

  // Load logo image bytes from assets
  final logoBytes = await rootBundle.load(AppAssets.logoDark);
  final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      header: (context) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Image(logoImage, width: 50, height: 50),
          pw.Text(
            "Attendance Report",
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(width: 50), // empty space to balance row
        ],
      ),
      footer: (context) => pw.Container(
        alignment: pw.Alignment.centerRight,
        margin: const pw.EdgeInsets.only(top: 10),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 30, height: 30),
            pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: pw.TextStyle(fontSize: 12, color: PdfColors.grey),
            ),
          ],
        ),
      ),
      build: (context) => [
        pw.SizedBox(height: 10),
        pw.Text(
          "Generated on ${dateFormat.format(DateTime.now())}",
          style: pw.TextStyle(fontSize: 12),
        ),
        pw.SizedBox(height: 20),
        pw.Table(
          border: pw.TableBorder.all(),
          children: [
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey300),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(6),
                  child: pw.Text(
                    'Student Name',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(6),
                  child: pw.Text(
                    'Status',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(6),
                  child: pw.Text(
                    'Date',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
              ],
            ),
            ...records.map((e) {
              PdfColor? rowColor;
              switch (e.status?.toLowerCase()) {
                case 'present':
                  rowColor = PdfColors.lightGreen100;
                  break;
                case 'absent':
                  rowColor = PdfColors.red100;
                  break;
                case 'late':
                  rowColor = PdfColors.orange100;
                  break;
                default:
                  rowColor = PdfColors.white;
              }

              return pw.TableRow(
                decoration: pw.BoxDecoration(color: rowColor),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Text(
                      "${e.student!.firstName} ${e.student!.lastName}",
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Text(e.status!.toUpperCase()),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Text(dateFormat.format(DateTime.parse(e.date!))),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
