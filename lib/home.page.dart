import 'package:teachers_app/config/services_locator.dart';
import 'package:teachers_app/models/teacher_item_model.dart';
import 'package:teachers_app/models/treat_item_model.dart';
import 'package:teachers_app/services/navigation_service.dart';
import 'package:teachers_app/widgets/checkout.widget.dart';
import 'package:teachers_app/widgets/intro_widget.dart';
import 'package:teachers_app/widgets/Time_slot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'teacher_details_page.dart';
import 'widgets/teacher_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              FeatherIcons.chevronLeft,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              locator.get<NavigationService>().navigatorKey.currentState!.pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                FeatherIcons.grid,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          clipBehavior: Clip.none,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Navigator(
                  key: locator.get<NavigationService>().navigatorKey,
                  observers: [locator.get<NavigationService>().heroController],
                  onGenerateRoute: (settings) {
                    NavigationArguments? args =
                        settings.arguments as NavigationArguments?;
                    late Widget currentPage;
                    bool toHome = false;

                    if (args == null) {
                      if (settings.name == 'home') {
                        toHome = true;
                      }
                      currentPage = settings.name == 'home'
                          ? const TeachersListWidget()
                          : const IntroWidget();
                    } else {
                      currentPage = TeacherDetailsPage(
                        teacher: TeacherItem.mockItems[args.teacher],
                      );
                      if (args.isSweetTreats) {
                        currentPage = SweetTreatsWidget(
                            teacher: TeacherItem.mockItems[args.teacher]);
                      }
                      if (args.isCheckout) {
                        currentPage = CheckoutWidget(
                          teacher: TeacherItem.mockItems[args.teacher],
                          treat: args.treat != null
                              ? TimeSlot.mockItems[args.treat!]
                              : null,
                        );
                      }
                    }

                    return PageRouteBuilder(
                        transitionDuration:
                            Duration(milliseconds: toHome ? 800 : 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: Container(
                                color: Colors.white, child: currentPage),
                          );
                        });
                  }),
            ],
          ),
        ));
  }
}
