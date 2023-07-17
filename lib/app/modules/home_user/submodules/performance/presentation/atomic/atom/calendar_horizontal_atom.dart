// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class CalendarHorizontalAtom extends StatefulWidget {
  final DateTime currentDateSelected;
  const CalendarHorizontalAtom({
    Key? key,
    required this.currentDateSelected,
  }) : super(key: key);

  @override
  State<CalendarHorizontalAtom> createState() => _CalendarHorizontalAtomState();
}

class _CalendarHorizontalAtomState extends State<CalendarHorizontalAtom> {
  final DatePickerController _datePickerController = DatePickerController();

  @override
  void initState() {
    super.initState();
    updateSelectedDate(_datePickerController);
  }

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.parse('2023-06-19'),
      initialSelectedDate: widget.currentDateSelected,
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      inactiveDates: [
        DateTime.parse('2023-06-20'),
      ],
      //TODO: criar um filtro para validar caso ele tenha ou não ido a academia para trocar a cor de ação
      deactivatedColor: Colors.red,
      onDateChange: (date) {
        setState(() {
          updateSelectedDate(_datePickerController);
        });
      },
      locale: "pt_BR",
      controller: _datePickerController,
    );
  }
}

void updateSelectedDate(DatePickerController datePickerController) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    datePickerController.jumpToSelection();
  });
}
