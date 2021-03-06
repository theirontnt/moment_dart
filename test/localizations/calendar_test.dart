import 'package:moment_dart/moment_dart.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  // A
  final today = Moment.parse("2003-06-01T05:33:00.000Z"); // Sunday
  final tomorrow = today.add(const Duration(days: 1));
  final tueOrDayAfterTomorrow = today.add(const Duration(days: 2));
  final yesterday = today.subtract(const Duration(days: 1));
  final friOrdayBeforeYesterday = today.subtract(const Duration(days: 2));

  // B
  final lastMonday = today.lastMonday();
  final lastTuesday = today.lastTuesday();
  final lastWednesday = today.lastWednesday();
  final nextWednesday = today.nextWednesday();
  final nextThursday = today.nextThursday();
  final nextFriday = today.nextFriday();

  // C
  final epoch = Moment.fromMillisecondsSinceEpoch(0, isUtc: true);

  void _setLocalization(MomentLocalization localization) {
    // A
    today.setLocalization(localization);
    tomorrow.setLocalization(localization);
    tueOrDayAfterTomorrow.setLocalization(localization);
    yesterday.setLocalization(localization);
    friOrdayBeforeYesterday.setLocalization(localization);
    // B
    lastMonday.setLocalization(localization);
    lastTuesday.setLocalization(localization);
    lastWednesday.setLocalization(localization);
    nextWednesday.setLocalization(localization);
    nextThursday.setLocalization(localization);
    nextFriday.setLocalization(localization);
    // C
    epoch.setLocalization(localization);
  }

  test("de_DE localization calendar test", () {
    _setLocalization(MomentLocalizations.deDE());

    // A
    expect(today.calendar(reference: today), "heute um 5:33");
    expect(tomorrow.calendar(reference: today), "morgen um 5:33");
    expect(
        tueOrDayAfterTomorrow.calendar(reference: today), "├╝bermorgen um 5:33");
    expect(yesterday.calendar(reference: today), "gestern um 5:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today),
        "vorgestern um 5:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "letzten Montag");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "letzten Dienstag");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "letzten Mittwoch");
    expect(
        nextWednesday.calendar(reference: today, omitHours: true), "Mittwoch");
    expect(
        nextThursday.calendar(reference: today, omitHours: true), "Donnerstag");
    expect(nextFriday.calendar(reference: today, omitHours: true), "Freitag");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "Donnerstag, 1. Januar 1970 00:00");
  });

  test("it localization calendar test", () {
    _setLocalization(MomentLocalizations.it());

    // A
    expect(today.calendar(reference: today), "oggi alle 05:33");
    expect(tomorrow.calendar(reference: today), "domani alle 05:33");
    expect(
        tueOrDayAfterTomorrow.calendar(reference: today), "marted├Č alle 05:33");
    expect(yesterday.calendar(reference: today), "ieri alle 05:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today),
        "Lo scorso venerd├Č alle 05:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "Lo scorso luned├Č");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "Lo scorso marted├Č");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "Lo scorso mercoled├Č");
    expect(
        nextWednesday.calendar(reference: today, omitHours: true), "mercoled├Č");
    expect(nextThursday.calendar(reference: today, omitHours: true), "gioved├Č");
    expect(nextFriday.calendar(reference: today, omitHours: true), "venerd├Č");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "gioved├Č 1 gennaio 1970 00:00");

    // Sunday
    expect(
      lastMonday.subtract(const Duration(days: 1)).calendar(
            reference: today,
            omitHours: true,
          ),
      "La scorsa domenica",
    );

    // at zero
    expect(
      today.startOfDay().calendar(
            reference: today,
          ),
      "oggi a 00:00",
    );
    // at 1
    expect(
      today.startOfDay().add(const Duration(hours: 1)).calendar(
            reference: today,
          ),
      "oggi all'01:00",
    );
  });

  test("fr localization calendar test", () {
    _setLocalization(MomentLocalizations.fr());

    // A
    expect(today.calendar(reference: today), "Aujourd'hui ├á 05:33");
    expect(tomorrow.calendar(reference: today), "Demain ├á 05:33");
    expect(tueOrDayAfterTomorrow.calendar(reference: today), "mardi ├á 05:33");
    expect(yesterday.calendar(reference: today), "Hier ├á 05:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today),
        "vendredi dernier ├á 05:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "lundi dernier");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "mardi dernier");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "mercredi dernier");
    expect(
        nextWednesday.calendar(reference: today, omitHours: true), "mercredi");
    expect(nextThursday.calendar(reference: today, omitHours: true), "jeudi");
    expect(nextFriday.calendar(reference: today, omitHours: true), "vendredi");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "jeudi 1 janvier 1970 00:00");
  });

  test("es localization calendar test", () {
    _setLocalization(MomentLocalizations.es());

    // A
    expect(today.calendar(reference: today), "hoy a las 5:33");
    expect(tomorrow.calendar(reference: today), "ma├▒ana a las 5:33");
    expect(
        tueOrDayAfterTomorrow.calendar(reference: today), "martes a las 5:33");
    expect(yesterday.calendar(reference: today), "ayer a las 5:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today),
        "el viernes a las 5:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true), "el lunes");
    expect(
        lastTuesday.calendar(reference: today, omitHours: true), "el martes");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "el mi├ęrcoles");
    expect(
        nextWednesday.calendar(reference: today, omitHours: true), "mi├ęrcoles");
    expect(nextThursday.calendar(reference: today, omitHours: true), "jueves");
    expect(nextFriday.calendar(reference: today, omitHours: true), "viernes");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "jueves, 1 de enero de 1970 00:00");
  });

  test("en_US localization calendar test", () {
    _setLocalization(MomentLocalizations.enUS());

    // A
    expect(today.calendar(reference: today), "Today at 5:33 AM");
    expect(tomorrow.calendar(reference: today), "Tomorrow at 5:33 AM");
    expect(
        tueOrDayAfterTomorrow.calendar(reference: today), "Tuesday at 5:33 AM");
    expect(yesterday.calendar(reference: today), "Yesterday at 5:33 AM");
    expect(friOrdayBeforeYesterday.calendar(reference: today),
        "Last Friday at 5:33 AM");
    // B
    expect(
        lastMonday.calendar(reference: today, omitHours: true), "Last Monday");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "Last Tuesday");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "Last Wednesday");
    expect(
        nextWednesday.calendar(reference: today, omitHours: true), "Wednesday");
    expect(
        nextThursday.calendar(reference: today, omitHours: true), "Thursday");
    expect(nextFriday.calendar(reference: today, omitHours: true), "Friday");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "Thursday, January 1 1970 12:00 AM");
  });

  test("mn localization calendar test", () {
    _setLocalization(MomentLocalizations.mn());

    // A
    expect(today.calendar(reference: today), "ËĘđŻËęËęđ┤ËęĐÇ 5:33");
    expect(tomorrow.calendar(reference: today), "đťđ░ĐÇđ│đ░đ░Đł 5:33");
    expect(tueOrDayAfterTomorrow.calendar(reference: today), "đŁËęđ│ËęËęđ┤ËęĐÇ 5:33");
    expect(yesterday.calendar(reference: today), "ËĘĐçđŞđ│đ┤ËęĐÇ 5:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today), "đúĐÇđÂđŞđ│đ┤đ░ĐÇ 5:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "ËĘđŻđ│ËęĐÇĐüËęđŻ đöđ░đ▓đ░đ░");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "ËĘđŻđ│ËęĐÇĐüËęđŻ đťĐĆđ│đ╝đ░ĐÇ");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "ËĘđŻđ│ËęĐÇĐüËęđŻ đŤĐůđ░đ│đ▓đ░");
    expect(nextWednesday.calendar(reference: today, omitHours: true), "đŤĐůđ░đ│đ▓đ░");
    expect(nextThursday.calendar(reference: today, omitHours: true), "đčĎ»ĐÇĐŹđ▓");
    expect(nextFriday.calendar(reference: today, omitHours: true), "đĹđ░đ░Đüđ░đŻ");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(
        epoch.format("LLLL"), "đčĎ»ĐÇĐŹđ▓ đ│đ░ĐÇđ░đ│, 1970 đżđŻĐő 1 đ┤Ď»đ│ĐŹĐŹĐÇ Đüđ░ĐÇĐőđŻ 1, 00:00");
  });

  test("mn (Traditional) localization calendar test", () {
    _setLocalization(MomentLocalizations.mnTM());

    // A
    expect(today.calendar(reference: today), "ßáąßáĘßáŽßá│ßáŽßáĚ 5:33");
    expect(tomorrow.calendar(reference: today), "ßá«ßááßáĚßáşßááßá░ßáó 5:33");
    expect(tueOrDayAfterTomorrow.calendar(reference: today), "ßáĘßáąßáşßáŽßáşßáíßá│ßáŽßáĚ 5:33");
    expect(yesterday.calendar(reference: today), "ßáŽßá┤ßáŽßáşßáíßá│ßáŽßáĚ 5:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today), "ßáĄßáĚßáÁßáóßá│ßáĄßáĚ 5:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßá░ßááßáĚßááßáĘ");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßáĄßá»ßááßáşßááßáĘ");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßáąßá»ßáíßá«ßáÁßáó");
    expect(nextWednesday.calendar(reference: today, omitHours: true), "ßáąßá»ßáíßá«ßáÁßáó");
    expect(nextThursday.calendar(reference: today, omitHours: true), "ßáşßááßá│ßááßá░ßáĄ");
    expect(nextFriday.calendar(reference: today, omitHours: true), "ßá┤ßáúßá»ßá«ßáĄßáĘ");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"),
        "ßáşßááßá│ßááßá░ßáĄ ßáíßá│ßáŽßáĚ, 1970 ßáúßáĘÔÇ»ßáĄ 1ÔÇ»ßá│ßáŽßáşßáíßáĚ ßá░ßááßáĚßáÄßááÔÇ»ßáÂßáóßáĘ 1ßáé 00:00");
  });

  test("mn (Traditional with numbers) localization calendar test", () {
    _setLocalization(MomentLocalizations.mnTMtn());

    // A
    expect(today.calendar(reference: today), "ßáąßáĘßáŽßá│ßáŽßáĚ ßáĽ:ßáôßáô");
    expect(tomorrow.calendar(reference: today), "ßá«ßááßáĚßáşßááßá░ßáó ßáĽ:ßáôßáô");
    expect(tueOrDayAfterTomorrow.calendar(reference: today), "ßáĘßáąßáşßáŽßáşßáíßá│ßáŽßáĚ ßáĽ:ßáôßáô");
    expect(yesterday.calendar(reference: today), "ßáŽßá┤ßáŽßáşßáíßá│ßáŽßáĚ ßáĽ:ßáôßáô");
    expect(friOrdayBeforeYesterday.calendar(reference: today), "ßáĄßáĚßáÁßáóßá│ßáĄßáĚ ßáĽ:ßáôßáô");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßá░ßááßáĚßááßáĘ");
    expect(lastTuesday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßáĄßá»ßááßáşßááßáĘ");
    expect(lastWednesday.calendar(reference: today, omitHours: true),
        "ßáąßáęßáşßáíßáĚßáíßáşßá░ßáíßáĘ ßáąßá»ßáíßá«ßáÁßáó");
    expect(nextWednesday.calendar(reference: today, omitHours: true), "ßáąßá»ßáíßá«ßáÁßáó");
    expect(nextThursday.calendar(reference: today, omitHours: true), "ßáşßááßá│ßááßá░ßáĄ");
    expect(nextFriday.calendar(reference: today, omitHours: true), "ßá┤ßáúßá»ßá«ßáĄßáĘ");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"),
        "ßáşßááßá│ßááßá░ßáĄ ßáíßá│ßáŽßáĚ, ßáĹßáÖßáŚßáÉ ßáúßáĘÔÇ»ßáĄ ßáĹÔÇ»ßá│ßáŽßáşßáíßáĚ ßá░ßááßáĚßáÄßááÔÇ»ßáÂßáóßáĘ ßáĹßáé ßáÉßáÉ:ßáÉßáÉ");
  });

  test("ko localization calendar test", () {
    _setLocalization(MomentLocalizations.ko());

    // A
    expect(today.calendar(reference: today), "ýśĄŰŐś ýśĄýáä 5:33");
    expect(tomorrow.calendar(reference: today), "Űé┤ýŁ╝ ýśĄýáä 5:33");
    expect(tueOrDayAfterTomorrow.calendar(reference: today), "Ű¬ĘŰáł ýśĄýáä 5:33");
    expect(yesterday.calendar(reference: today), "ýľ┤ýáť ýśĄýáä 5:33");
    expect(friOrdayBeforeYesterday.calendar(reference: today), "ŕĚŞýáÇŕ╗ś ýśĄýáä 5:33");
    // B
    expect(lastMonday.calendar(reference: today, omitHours: true), "ýžÇŰéť ýŤöýÜöýŁ╝");
    expect(lastTuesday.calendar(reference: today, omitHours: true), "ýžÇŰéť ÝÖöýÜöýŁ╝");
    expect(lastWednesday.calendar(reference: today, omitHours: true), "ýžÇŰéť ýłśýÜöýŁ╝");
    expect(nextWednesday.calendar(reference: today, omitHours: true), "ýłśýÜöýŁ╝");
    expect(nextThursday.calendar(reference: today, omitHours: true), "Ű¬ęýÜöýŁ╝");
    expect(nextFriday.calendar(reference: today, omitHours: true), "ŕŞłýÜöýŁ╝");
    // C
    expect(epoch.calendar(reference: today, omitHours: true), epoch.format());
    expect(epoch.format("LLLL"), "1970Űůä 1ýŤö 1ýŁ╝ Ű¬ęýÜöýŁ╝ ýśĄýáä 12:00");
  });
}
