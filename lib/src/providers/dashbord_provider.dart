import 'package:flutter/cupertino.dart';

class DashBoardProvider with ChangeNotifier {
  GlobalKey index0 = GlobalKey();
  GlobalKey index1 = GlobalKey();
  GlobalKey index2 = GlobalKey();
  GlobalKey index3 = GlobalKey();
  double selectedPositionX = 7.0;
  PageController controller = PageController(initialPage: 0);

  GlobalKey getPosition(int val) {
    switch (val) {
      case 0:
        return index0;
      case 1:
        return index1;
      case 2:
        return index2;
      case 3:
        return index3;
      default:
        return index0;
    }
  }

  changeTab(int val) {
    GlobalKey selected = getPosition(val);
    final RenderBox widgetRenderBox =
        selected.currentContext?.findRenderObject() as RenderBox;
    final widgetPosition = widgetRenderBox.localToGlobal(Offset.zero);
    selectedPositionX = (widgetPosition.dx)-38.5;
    notifyListeners();
  }
}
