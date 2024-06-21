// Task 08

/// Basic User class.
/// Local emails not supported.
class User {
  /// Consider email is read-only for studying purpose
  final String email;

  User(this.email) {
    /// Simple check email format assuming this could not
    /// be a local single-word mail
    bool good = true;
    List part = email.split('@');
    if ( part.length == 2 ) {
      part.addAll( part[1].split('.') );
      if ( part.length != 4 ) good = false;
      for ( var p in part ) {
        if ( p.isEmpty ) good = false;
      }
    } else {
      good = false;
    }
    if ( ! good ) throw ArgumentError.value(email, 'email', 'Incorrect email format.');
  }
}

mixin MailSystem on User {
  String getMailSystem() {
    return super.email.split('@')[1];
  }
}

class AdminUser extends User with MailSystem {
  AdminUser(super.email);
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

class UserManager<T extends User> {
  final List<T> _users = [];

  // UserManager();

  void add(T element) {
    _users.add( element );
  }

  void del(T element) {
    _users.remove(element);
  }

  void listEmails() {
    for (var i in _users) {
      var str = (i is AdminUser) ? i.getMailSystem() : i.email;
      print(str);
    }
  }

  T first() {
    /// This can raise exception if list is empty
    return _users.first;
  }
}