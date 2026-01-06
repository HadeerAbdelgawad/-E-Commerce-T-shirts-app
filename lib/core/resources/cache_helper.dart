

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
static final storage= FlutterSecureStorage(
  aOptions:AndroidOptions(
    encryptedSharedPreferences: true)); //andriodOption


  //getToken
  static Future<String>getToken()async{
    return await storage.read(key:'token')??"";
  }

  //saveToken
  static Future<void>saveToken(String token)async{
    return await storage.write(key:'token',value:token);
  }

  //deleteToken
  static Future<void>deleteToken()async{
    return await storage.delete(key:'token');
  }


}