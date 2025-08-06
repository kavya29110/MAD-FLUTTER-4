class EmiCalculator {
  static Map<String, double> calculate(double principal, double annualRate, int months) {
    double monthlyRate = annualRate / 12 / 100;
    double emi = (principal * monthlyRate * (pow(1 + monthlyRate, months))) /
                 (pow(1 + monthlyRate, months) - 1);
    double total = emi * months;
    double interest = total - principal;

    return {
      'emi': emi.isFinite ? emi : 0,
      'total': total.isFinite ? total : 0,
      'interest': interest.isFinite ? interest : 0,
    };
  }
}
import 'dart:math';
