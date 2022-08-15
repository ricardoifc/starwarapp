import 'package:starwarapp/Util/global_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSplash extends StatelessWidget {
  static String routerPage = 'viewSpash';

  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GlobalColor.colorPrincipal,
      body: SafeArea(
        child: containerLogo(),
      ),
    );
  }

  Widget containerLogo() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Center(child: Text('Star War',
        style: TextStyle(
            fontSize: 70,
            color: Colors.white,
            fontWeight: FontWeight.bold,
        ),
      ))
    ]);
  }
}
