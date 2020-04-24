import 'package:package_info/package_info.dart';
import 'package:scoped_model/scoped_model.dart';

mixin packageInfoModel on Model {
  static String _appName;
  static String _packageName;
  static String _version;
  static String _buildNumber;

  String get appName => _appName;

  String get packageName => _packageName;

  String get version => _version;

  String get buildNumber => _buildNumber;

  Future<void> initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
  }
}
