import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef GetWidget = Widget Function(List<QueryDocumentSnapshot<Object?>> data);

class FirebaseComponentWrapper extends StatefulWidget {
  const FirebaseComponentWrapper(
      {Key? key,
      required this.future,
      required this.getWidget,
      this.emptyWidget,
      this.loadingWidget,
      this.errorWidget})
      : super(key: key);

  final Future<QuerySnapshot<Object?>> future;
  final GetWidget getWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? loadingWidget;

  @override
  _FirebaseComponentWrapperState createState() =>
      _FirebaseComponentWrapperState();
}

class _FirebaseComponentWrapperState extends State<FirebaseComponentWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          if (widget.errorWidget != null) {
            return widget.errorWidget!;
          }
          print(snapshot.error);
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data!.size == 0) {
          if (widget.emptyWidget != null) {
            return widget.emptyWidget!;
          }
          return Text("Empty");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          if (widget.loadingWidget != null) {
            return widget.loadingWidget!;
          }
          return Text("loading...");
        }

        List<QueryDocumentSnapshot<Object?>> data = snapshot.data!.docs;
        return widget.getWidget(data);
      },
    );
  }
}
