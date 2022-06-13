import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/createCompany/createCompany.dart';
import 'package:gestor_fct/screens/createDeal/createDeal.dart';
import 'package:gestor_fct/screens/createStudent/createStudent.dart';

class AddComponent extends StatefulWidget {
  const AddComponent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddComponentState createState() => _AddComponentState();
}

bool toggle = true;
Alignment alignment1 = const Alignment(0, 0);
Alignment alignment2 = const Alignment(0, 0);
Alignment alignment3 = const Alignment(0, 0);

class _AddComponentState extends State<AddComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Add Student
        AnimatedAlign(
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          alignment: alignment1,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          child: AnimatedContainer(
            duration: toggle
                ? const Duration(milliseconds: 275)
                : const Duration(milliseconds: 875),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              icon: const Icon(
                Icons.person_add,
                color: Color(0xFF228F22),
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateStudent(),
                    ));
              },
            ),
          ),
        ),

        // Add Company
        AnimatedAlign(
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          alignment: alignment2,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          child: AnimatedContainer(
            duration: toggle
                ? const Duration(milliseconds: 275)
                : const Duration(milliseconds: 875),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              icon: const Icon(
                Icons.add_home_work,
                color: Color(0xFF228F22),
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateCompany(),
                    ));
              },
            ),
          ),
        ),

        // Add Deal
        AnimatedAlign(
          duration: toggle
              ? const Duration(milliseconds: 275)
              : const Duration(milliseconds: 875),
          alignment: alignment3,
          curve: toggle ? Curves.easeIn : Curves.elasticOut,
          child: AnimatedContainer(
            duration: toggle
                ? const Duration(milliseconds: 275)
                : const Duration(milliseconds: 875),
            curve: toggle ? Curves.easeIn : Curves.elasticOut,
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              icon: const Icon(
                Icons.post_add,
                color: Color(0xFF228F22),
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateDeal(),
                    ));
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: _animation.value * pi * (3 / 4),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: toggle ? 60.0 : 55.0,
                width: toggle ? 60.0 : 55.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF228F22),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (toggle) {
                          toggle = !toggle;
                          _controller.forward();
                          Future.delayed(const Duration(milliseconds: 10), () {
                            alignment1 = const Alignment(-0.4, -2.8);
                          });
                          Future.delayed(const Duration(milliseconds: 10), () {
                            alignment2 = const Alignment(0, -5);
                          });
                          Future.delayed(const Duration(milliseconds: 10), () {
                            alignment3 = const Alignment(0.4, -2.8);
                          });
                        } else {
                          toggle = !toggle;
                          _controller.reverse();
                          alignment1 = const Alignment(0, 0);
                          alignment2 = const Alignment(0, 0);
                          alignment3 = const Alignment(0, 0);
                        }
                      });
                    },
                  ),
                )),
          ),
        )
      ],
    );
  }
}
