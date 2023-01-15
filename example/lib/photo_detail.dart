// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'hero_dialog_route.dart';
//
// class PhotoDetail {
//   final ValueNotifier<double> _opacity = ValueNotifier<double>(1.0);
//   final ValueNotifier<double> _alignY = ValueNotifier<double>(0.0);
//   late final Color backgroundColor;
//   late final PageView pageView;
//   late final Widget? appBar;
//   late final Positioned? indicator;
//   late final double defaultHeight;
//   late final double defaultAlignY;
//   late final int animationDuration;
//   late BuildContext context;
//
//   PhotoDetail({
//     required this.context,
//     required this.pageView,
//     this.appBar,
//     this.indicator,
//     this.defaultHeight = 0.75,
//     this.defaultAlignY = 0.6,
//     this.animationDuration = 300,
//     this.backgroundColor = Colors.white,
//   })  : assert(defaultHeight >= 0.1 && defaultHeight <= 0.9
//             ? true
//             : throw "The defaultHeight value must be greater than or equal to 0.1 and less than or equal to 0.9."),
//         assert(defaultAlignY >= 0.1 && defaultAlignY <= 1.4
//             ? true
//             : throw "The defaultAlignY value must be greater than or equal to 0.1 and less than or equal to 1.4.") {
//     Navigator.push(
//       context,
//       HeroDialogRoute(
//         duration: animationDuration,
//         builder: (context) {
//           this.context = context;
//           double height = MediaQuery.of(context).size.height;
//           return StatefulBuilder(
//             builder: (context, setState) {
//               return Stack(
//                 children: [
//                   _photo(height),
//                   if (appBar != null) _appBar(),
//                   if (indicator != null) indicator!,
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _photo(double height) {
//     return Positioned(
//       left: 0,
//       top: 0,
//       right: 0,
//       bottom: 0,
//       child: ValueListenableBuilder<double>(
//         valueListenable: _alignY,
//         builder: (_, alignY, __) {
//           return ValueListenableBuilder<double>(
//             valueListenable: _opacity,
//             builder: (_, opacity, __) {
//               return Container(
//                 padding: const EdgeInsets.only(top: 50),
//                 color: backgroundColor.withOpacity(opacity),
//                 alignment: Alignment(0, alignY),
//                 child: GestureDetector(
//                   onVerticalDragEnd: (details) {
//                     if (alignY > defaultAlignY || alignY < -defaultAlignY) {
//                       _close();
//                     } else {
//                       _initValues();
//                     }
//                   },
//                   onVerticalDragCancel: _initValues,
//                   onVerticalDragUpdate: _dragUpdate,
//                   child: SizedBox(
//                     height: height * defaultHeight,
//                     child: pageView,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _appBar() {
//     return ValueListenableBuilder(
//       valueListenable: _opacity,
//       builder: (context, value, child) {
//         return Positioned(
//           left: 0,
//           top: 0,
//           right: 0,
//           child: Opacity(
//             opacity: value,
//             child: appBar!,
//           ),
//         );
//       },
//     );
//   }
//
//   void _close() {
//     if (_alignY.value > defaultAlignY || _alignY.value < -defaultAlignY) {
//       Navigator.pop(context);
//     }
//   }
//
//   void _initValues() {
//     Timer.periodic(const Duration(milliseconds: 1), (timer) {
//       if ((_opacity.value + 0.006) > 1) {
//         _opacity.value = 1;
//       } else {
//         _opacity.value += 0.006;
//       }
//
//       if (_alignY.value > 0) {
//         if (_alignY.value - 0.01 < 0) {
//           _alignY.value = 0;
//           _opacity.value = 1;
//           timer.cancel();
//         } else {
//           _alignY.value -= 0.01;
//         }
//       } else {
//         if ((_alignY.value + 0.01) > 0) {
//           _alignY.value = 0;
//           _opacity.value = 1;
//           timer.cancel();
//         } else {
//           _alignY.value += 0.01;
//         }
//       }
//     });
//   }
//
//   void _dragUpdate(DragUpdateDetails details) {
//     double dy = details.delta.dy * 0.005;
//     if (_alignY.value + dy < 1.5 && _alignY.value + dy > -1.5) {
//       _alignY.value += dy;
//     }
//     double o = (details.delta.dy * 0.002).abs();
//     if (_alignY.value > 0) {
//       if (details.primaryDelta! > 0) {
//         if ((_opacity.value - o) > 0) {
//           _opacity.value -= o;
//         }
//       } else {
//         if ((_opacity.value + o) < 1) {
//           _opacity.value += o;
//         }
//       }
//     } else {
//       if (details.primaryDelta! < 0) {
//         if ((_opacity.value - o) > 0) {
//           _opacity.value -= o;
//         }
//       } else {
//         if ((_opacity.value + o) < 1) {
//           _opacity.value += o;
//         }
//       }
//     }
//   }
// }
