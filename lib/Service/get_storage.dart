import 'package:get_storage/get_storage.dart';

class DataStorage {
  static final GetStorage _eCommerceUserData = GetStorage();

  static writeData(String key, dynamic value) => _eCommerceUserData.write(key, value);

  static readData(String key) => _eCommerceUserData.read(key);

  static removeData(String key) => _eCommerceUserData.remove(key);

  static writeIfNull(String key, dynamic value) =>
      _eCommerceUserData.writeIfNull(key, value);

  static keyHasData(String key) => _eCommerceUserData.hasData(key);

  static getValues() => _eCommerceUserData.getValues();
  static eraseData() => _eCommerceUserData.erase();

  static writeDataInMemory(String key, dynamic value) =>
      _eCommerceUserData.writeInMemory(key, value);
}
