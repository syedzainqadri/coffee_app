import 'package:teachers_app/models/teacher_item_model.dart';
import 'package:teachers_app/models/treat_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors_constants.dart';

class CheckoutWidget extends StatelessWidget {
  final TeacherItem teacher;
  final TimeSlot? treat;
  const CheckoutWidget({super.key, required this.teacher, this.treat});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildBackground(),
        Hero(
          tag: "teacher_${teacher.id}",
          child: Image.asset(
            teacher.image,
            fit: BoxFit.contain,
          ),
        ),
        if (treat != null)
          Align(
            alignment: const Alignment(2, 0.5),
            child: SizedBox(
              width: size.width * 0.8,
              child: Hero(
                tag: "time_${treat!.id}",
                child: Text(
                  treat!.time,
                ),
              ),
            ),
          ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("My Booking",
                    style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: kTitleColor)),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(teacher.name,
                          style: GoogleFonts.questrial(
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: kTitleColor)),
                    ),
                    Text("${teacher.price}€",
                        style: GoogleFonts.questrial(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                            color: kTitleColor.withOpacity(.7))),
                  ],
                ),
                if (treat != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(treat!.name,
                              style: GoogleFonts.questrial(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: kTitleColor)),
                        ),
                        Text(treat!.time,
                            style: GoogleFonts.questrial(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: kTitleColor.withOpacity(.7))),
                      ],
                    ),
                  ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kTitleColor,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child:
                      Text("Book Now (${teacher.price} \$ at ${treat!.time})"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

_buildBackground() {
  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            stops: const [0.0, .50],
            colors: [
              kYellowColor.withOpacity(.7),
              kYellowColor.withOpacity(0.0)
            ],
          ),
        )),
      ),
      Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, .4],
            colors: [
              kYellowColor.withOpacity(.5),
              kYellowColor.withOpacity(0.0)
            ],
          ),
        )),
      ),
    ],
  );
}
