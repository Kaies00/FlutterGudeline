import 'package:flutter/material.dart';
import 'package:flutter_guideline_01/02_Bottom_Nav_Bar/page01.dart';
import 'package:flutter_guideline_01/02_Bottom_Nav_Bar/page02.dart';
import 'package:flutter_guideline_01/02_Bottom_Nav_Bar/page03.dart';
import 'package:flutter_guideline_01/02_Bottom_Nav_Bar/page04.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


class HomePage02 extends StatefulWidget {
  HomePage02({Key? key}) : super(key: key);

  @override
  State<HomePage02> createState() => _HomePage02State();
}

class _HomePage02State extends State<HomePage02> with TickerProviderStateMixin {
  List bottomNavIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.basketShopping,
    FontAwesomeIcons.person,
  ];
  final List<Widget> _pageList = <Widget>[
    const Page01(),
    const Page02(),
    const Page03(),
    const Page04(),
  ];

  int _selectedPage = 0;
  double _xOffset = 0;
  int _duartion = 200;

  late AnimationController _controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
        body: _pageList.elementAt(_selectedPage),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          color: Color.fromARGB(255, 3, 39, 80)/*Theme.of(context).scaffoldBackgroundColor*/,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedPage = index;
                        switch (_selectedPage) {
                          case 1:
                            _xOffset = _size.width / 4;
                            break;
                          case 2:
                            _xOffset = _size.width / 2;
                            break;
                          case 3:
                            _xOffset = (_size.width / 4) * 3;
                            break;
                          default:
                            _xOffset = 0;
                            break;
                        }
                      });
                    },
                    child: Container(
                      height: _size.height * 0.05,
                      width: _size.width / 4  ,
                      child: Icon(
                        bottomNavIcons[index],
                        color: _selectedPage == index
                            ? Colors.white
                            : Colors.white60,
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TweenAnimationBuilder(
                      duration: Duration(milliseconds: 300),
                      tween: Tween<Offset>(
                          begin: Offset(0, 0), end: Offset(_xOffset, 0.0)),
                      builder:
                          (BuildContext context, Offset value, Widget? child) {
                        return Transform.translate(
                          offset: value,
                          child: Container(
                            color: Colors.amber,
                            height: 2,
                            width: 50,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
