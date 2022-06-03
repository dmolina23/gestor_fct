// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:gestor_fct/constants.dart';

class VisitsComponent extends StatelessWidget {
  const VisitsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.85, -1),
              child: Text(
                'Próximas visitas',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 15,
                      color: Color(0x91000000),
                      spreadRadius: 7,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2022, 6, 1),
                    lastDay: DateTime.utc(2022, 6, 31),
                    focusedDay: DateTime.now(),
                    locale: 'en_US',
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                        titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),

                        formatButtonVisible: false
                      ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                      weekendTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.normal),
                      todayDecoration: BoxDecoration(
                          color: buttonPrimary,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
