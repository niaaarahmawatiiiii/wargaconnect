// Class untuk mengelola autentikasi Admin.
class AdminAuth {
  // Username dan password Admin RT.
  static const String usernameAdmin = 'admin';
  static const String passwordAdmin = 'konekwargaku';

  // Menyimpan status login Admin.
  // false berarti belum login.
  // true berarti sudah login.
  static bool isLoggedIn = false;

  // Fungsi untuk memeriksa username dan password.
  static bool login({
    required String username,
    required String password,
  }) {
    // Memeriksa kesesuaian username dan password.
    if (username == usernameAdmin &&
        password == passwordAdmin) {
      // Mengubah status menjadi sudah login.
      isLoggedIn = true;

      return true;
    }

    // Login gagal.
    return false;
  }

  // Fungsi untuk logout Admin.
  static void logout() {
    // Mengubah status menjadi belum login.
    isLoggedIn = false;
  }
}
