import 'package:flutter/material.dart';
import 'package:gantt_chart/gantt_chart.dart';

class GanttChartDefaultStickyAreaCell extends StatelessWidget {
  final GanttEventBase event;
  final int eventIndex;
  final Color eventColor;
  final WidgetBuilder? widgetBuilder;

  const GanttChartDefaultStickyAreaCell({
    super.key,
    required this.event,
    required this.eventIndex,
    required this.eventColor,
    this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: eventColor,
        border: BorderDirectional(
          top: eventIndex == 0 ? const BorderSide() : BorderSide.none,
          start: const BorderSide(),
          end: const BorderSide(),
          bottom: const BorderSide(),
        ),
      ),
      child: Center(
        child: widgetBuilder?.call(context) ?? _defaultChild(context),
      ),
    );
  }

  Widget _defaultChild(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .40 * .25,
                    child: Center(
                      child: Text(
                        event.getDisplayName(context),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .40 * .25,
                    child: Center(
                      child: Text(
                        event.startDateValue!,
                        textAlign: TextAlign.center,
                      ),
                    ))),
            Expanded(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * .40 * .25,
              child: Center(
                child: Text(
                  event.endDateValue!,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .40 * .25,
                    child: Center(
                      child: Text(
                        event.durationValue!,
                        textAlign: TextAlign.center,
                      ),
                    ))),
            Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .40 * .25,
                    child: Center(
                      child: Text(
                        "${event.percentage!} %",
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ],
        ));
  }
}
