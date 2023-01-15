// import 'package:flutter/material.dart';
//
// class HeroDialogRoute<T> extends PageRoute<T> {
//   HeroDialogRoute({required this.builder, this.duration = 300}) : super();
//   final int duration;
//
//   final WidgetBuilder builder;
//
//   @override
//   bool get opaque => false;
//
//   @override
//   bool get barrierDismissible => false;
//
//   @override
//   Duration get transitionDuration => Duration(milliseconds: duration);
//
//   @override
//   bool get maintainState => true;
//
//   @override
//   Color get barrierColor => Colors.black54;
//
//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     return FadeTransition(
//         opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
//         child: child);
//   }
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return builder(context);
//   }
//
//   @override
//   String? get barrierLabel => "";
// }
