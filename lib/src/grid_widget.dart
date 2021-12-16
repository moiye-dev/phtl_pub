import 'dart:collection';

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class PlainGridView extends StatelessWidget {
  final Widget? drawer;
  final String title;
  final List<HashMap<String, Object>> components;

  const PlainGridView({
    Key? key,
    required this.components,
    required this.title,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Visibility(visible: drawer != null, child: drawer!),
      appBar: AppBar(
        title: Text(title),
        leading: // BackButton disappers when a endDrawer is inserted.
            (ModalRoute.of(context)?.canPop ?? false)
                ? const BackButton()
                : null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: buildGridView(
          isDisabled: false,
        ),
      ),
    );
  }

  Widget buildGridView({
    bool isDisabled = false,
  }) {
    return GridView.count(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      childAspectRatio: 1.0,
      padding: const EdgeInsets.only(left: 16, right: 16),
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: getChildren(),
      // return InkWell(
      //   onTap: isDisabled
      //       ? () {
      //           Helpers.createConfirmation(
      //                   context: context,
      //                   title: tr("Authorization.unauth_title"),
      //                   message: tr("Authorization.unauth_guest_msg"),
      //                   onDismiss: () {})
      //               .show(context)
      //               .then((value) => {
      //                     if (value != null && value)
      //                       Navigator.pushNamedAndRemoveUntil(
      //                           context, "/", (Route<dynamic> route) => false)
      //                   });
      //         }
      //       : () {
      //           var component =
      //               components.elementAt(index)['route'] as String;
      //           Navigator.pushNamed(context, component);
      //         },
      //   child: Card(
      //     shadowColor: components.elementAt(index)['color'] as Color,
      //     elevation: 1.0,
      //     clipBehavior: Clip.antiAlias,
      //     child: Padding(
      //         padding: const EdgeInsets.all(4.0),
      //         child: Center(
      //             child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //               components.elementAt(index)['icon'] as Icon,
      //               getTitleRow(index, title),
      //               // getSubTitle(index)
      //             ]))),
      //   ),
      // );
    );
  }

  List<Widget> getChildren() {
    return [];
  }
}

Widget getTitleRow(int index, String title) {
  // var titleKey = "HouseManagementPage.${components.elementAt(index)['key']}";
  return Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    // textAlign: TextAlign.left,
  );
}
