import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

class scenario1 extends StatefulWidget {
  const scenario1({Key? key}) : super(key: key);

  @override
  State<scenario1> createState() => _scenario1State();
}

int chatting_count=0;
int part_count=0;
int idx=0;

List<Map<String,String>> scenario=[
  {'뭐해?':"victim"},{"과제하고 있어":"fraud"},
  {"학교 재밌어?":"victim"},{"음, 그냥 그래. ":"fraud"},
  {"좀 이따가 저녁 7시에 친구들이랑 술약속":"fraud"},{"적당히 마시고 집에 일찍 들어가라":"victim"},
  {"알았어~ 내 알아서 할께":"fraud"}, {"내가 애도 아니고~":"fraud"},
  {"다음날 점심에 피해자(엄마)는 기본 프로필의 딸과 똑같은 이름의 새로운 계정으로 카톡을 받는다.":"script"},
  {"엄마 엄ㅁ마ㅏ":"fraud"},{"나 보란데":"fraud"},
  {"핸드폰 고장나서 수리하러 매장왔어":"fraud"},{"내꺼 핸드폰이 먹통이라":"fraud"},
  {"이건 대리점에 있는 임시폰 빌렸어":"fraud"},{"핸드폰이 아예 망가진거야?":"victim"},
  {"아무 것도 안돼?":"victim"},{"웅 ㅜ 전화도 안되고 카톡도 안되고 화면이 안들어와":"fraud"},
  {"어제 술마시고 집 들어가다가 폰 떨궜는데 완전히 망가진거 같아":"fraud"},{"내가 술 적당히 마시라 했지":"victim"},
  {"알았어.":"fraud"},{"엄마(피해자), 사실 부탁할 게 하나 있는데..":"fraud"},
  {"응? 무슨 일이야?":"victim"},{"수리를 보험으로 하려고 하는데 지금 내 폰으로 인증이 불가능해":"fraud"},
  {"그래서 엄마가 대신 인증 해줘야 할 것 같아":"fraud"},{"그래? 내가 뭘 하면 될라나.":"victim"},
  {"엄마 주민등록증 찍어둔거랑 계좌번호, 카드 비밀번호 좀 알려줘 ":"fraud"},
  {"select":"select"},{"전화를 받지 않는다.":"script"},
  {"전화 왜 안받아?":"victim"},{"이거 임시폰이라 전화 안돼":"fraud"},
  {"신분증 사진과(이미지)":"victim"},{"카드 비밀번호는 1121 이야":"victim"},
  {"엄마, 그리고 지금 이 폰으로는 결제를 할 수가 없어가지고":"fraud"},{"https://play.google.com/...  ":"fraud"},
  {"링크 누르고 나오는 어플 한번 깔아봐줘.":"fraud"},{"popup":"popup"},
  {"응? 이게 무슨 링크인데?":"victim"},{"별거 아니야. 진행하면 엄마 쪽으로 인증번호 갈건데 그거만 알려주면 돼.":"fraud"},
  {"select":"select"},{"좀 누르기가 그런데. 요즘 이런 링크 잘못누르면 큰일나는 경우 많던데.":"victim"},
  {"아아 괜찮아. 애초에 링크 보면 play.google 이라고 나와있잖아.":"fraud"},{"아 구글 관련 링크라서 괜찮다는 거야?":"victim"},{"그치 그냥 어플만 다운받으면 돼.":"fraud"},
  {"그래도 좀 꺼림칙해서 그래. 일단 다른 사람한테 좀 물어봐도 될까?":"victim"},{"엄마(피해자), 지금 급해서 그래. 시간 없어.":"fraud"},{"심정은 알겠는데 링크가 안전한지 여부도 중요한 거잖아.":"victim"},
  {"다른 사람한테 물어보든 인터넷에서 찾아보든 하고 다시 연락 주면 안돼?":"victim"},{"그럼 링크 누르지 말고 구글 플레이스토어 들어가서 ‘간편페이’ 이거 검색해봐 ":"fraud"},
  {"직접 검색 해봤는데 리뷰도 있고 멀쩡한 어플처럼 보인다. 따라서 믿고 다운받는다.":"script"},{"피해자가 URL을 클릭하자 바로 앱이 깔리게 되고 인증번호가 뜬다. 피해자는 이 인증번호를 사기범에게 알려주게 된다.":"script"},
  {"응 엄마 고마워. 금방 일 끝내고 돌아올게.":"fraud"},{"응 알겠어.":"victim"},
  {"30분 후":"script"},{"엄마 나 핸드폰 고쳤어 ":"fraud"},
  {"고마워 ":"fraud"},{"그 후 약 2시간 뒤":"script"},
  {"피해자는 이상함을 느끼게 된다. 사기범과 문자를 한 후 핸드폰을 사용하지 않았는데도 핸드폰이 너무 뜨거웠기 때문이다.":"script"},{"엄마가 딸의 진짜 핸드폰으로 카톡을 보낸다":"script"},
  {"딸, 엄마 폰이 좀 이상한거 같아":"victim"},{"응? 그게 무슨 소리야?":"fraud"},
  {"엄마 핸드폰이 너무 뜨거워 ":"victim"},{"? 핸드폰이 왜 뜨거워? 뭐 어플 켜놓은거 아니야?":"fraud"},
  {"아까 딸 핸드폰 수리한다고 연락했을 때 어플 깔고 나서 부터 그러는거 같아 ":"victim"},{"그게 무슨 말이야?":"fraud"},
  {"난 그런 말을 한 적이 없는데? 애초에 핸드폰 고장난 적도 없고 ":"fraud"},{"뭐? 진짜로?":"victim"},
  {"엄마, 설마 그거 보이스피싱 아니야?":"fraud"},{"그런 일 있으면 나한테 연락을 했어야지":"fraud"},
  {"너 핸드폰 고장났다고 해서 ":"victim"},{"혹시 몰라서 전화 했었는데 너 연락 안받던데?":"victim"},
  {"뭐 진짜? 나한테 연락 온거 전혀 없었어 ":"fraud"},{"나한테 사진찍어서 보내보라고 하지 그랬어 ":"fraud"},
  {"빨리 카드 정지하고 경찰에 신고해":"fraud"},{"피해자는 딸에게 전화를 해서 자신이 보이스피싱에 당했음을 깨닫게 된다.":"script"},
  {"피해자는 경찰에 신고를 하고 카드사 고객센터에 연락했더니 이미 그동안 현금서비스로 360만원이 인출되었고 카드로 2500만원이 결제된 상태였다. ":"script"},{"사기범은 확보한 신분증과 금융정보로 피해자 명의의 계좌로 대출을 받아서 대포 통장으로 이체하여 돈을 가로챘던 것이다.":"script"},
  {"그 후 30분 뒤":"script"},{"피해자는 경찰서로 가서 경찰관과 상담을 하던 중 은행에 있던 1300만원이 모르는 사람의 계좌로 이체된 것을 확인하게 된다. ":"script"},
  {"이후 피해자가 거래하던 다른 은행 계좌에서도 돈이 계속 인출되고 있었다.":"script"},{"그 후 약 2시간 뒤":"script"},
  {"picture ":"picture"},
  {"피해자는 2~3시간 만에 2000만원 넘게 사기범에게 갈취당하게 된다.":"warning"},
  {"사기범 계좌에 돈을 이체한 경우에는 즉시 거래 은행에 전화하여 지급정지를 신청하세요.":"warning"},
  {"문자, 메신저를 통해 가족 사칭 금전 요구하는 경우 반드시 확인하세요.":"warning"},
  {"범인들은 카카오톡 프로필을 조작하여 가족인 척 금전을 요구하는 사례가 많으므로, 반드시 유선으로 가족이 보낸 메시지가 맞는지 확인하세요.":"warning"},
  {"주말 연휴 중에도 112로 본인 계좌 일괄지급정지 가능합니다.":"warning"},
  {"popup":"popup"},
];

