final class BankCard {
  const BankCard({required this.cardNumber, required this.cardCvc, required this.cardDate});
  final String cardNumber;
  final String cardDate;
  final String cardCvc;

  Map<String, String> toJson() => {
    'cardNumber': cardNumber,
    'cardDate': cardDate,
    'cardCvc': cardCvc
  };
}