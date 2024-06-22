import '../models/user_model.dart';

class UserService {
  static List<User> userList = [
    User(name: 'Alice', correo: 'alice@example.com', password: '12345'),
    User(name: 'Bob', correo: 'bob@example.com', password: '54321'),
  ];

  // Obtener todos los usuarios
  static List<User> getUsers() {
    return userList;
  }

  // // Obtener un usuario por su correo (email)
  // static User getUserByEmail(String email) {
  //   return userList.firstWhere((user) => user.correo == email, orElse: () => User(name: '', correo: '', password: ''));
  // }
  
    static void addUser(User user) {
    userList.add(user);
  }

  // // Actualizar un usuario
  // static void updateUser(User updatedUser) {
  //   var index = userList.indexWhere((user) => user.correo == updatedUser.correo);
  //   if (index != -1) {
  //     userList[index] = updatedUser;
  //   }
  // }

  // Eliminar un usuario
  // static void deleteUser(String email) {
  //   userList.removeWhere((user) => user.correo == email);
  // }
}