List part=[27,11,50];
List select_chat=[
  ["딸 핸드폰으로 전화를 건다","임시폰으로 전화를 건다"],
  ["링크를 누른다","링크를 누르지 않는다"],
];
int select=0;
int select_count=0;
StreamController<int> _events = new StreamController<int>.broadcast();
bool finish = false;

class _scenario1State extends State<scenario1> {
  int _counter=30;

  @override
  initState() {
    super.initState();
    _events.add(30);
    _counter=30;
  }
  late Timer _timer;


  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent);
    });

    return MaterialApp(
      home: GestureDetector(
        onTap: (){
          if(chatting_count>86){

          }
          else{
            if(chatting_count==79){
              finish=true;
            }
            setState(() {
              chatting_count++;
              part_count++;
            });
            if(part_count==part[idx]){
              idx++;
              _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                (_counter > 0) ? _counter-- : {
                  _timer.cancel(),
                };
                _events.add(_counter);
              });
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: StreamBuilder<int>(
                        stream: _events.stream,
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          return Container(
                            height: MediaQuery.of(context).size.height/100*60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height/100*10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black
                                  ),
                                  child: Center(
                                    child: Text("00:${snapshot.data.toString()}",style: TextStyle(fontSize: 30,color: Colors.red),),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    setState(() {
                                      chatting_count++;
                                      select=0;
                                      _timer.cancel();
                                      select_count++;
                                    });
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/100*10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white
                                    ),
                                    child: Center(
                                      child: Text("${select_chat[select_count][0]}"),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                    setState(() {
                                      chatting_count++;
                                      select=1;
                                      _timer.cancel();
                                      select_count++;
                                    });
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/100*10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white
                                    ),
                                    child: Center(
                                      child: Text("${select_chat[select_count][1]}"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  });
              part_count=0;
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[700],
            title: Container(
              width: MediaQuery.of(context).size.width/100*20,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width/100*5,
                      child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30))
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/100*15,
                    child: Center(
                      child: Text("김보라",style: TextStyle(color: Colors.white,fontSize: 25)),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: chatting_count,
                    itemBuilder: (BuildContext context,int index){
                      return scenario[index].values.toString() == "(victim)"
                          ?
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height/100*12,
                        width: MediaQuery.of(context).size.width/100*70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/100*60,
                              height: MediaQuery.of(context).size.height/100*12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow[500],
                              ),
                              child: Text("${scenario[index].keys.toString().replaceAll("(", "").replaceAll(")", "")}"),
                            )
                          ],
                        ),
                      )
                          :
                      scenario[index].values.toString() == "(fraud)"
                          ?
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height/100*12,
                        width: MediaQuery.of(context).size.width/100*70,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.account_circle,size: 40,),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/100*60,
                              height: MediaQuery.of(context).size.height/100*12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[500],
                              ),
                              child: Text("${scenario[index].keys.toString().replaceAll("(", "").replaceAll(")", "")}"),
                            )
                          ],
                        ),
                      )
                          :
                      scenario[index].values.toString()=="(select)"
                          ?
                      Container(

                      )
                          :
                      scenario[index].values.toString()=="(popup)"
                          ?
                      AlertDialog(
                        backgroundColor: Colors.white,
                        actions: [
                          Container(
                            height: finish == false ? MediaQuery.of(context).size.height/100*30 : MediaQuery.of(context).size.height/100*40,
                            width: MediaQuery.of(context).size.width/100*60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height/100*5,
                                  child: Text(finish == false ? "주의!" : "구제 절차",style: TextStyle(fontSize: 20,color: Colors.red),),
                                ),
                                Container(
                                  height: finish == false ? MediaQuery.of(context).size.height/100*25 : MediaQuery.of(context).size.height/100*35,
                                  child: Text(finish == false ? "*출처 불명 파일·이메일·문자는 클릭하지 말고 삭제 출처가 불분명한 파일을 다운받거나 의심스러운 인터넷 주소가 포함된 문자를 클릭하면 악성 코드에감염되어 개인정보가 유출될 수 있습니다.악성코드 감염은 금융거래 시 파밍 등을 일으키는 주요원인이므로 이러한 파일이나 문자는 즉시 삭제하시기 바랍니다." : "사기범 계좌에 돈을 이체한 피해자는 경찰서에서 '사건사고 사실확인서'를 발급 받은 후 은행을 방문, '피해구제 신청서','신분증 사본'을 제출하여 사기 이용 계좌의 지급정지를 신청은행은 해당 거래내역 확인 후 지급정지 조치를 하고, 통장 명의인에게 조치 사실 통지채권소멸 공고 은행이 금융감독원에 채권소명절차 개시 공고를 요청하고, 금융감독원은 채권소멸절차 개시를 공고지급정지에 대해 이의가 있는 경우, 통장 명의인은 2개월 안에 은행에 이의 제기할 수 있으며, 민사소송이 개시되거나 이의 제기가 있다면 보이스피싱 피해구제법에 따른 채권소멸절차는 종료금융감독원은 채권소멸일로부터 14일 이내에 피해환급금을 산정하여 통지하고, 은행은 지체없이 피해자에게 지급",style: TextStyle(fontSize: finish == false ? 15 : 13,color: Colors.black),),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                          :
                      scenario[index].values.toString()=="(picture)"
                          ?
                      Container(
                        height: MediaQuery.of(context).size.height/100*50,
                        width: MediaQuery.of(context).size.width/100*60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image.asset("assets/scenario1_picture.png")
                      )
                              :
                      scenario[index].values.toString()=="(warning)"
                          ?
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height/100*15,
                        width: MediaQuery.of(context).size.width/100*80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/100*65,
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Center(child: Text("${scenario[index].keys.toString().replaceAll("(", "").replaceAll(")", "")}",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),)),
                            )
                          ],
                        ),
                      )
                          :
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height/100*15,
                        width: MediaQuery.of(context).size.width/100*80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/100*65,
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Center(child: Text("${scenario[index].keys.toString().replaceAll("(", "").replaceAll(")", "")}",textAlign: TextAlign.center,)),
                            )
                          ],
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey[700],
            child: Container(
              height: MediaQuery.of(context).size.height/100*8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Icon(Icons.add,color: Colors.grey[500],size: 50,),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/100*85,
                    height: MediaQuery.of(context).size.height/100*6,
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(30)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}