import 'package:teachers_app/config/scroll_config.dart';
import 'package:teachers_app/models/teacher_item_model.dart';
import 'package:teachers_app/models/treat_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors_constants.dart';
import '../config/services_locator.dart';
import '../services/navigation_service.dart';

class TreatsListWidget extends StatefulWidget {
  final TeacherItem teacher;
  const TreatsListWidget({super.key, required this.teacher});

  @override
  State<TreatsListWidget> createState() => TreatsListWidgetState();
}

class TreatsListWidgetState extends State<TreatsListWidget> {
  late final PageController _treatsController;
  late final PageController _headingController;
  late double _currentPosition;
  late int _currentHeading;

  void _navigationListener() {
    setState(() {
      _currentPosition = _treatsController.page!;
      // print(_currentPosition);
      if (_currentPosition.round() != _currentHeading) {
        _currentHeading = _currentPosition.round();
        _headingController.animateToPage(_currentHeading,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _treatsController = PageController(viewportFraction: 0.4, initialPage: 2);
    _headingController = PageController(viewportFraction: 1, initialPage: 2);
    _currentPosition = _treatsController.initialPage.toDouble();
    _currentHeading = _headingController.initialPage;
    _treatsController.addListener(_navigationListener);
  }

  @override
  void dispose() {
    _treatsController.removeListener(_navigationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomCenter + const Alignment(0, -1.2),
          child: IntrinsicHeight(
            child: Column(children: [
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 20),
              //     child: Text(
              //       "${TimeSlot.mockItems[_currentHeading.clamp(0, TimeSlot.mockItems.length - 1)].price.toStringAsFixed(2)}€",
              //       style: GoogleFonts.montserrat(
              //         fontSize: 28,
              //         fontWeight: FontWeight.w700,
              //         height: 1,
              //         color: kTitleColor,
              //       ),
              //       textAlign: TextAlign.right,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _headingController,
                    itemCount: TimeSlot.mockItems.length + 1,
                    scrollBehavior: WindowsScrollBehaviour(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 220, right: 20),
                        child: Text(
                          TimeSlot.mockItems[index - 1].name,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: kTitleColor.withOpacity(.8),
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
        ),
        Positioned(
          left: -size.width * 0.52,
          width: size.width,
          height: size.height * 0.7,
          child: Hero(
            tag: "teacher_${widget.teacher.id}",
            child: Transform.scale(
              scale: 1.36,
              child: Image.asset(
                widget.teacher.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Transform.scale(
              alignment: Alignment.bottomRight,
              scale: 2.0,
              child: PageView.builder(
                  controller: _treatsController,
                  scrollDirection: Axis.vertical,
                  itemCount: TimeSlot.mockItems.length + 1,
                  scrollBehavior: WindowsScrollBehaviour(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // HEADINGS HERE Would be great
                      return const SizedBox.shrink();
                    }
                    // we need to know how much index is far from the current page to scale it
                    final double distance =
                        (_currentPosition - index - 1).abs();
                    final isNotOnScreen = (_currentPosition - index + 1) > 0;
                    final double scale = .4 + distance * .35;
                    final double translateY = (.4 - scale).abs() *
                            MediaQuery.of(context).size.height /
                            1.5 +
                        15 * (distance - 1).clamp(1, 1);
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .1),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(2, 1, 0.001)
                          ..translate(0.0, !isNotOnScreen ? 1.5 : translateY)
                          ..scale(!isNotOnScreen ? .5 : scale),
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: "time_${TimeSlot.mockItems[index - 1].id}",
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              TimeSlot.mockItems[index - 1].time,
                              // fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        Positioned(
            right: 60,
            bottom: size.height * 0.15,
            child: ElevatedButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(
                  NavigationArguments(
                    teacher: TeacherItem.mockItems.indexOf(widget.teacher),
                    time: TimeSlot.mockItems.indexOf(TimeSlot.mockItems[
                        _currentHeading.clamp(
                            0, TimeSlot.mockItems.length - 1)]),
                    isCheckout: true,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 10,

                // padding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
              ),
              child: const Icon(
                FeatherIcons.plus,
                color: kTitleColor,
                size: 32,
              ),
            )),
      ],
    );
  }
}
