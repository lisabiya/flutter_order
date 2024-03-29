import 'package:dio/dio.dart';
import 'package:flutter_order/bean/GanHo.dart';
import 'package:flutter_order/bean/Wan.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://www.sojson.com/open/api/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

//typedef OnHttpCallBack<T>(T message);

typedef OnHttpCallBack<T> = Function(T message);

getHappy(OnHttpCallBack<Ganho> onMessage, int page) async {
  var dio = Dio();
  try {
    Response response = await dio.get("http://gank.io/api/data/福利/5/$page");
    bool state = response.data['error'];

    if (!state) {
      Ganho ganHo = Ganho.fromJson(response.data);
      onMessage(ganHo);
    }
  } catch (e) {
    print("response" + e);
  }
}

Future<Wan> getArticle(int page) async {
  var dio = Dio();
  try {
    Response response =
        await dio.get("https://wanandroid.com/article/listproject/$page/json");
    int errorCode = response.data['errorCode'];
    print("errcode=$errorCode");
    if (errorCode == 0) {
      Wan ganHo = Wan.fromJson(response.data);
      print(ganHo.data.curPage);
      return Future.value(ganHo);
    } else {
      return Future.error(response.data['errorMessage']);
    }
  } catch (e) {
    return Future.error(e.toString());
  }
}
