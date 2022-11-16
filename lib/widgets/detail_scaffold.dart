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
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarHeight: 50,
          leadingWidth: 0,
          backgroundColor: const Color.fromARGB(255, 17, 75, 112),
          automaticallyImplyLeading: false,
          title: AppLogo(),
          iconTheme: const IconThemeData(color: Colors.grey),
          centerTitle: true,
          titleSpacing: 0,
          leading: leading),
      body: body,
    );
  }
}
