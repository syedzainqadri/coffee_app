import 'package:teachers_app/widgets/timeslot_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors_constants.dart';
import '../config/services_locator.dart';
import '../models/teacher_item_model.dart';
import '../services/navigation.service.dart';

class SweetTreatsWidget extends StatefulWidget {
  final TeacherItem teacher;
  const SweetTreatsWidget({super.key, required this.teacher});

  @override
  State<SweetTreatsWidget> createState() => _SweetTreatsWidgetState();
}

class _SweetTreatsWidgetState extends State<SweetTreatsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = GoogleFonts.montserrat(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      height: 1,
      color: kTitleColor,
    );
    return Stack(
      children: [
        _buildBackground(),
        TreatsListWidget(teacher: widget.teacher),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Hero(
                            tag: "coffee_${widget.teacher.id}_name",
                            child: Text(
                              widget.teacher.name,
                              style: titleStyle,
                              textAlign: TextAlign.right,
                            )),
                        const SizedBox(height: 30),
                        Text("Would you like to add some sweet treats?",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.questrial(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: kTitleColor.withOpacity(.5))),
                        const SizedBox(height: 15),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kTitleColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 15),
                                  alignment: Alignment.centerLeft,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                onPressed: () {
                                  locator<NavigationService>().navigateTo(
                                      NavigationArguments(
                                          teacher: TeacherItem.mockItems
                                              .indexOf(widget.teacher),
                                          isCheckout: true));
                                },
                                child: const Text("No, thanks!"))),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
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
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
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
}
