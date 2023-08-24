class TimeSlot {
  final String id;
  final String name;
  final String description;
  final String colories;
  final String time;

  TimeSlot({
    required this.id,
    required this.name,
    required this.colories,
    required this.description,
    required this.time,
  });

  // mock data
  // 7 items
  static List<TimeSlot> mockItems = [
    TimeSlot(
      id: '1',
      name: 'Night',
      description: '',
      time: '5:00 Pm - 7:00 Pm',
      colories: '1252 kJ',
      // price: 5.38,
    ),
    TimeSlot(
      id: '2',
      name: 'Evening',
      description: '',
      time: '3:00 Pm - 5:00 Pm',
      colories: '2916 kJ',
    ),
    TimeSlot(
      id: '3',
      name: 'After Noon',
      description: '',
      time: '1:00 Pm - 3:00 Pm',
      colories: '705 kJ',
    ),
    TimeSlot(
      id: '4',
      name: 'Morning',
      description: 'Book a Session in the morning',
      time: '11:00 Am - 1:00 Pm',
      colories: '978 kJ',
    ),
  ];
}
