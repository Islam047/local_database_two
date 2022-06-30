import 'package:hive/hive.dart';
import 'package:local_database/model/user_model.dart';

class DBService {
  var box = Hive.box('login_two');

  void storeUser(User user) async {
    box.put('user', user.toJson());
  }

  User getUser() {
    var name = User.fromJson(box.get('user'));
    return name;
  }

  void removeUser() async {
    box.delete('user');
  }
}
