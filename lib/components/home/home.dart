import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/common/image.dart';
import 'package:flutter_firebase/components/common/vstack.dart';
import 'package:flutter_firebase/components/home/home-model.dart';
import 'package:flutter_firebase/theme/font.dart';
import 'package:flutter_firebase/theme/inset.dart';

import '../firebase/firebase-component-wrapper.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  CollectionReference collection =
      FirebaseFirestore.instance.collection('hotels');
  @override
  Widget build(BuildContext context) {
    return FirebaseComponentWrapper(
        future: collection.get(),
        getWidget: (data) {
          List<Widget> hotels = data.map((doc) {
            var data = HomeModel.fromJson(doc.data() as Map<String, dynamic>);

            return Container(
                width: double.infinity,
                padding: EdgeInsets.all(Insets.md),
                child: VStack(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BorderedImage(
                        url: data.images[0],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        data.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text("Rs. ${data.price}/-")
                    ]));
          }).toList();
          return VStack(children: hotels);
        });
  }
}
