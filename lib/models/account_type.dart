// This enum describes the types of accounts a user can create.
enum AccountType {
  none,           // No specific account type
  savings,        // Savings account
  main,           // Main account
  wallet,         // Wallet account
  credit_card,    // Credit card account
  debit_card,     // Debit card account
  cash,           // Cash account
  temporary,      // Temporary account
  other,          // Other account type
}

/// Extension on the [AccountType] enum to provide a human-readable name for each account type.
extension AccountTypeExtension on AccountType {
  /// Returns the human-readable name of the account type.
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