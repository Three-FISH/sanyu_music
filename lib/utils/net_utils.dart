import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class DioUtil {
  static DioUtil _instance;
  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }

  Dio dio = new Dio();

  DioUtil() {
    dio.options.baseUrl = API_PREFIX;
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;

    getTemporaryDirectory().then((tempDir) {
      CookieJar cj = new PersistCookieJar(dir: tempDir.path);
      dio.interceptors.add(CookieManager(cj));
    });
  }

/*  get(String url, params, Function successCallBack,
      Function errorCallBack) async {
    try {
      Response response =
      await dio.get(url, queryParameters: params).catchError(errorCallBack);
      final data = response.data;
      if (data['code'] == 200) {
        successCallBack();
      } else {
        errorCallBack(data);
      }
    } catch (e) {
      errorCallBack(e);
    }
  }*/
  get(String url, params) async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // print(successCallBack);
    return await dio.get(url+'?cookie=${prefs.getString('cookie')}', queryParameters: params,);
  }
  post(String url, params) async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // print(successCallBack);
    return await dio.post(url, data: {
      ...params,
      'cookie':prefs.getString('cookie')
    });
  }
}
