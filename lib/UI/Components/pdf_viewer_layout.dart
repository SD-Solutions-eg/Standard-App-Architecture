import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../../MainImports/main_imports.dart';

class PDFViewerLayout extends StatelessWidget {
  const PDFViewerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * .7,
        child: const PDF(
          swipeHorizontal: true,
        ).cachedFromUrl(
          // 'https://www.lazygourmet.ca/wp-content/uploads/LazyGourmet_BarProgram2022.pdf',
          'https://www.mcdelivery.ae/m/ae/assets/971/mcdelivery_menu_971.pdf',
          maxAgeCacheObject: const Duration(days: 30), //duration of cache
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ));
  }
}
