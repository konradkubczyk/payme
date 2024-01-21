enum AccountType {
  none,
  savings,
  main,
  wallet,
  credit,
  debit,
  cash,
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
      case AccountType.credit:
        return 'Credit';
      case AccountType.debit:
        return 'Debit';
      case AccountType.cash:
        return 'Cash';
      case AccountType.other:
        return 'Other';
      default:
        return 'None';
    }
  }
}
