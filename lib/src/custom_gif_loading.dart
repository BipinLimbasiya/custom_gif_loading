import 'package:flutter/material.dart';

const defaultValue = 56.0;

class Loading extends StatelessWidget {
  static OverlayEntry? _currentLoading;

  const Loading(this.gif, {super.key});

  final Image? gif;

  static OverlayState? _overlayState;

  static bool get isShown => _currentLoading != null;

  void start(BuildContext context,
      {ThemeData? themeData,
      Color? overlayColor,
      double? overlayFromTop,
      double? overlayFromBottom,
      bool isAppbarOverlay = true,
      bool isBottomBarOverlay = true,
      bool isSafeAreaOverlay = true}) {
    var safeBottomPadding = MediaQuery.of(context).padding.bottom;
    var defaultPaddingTop = 0.0;
    var defaultPaddingBottom = 0.0;
    if (!isAppbarOverlay) {
      isSafeAreaOverlay = false;
    }
    if (!isSafeAreaOverlay) {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue + safeBottomPadding;
    } else {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue;
    }

    _overlayState = Overlay.of(context);
    if (_currentLoading == null) {
      _currentLoading = OverlayEntry(builder: (context) {
        return Stack(
          children: <Widget>[
            _overlayWidget(
                isSafeAreaOverlay,
                overlayColor ?? const Color(0x99ffffff),
                isAppbarOverlay ? 0.0 : overlayFromTop ?? defaultPaddingTop,
                isBottomBarOverlay
                    ? 0.0
                    : overlayFromBottom ?? defaultPaddingBottom),
            Center(
                child: Loading(
              gif,
            )),
          ],
        );
      });

      try {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_currentLoading != null) {
            _overlayState?.insert(_currentLoading!);
          }
        });
      } catch (e) {}
    }
  }

  static Widget _overlayWidget(bool isSafeArea, Color overlayColor,
      double overlayFromTop, double overlayFromBottom) {
    return isSafeArea
        ? Container(
            color: overlayColor,
            margin:
                EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          )
        : SafeArea(
            child: Container(
            color: overlayColor,
            margin:
                EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          ));
  }

  static void stop() {
    if (_currentLoading != null) {
      try {
        _currentLoading?.remove();
      } catch (e) {
        print(e.toString());
      } finally {
        _currentLoading = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
            child: gif!));
  }
}
