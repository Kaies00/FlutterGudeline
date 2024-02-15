import 'package:flutter/material.dart';
import 'package:flutter_guideline_01/03_Drawer/foth_pag.dart';
import 'package:flutter_guideline_01/03_Drawer/values.dart';

import 'drawer_page.dart';

class HomePage03 extends StatefulWidget {
  const HomePage03({Key? key}) : super(key: key);

  @override
  State<HomePage03> createState() => _HomePage03State();
}

class _HomePage03State extends State<HomePage03> with TickerProviderStateMixin {
  late AnimationController _firstPageIconController;
  double _xaOffset = 0.0;
  double _yaOffset = 0.0;
  double _ascale = 1.0;
  bool _drawerIsOpen = false;

  @override
  void initState() {
    _firstPageIconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          DrawerPage(drawerIsOpen: _drawerIsOpen),
          ForthPage(
            drawerIsOpen: _drawerIsOpen,
            scale: _ascale,
            xOffset: _xaOffset,
            yOffset: _yaOffset,
          ),
          _thirdPage(),
          _secondPage(),
          _firstPage(),
        ]),
      ),
    );
  }

  _firstPage() {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      transform: Matrix4.translationValues(_xaOffset, _yaOffset, 0)
        ..scale(_ascale),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_drawerIsOpen ? 40 : 0),
          color: eColor,
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(0, 0),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //   ),
          //   BoxShadow(
          //     offset: Offset(0, 0),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 2,
          //     spreadRadius: 2,
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _drawerIsOpen
                            ? _firstPageIconController.reverse()
                            : _firstPageIconController.forward();
                        _drawerIsOpen ? _xaOffset = 0.0 : _xaOffset = 300.0;
                        _drawerIsOpen ? _yaOffset = 0.0 : _yaOffset = 70.0;
                        _drawerIsOpen ? _ascale = 1.0 : _ascale = 0.8;

                        _drawerIsOpen = !_drawerIsOpen;
                        //Provider.of<MyProvider>(context, listen: false).switchDrawerState();
                      });
                    },
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _firstPageIconController),
                  ),
                  Text("Location"),
                  CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                     backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _secondPage() {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      transform: Matrix4.translationValues(_xaOffset - 25, _yaOffset + 40, 0)
        ..scale(_ascale - 0.1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_drawerIsOpen ? 40 : 0),
          color: cColor,
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(0, 0),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //   ),
          //   BoxShadow(
          //     offset: Offset(0, 0),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 2,
          //     spreadRadius: 2,
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(_drawerIsOpen.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _thirdPage() {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      transform: Matrix4.translationValues(_xaOffset - 50, _yaOffset + 80, 0)
        ..scale(_ascale - 0.2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_drawerIsOpen ? 40 : 0),
          color: dColor,
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(-10, 5),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //   ),
          //   BoxShadow(
          //     offset: Offset(-5, 0),
          //     color: Color.fromRGBO(176, 190, 197, 1),
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //   ),
          // ],
        ),
      ),
    );
  }
}
