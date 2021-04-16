import 'package:snackautomat/gui/guidata.dart';

abstract class IGuiData {
  bool get isInventoryOpen;

  factory IGuiData() = GuiData;

  IGuiData copyWith({
    bool? isInventoryOpen,
  });
}
