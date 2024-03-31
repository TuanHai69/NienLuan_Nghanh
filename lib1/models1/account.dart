class Account {
  String userId;
  String userName;
  String passWord;
  String email;
  String level;
  String phoneNumber;
  String address;

  Account(this.userId, this.userName, this.passWord, this.email, this.level,
      this.address, this.phoneNumber);
  static List<Account> users = [
    Account('user_id1', 'Buyer', 'password', 'email', 'Buyer', 'address',
        'phonenumber'),
    Account('user_id2', 'Author', 'password1', 'email', 'Author', 'address',
        'phonenumber'),
    Account('user_id3', 'Manager', 'password2', 'email', 'Manager', 'address',
        'phonenumber'),
    Account('user_id4', 'Employee', 'password3', 'email', 'Employee', 'address',
        'phonenumber'),
    Account('user_id5', 'Buyer', 'password4', 'email', 'Buyer', 'address',
        'phonenumber'),
  ];
}
