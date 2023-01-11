import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somsomhouse/models/apartname_list_model.dart';
import 'package:somsomhouse/models/apartname_predict_model.dart';
import 'package:somsomhouse/models/dongname_model.dart';
import 'package:somsomhouse/services/dbservices.dart';
import 'package:somsomhouse/views/charter_value_prediction.dart';

class Yeongdeungpo extends StatefulWidget {
  const Yeongdeungpo({super.key});

  @override
  State<Yeongdeungpo> createState() => _YeongdeungpoState();
}

class _YeongdeungpoState extends State<Yeongdeungpo> {
  late List<Widget> widgetList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widgetList = [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: selectApartName(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('영등포구 지도'),
          ),
          body: Center(
            child: InkWell(
              splashColor: Colors.orange,
              onTapDown: (TapDownDetails details) {
                _handleTapDown(context, details.localPosition.dx,
                    details.localPosition.dy);
              },
              child: Image.asset(
                'images/영등포구.png',
                height: 350,
                width: 300,
              ),
            ),
          ),
        );
      },
    );
  }

//-----function-------
  _handleTapDown(BuildContext context, var dx, var dy) async {
    if ((dx > 70 && dx < 107 && dy > 205 && dy < 230) ||
        (dx > 107 && dx < 148 && dy > 197 && dy < 220)) {
      DongModel.dongName = '도림동';
      widgetList = await selectApartName();
      showPicker(context, widgetList);
    }
  }

  /// 아래쪽 스낵바에 선택한 동의 아파트 이름을 가져오기 위해서 DB 서비스와 연결하는 함수
  /// 만든 날짜 : 2023.1.10
  /// 만든이 : 노현석
  Future<List<Widget>> selectApartName() async {
    DBServices dbServices = DBServices();
    ApartNameListModel apartNameListModel =
        await dbServices.callapartName(DongModel.dongName);

    List<Widget> widgetList = [];

    for (var apartNameModel in apartNameListModel.apartNameListModel) {
      widgetList.add(Text(apartNameModel.apartName));
    }

    return widgetList;
  }

  //모달팝업창을 뜨게 하고 버튼을 누르면 다음 페이지로 이동한다.
  showPicker(BuildContext context, List<Widget> widgetList) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 50,
                      scrollController: FixedExtentScrollController(
                        initialItem: 1,
                      ),
                      children: widgetList,
                      onSelectedItemChanged: (value) {
                        ApartNamePredict.apartNamePredict =
                            widgetList[value].toString();
                        //CupertinoPicker에서 선택한 아파트 이름을 static에 저장해준다.
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      print(ApartNamePredict.apartNamePredict);
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const CharterPrediction()))); // 테스트니까 나중에 꼭 바꾸기
                    },
                  ),
                ],
              ),
            ));
  }
}//end
