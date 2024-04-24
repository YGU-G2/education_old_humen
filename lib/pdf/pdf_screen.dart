import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  static String id = '/pdf_screen';

  const PDFScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              // _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      // body: SfPdfViewer.network(
      // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      // key: _pdfViewerKey,
    );
  }
}
