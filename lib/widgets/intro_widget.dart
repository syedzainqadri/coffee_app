import 'package:teachers_app/config/colors_constants.dart';
import 'package:teachers_app/config/services_locator.dart';
import 'package:teachers_app/models/teacher_item_model.dart';
import 'package:teachers_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigatorKey.currentState!.pushNamed(
              'home',
            );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, .3, 0.4],
            colors: [Colors.white, kYellowColor, Colors.white.withOpacity(0.8)],
          ),
        ),
        child: Stack(children: [
          ...[1, 2, 3, 4].map((index) {
            double scale = 1.0 + (index - 1) * 0.32 + (index == 4 ? 0.3 : 0);
            double translate = (index - 1) * 100.0 + (index == 4 ? 160 : 0);

            return Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(10.0, translate)
                ..scale(scale),
              child: Hero(
                tag: "coffee_${TeacherItem.mockItems[index].id}",
                child: Image.asset(
                  TeacherItem.mockItems[index].image,
                  fit: BoxFit.contain,
                ),
              ),
            );
          }).toList(),
          Align(
            alignment: Alignment.center + const Alignment(0, 0.25),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IntrinsicHeight(
                  child: Column(
                    children: [
                      Text(
                        "Find your",
                        style: GoogleFonts.dancingScript(
                          fontSize: 80,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Teacher",
                        style: GoogleFonts.montserrat(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
