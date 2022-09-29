class SlotGenerator {
  static generateSlots(DateTime startTime, DateTime endTime, int slotDuration,
      {List<DateTime?>? availableSlots,
      List<DateTime?>? hideSlots,
      bool? shouldHideUnusedSlots}) {
    var allSlots = List<DateTime>.generate(
        endTime.difference(startTime).inMinutes ~/ slotDuration,
        (index) => DateTime(startTime.year, startTime.month, startTime.day,
                startTime.hour, 0)
            .add(Duration(minutes: slotDuration) * index));
    List<DateTime> availableSlotsInCureentSession = [];
    if (shouldHideUnusedSlots ?? false) {
      // Remove hideSlots from allSlots list
      for (var slot in allSlots) {
        if (availableSlots != null && availableSlots.contains(slot)) {
          availableSlotsInCureentSession.add(slot);
        }
      }
      allSlots = availableSlotsInCureentSession;
    } else {
      // Remove hideSlots from allSlots list
      hideSlots?.forEach((slot) {
        if (allSlots.contains(slot)) {
          allSlots.remove(slot);
        }
      });
    }
    return allSlots;
  }

  static isSlotPresent(DateTime slotTime, List<DateTime?>? allSlotTime) {
    if (allSlotTime != null) {
      if (allSlotTime.contains(slotTime)) {
        return true;
      }
    }
    return false;
  }
}
