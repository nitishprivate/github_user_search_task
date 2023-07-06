class ApiFactory {
  static String get baseURL => "https://api.github.com";
  static String get getUsers => "$baseURL/users";
  static String searchUser(String name) => "$baseURL/search/users?q=$name";
}
