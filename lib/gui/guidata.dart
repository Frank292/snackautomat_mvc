import 'package:snackautomat/gui/_guidata.dart';

class GuiData implements IGuiData {
  final bool _isInventoryOpen;
  @override
  bool get isInventoryOpen => _isInventoryOpen;

  GuiData({bool? isInventoryOpen})
      : _isInventoryOpen = isInventoryOpen ?? false;

  @override
  IGuiData copyWith({bool? isInventoryOpen}) => GuiData(
        isInventoryOpen: isInventoryOpen ?? _isInventoryOpen,
      );
}
