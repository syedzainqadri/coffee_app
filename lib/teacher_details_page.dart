import 'package:teachers_app/config/services_locator.dart';
import 'package:teachers_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/colors_constants.dart';
import 'models/teacher_item_model.dart';

class TeacherDetailsPage extends StatefulWidget {
  final TeacherItem teacher;
  const TeacherDetailsPage({super.key, required this.teacher});

  @override
  State<TeacherDetailsPage> createState() => _TeacherDetailsPageState();
}

class _TeacherDetailsPageState extends State<TeacherDetailsPage> {
  late String sizeteacher;

  @override
  void initState() {
    super.initState();
    sizeteacher = '1 h';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = GoogleFonts.montserrat(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      height: 1,
      color: kTitleColor,
    );
    return Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
      _buildBackground(),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center + const Alignment(-.9, -0.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kTitleColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          locator<NavigationService>().navigateTo(
                              NavigationArguments(
                                  teacher: TeacherItem.mockItems
                                      .indexOf(widget.teacher),
                                  isSweetTreats: true));
                        },
                        child: Row(
                          children: [
                            Text('Book a session now',
                                style: GoogleFonts.questrial(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              FeatherIcons.chevronsRight,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FeatherIcons.book,
                        color: kTitleColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        sizeteacher == '1 h'
                            ? "1 hour / session"
                            : sizeteacher == '2 h'
                                ? "2 hour / session"
                                : "30 min / session",
                        style: GoogleFonts.questrial(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: kTitleColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: ['1/2 h', '1 h', '2 h']
                        .map((sizeSession) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  sizeteacher = sizeSession;
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: sizeteacher == sizeSession
                                      ? kTitleColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: sizeteacher != sizeSession
                                        ? kTitleColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  style: GoogleFonts.questrial(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: sizeteacher != sizeSession
                                        ? kTitleColor
                                        : Colors.white,
                                  ),
                                  child: Text(
                                    sizeSession,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "${(widget.teacher.price + (sizeteacher == "1 h" ? 0 : (sizeteacher == "2 h" ? 1.2 : -.8))).toStringAsFixed(2)}\$ / hr",
                    style: titleStyle),
              ),
              const Spacer(),
              Text(
                widget.teacher.description,
                textAlign: TextAlign.left,
                style: GoogleFonts.questrial(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: kTitleColor.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.6,
                child: Hero(
                    tag: "teacher_${widget.teacher.id}_name",
                    child: Text(
                      widget.teacher.name,
                      style: titleStyle,
                      textAlign: TextAlign.left,
                    )),
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: size.width * 0.38,
        bottom: -size.height * 0.15,
        width: size.width,
        height: size.height * 0.7,
        child: IgnorePointer(
          ignoring: true,
          child: Hero(
            tag: "teacher_${widget.teacher.id}",
            child: AnimatedScale(
              duration: const Duration(milliseconds: 400),
              scale: sizeteacher == '1 h'
                  ? 1.36
                  : sizeteacher == '2'
                      ? 1.5
                      : 1.2,
              curve: Curves.easeOutBack,
              alignment: Alignment.center,
              child: Image.asset(
                widget.teacher.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
