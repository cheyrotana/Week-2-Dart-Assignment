class BankAccount {
  // TOD0
  double balance;
  // final _accountNumber;
  final String name;

  // double get accountNumber => _accountNumber;

  BankAccount(this.balance, this.name);

  double returnBalance() => balance;

  double withdraw(double amount) {
    if (amount > balance) {
      throw Exception("Insufficient balance for withdrawal.");
    } else {
      balance -= amount;
    }
    return balance;
  }

  double credit(double amount) => balance += amount;
}

class Bank {
  // TOD0
  final String name;
  Map<int, BankAccount> bankAccount = {};

  Bank({required String name}) : name = name;

  BankAccount createAccount(int accountId, String name) {
    if (bankAccount.containsKey(accountId)) {
      throw Exception("This bank account Id already exist.");
    }
    BankAccount newAccount = BankAccount(0.0, name);
    bankAccount[accountId] = newAccount;

    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
