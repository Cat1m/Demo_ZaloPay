import 'package:flutter/material.dart';
import 'package:sample_flutter/view/zalo/home.dart';

class Dashboard extends StatefulWidget {
  final String title;
  final String version;
  const Dashboard({
    super.key,
    required this.title,
    required this.version,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: Center(
            child: Text(widget.version),
          ),
        ),
        body: SafeArea(
            child: Home(
          title: widget.title,
        )),
      ),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}
