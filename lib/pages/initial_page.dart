import 'package:flutter/material.dart';
import 'package:flutter_test_index/widgets/mobile_view.dart';
import 'package:flutter_test_index/widgets/web_view.dart';
import 'package:flutter_test_index/utilities/constants.dart';
import 'package:flutter_test_index/utilities/responsive.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(color: textColor),
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: Colors.white),
        ),
      ),
      body: Responsive.isMobile(context) ? const MobileViewPage() : const WebViewPage(),
    );
  }
}
