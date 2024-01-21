enum AccountType {
  none,
  savings,
  main,
  wallet,
  credit_card,
  debit_card,
  cash,
  temporary,
  other,
}

extension AccountTypeExtension on AccountType {
  String get name {
    switch (this) {
      case AccountType.savings:
        return 'Savings';
      case AccountType.main:
        return 'Main';
      case AccountType.wallet:
        return 'Wallet';
      case AccountType.credit_card:
        return 'Credit card';
      case AccountType.debit_card:
        return 'Debit card';
      case AccountType.cash:
        return 'Cash';
      case AccountType.temporary:
        return 'Temporary';
      case AccountType.other:
        return 'Other';
      default:
        return 'None';
    }
  }
}
