import 'package:get/get.dart';
import 'package:re_exam/Screen/model/covid_model.dart';
import 'package:re_exam/Screen/model/model.dart';
import 'package:re_exam/utils/Api_helper.dart';
import 'package:re_exam/utils/Database_helper.dart';

class Covid_controller extends GetxController {

  List<Covid19> list = [];
  List<Covid19> list1 = [];
  List<Covid19> dataList = [];
  List<Covid19> SearchList = [];
  RxList booklist =<Bookmark> [].obs;

  Future<List> apiCovid() async {
    dataList = await Api_helper.api_helper.getApi();
    return dataList;
  }

  Future<void> readData()
  async {
    booklist.value = await DB_helper.db_helper.readDB();
  }
  void searchfiled(String search) {
    SearchList.clear();
    if (search.isEmpty) {
      list1 = List.from(list);
    }
    else
    {
      for (var c1 in list)
      {
        if (c1.country!.toLowerCase().contains(search.toLowerCase()))
        {
          SearchList.add(c1);
        }
        list1 = List.from(SearchList);
      }
    }
    update();
  }
}