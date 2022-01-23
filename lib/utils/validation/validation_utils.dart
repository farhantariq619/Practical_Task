class ValidationUtils {
  static bool isValid(Object? o) =>
      !((o == null) || (o == false) || (o.toString().isEmpty));
}
