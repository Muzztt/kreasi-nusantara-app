// extension DynamicExtension on dynamic {
//   DateTime get date {
//     return DateTime.parse("$this");
//   }
// }

extension StringDynamicExtension on String {
  DateTime? get date {
    return DateTime.tryParse(this);
  }
}
