
import 'package:shared_preferences/shared_preferences.dart';

// Creating a class to manage Shared Preferences operations
class SharedPref {

  // Static keys used to store and retrieve values from SharedPreferences
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";

  // Method to save user ID in SharedPreferences
  // It returns true if data is saved successfully
  Future<bool> saveUserId(String getUserId) async {
    // Getting the instance of SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Saving the user ID using the key
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);
  }

  

  // Method to retrieve user ID from SharedPreferences
  // Returns null if no value is found
  Future<String?> getUserId() async {
    // Getting the SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Retrieving the stored user ID
    return prefs.getString(userIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImageKey);
  }
}
