import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_logo.dart';

class DetailScaffold extends StatelessWidget {
  final title;
  final leading;
  final body;

  const DetailScaffold(this.title, this.leading, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: (title == null)
          ? null
          : AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              toolbarHeight: 50,
              leadingWidth: 60,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: true,
              title: AppLogo(),
              iconTheme: const IconThemeData(color: Colors.grey),
              centerTitle: true,
              titleSpacing: 50,
              leading: /*leading*/ IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              ),
            ),
      body: body,
    );
  }
}
