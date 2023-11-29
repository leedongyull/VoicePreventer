import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class scenario1 extends StatefulWidget {
  const scenario1({Key? key}) : super(key: key);

  @override
  State<scenario1> createState() => _scenario1State();
}

int chatting_count=0;
int part_count=0;
int idx=0;

List<Map<String,String>> scenario=[
  {'네 안녕하세요 고객님.':"fraud"},{"네 누구시죠?":"victim"},
  {"NH농협은행 대출상담사 (사기범1) 대리라고 합니다.":"fraud"},{"아 네네. 무슨 일이신가요?":"victim"},
  {"고객님 오늘 자로 대출 신청해주셔서 제가 상담 안내 연락드렸고요.":"fraud"},{"아 죄송한데 지금 급한 일이 있어서 1시간 이따가 전화 주세요.":"victim"},
  {"아 네네 1시간 뒤에 연락드릴게요.":"fraud"},
  {"피해자는 전화를 받은 당시 용무가 있어서 1시간 뒤에 연락해달라고 말한다.":"script"},
  {"1시간 뒤, 전화가 오지 않자 피해자가 전화가 왔던 번호로 다시 전화를 걸게 된다.":"script"},
  {"여보세요? NH농협은행 맞으신가요?":"victim"},{"네 NH농협입니다. 어떤 업무 때문에 그러시나요?":"fraud"},
  {"실직자 대출 때문에 연락드렸어요.":"victim"},{"문자 왔었거든요. 체불임금 대출이요.":"victim"},
  {"아 대출 때문이시군요.":"fraud"},{"네네.":"victim"},
  {"그러면 담당자분이 따로 계신거 아니세요? 통화 안 해보셨나요?":"fraud"},{"스팸이거나 피싱인 줄 알고 확인 전화 드린겁니다.":"victim"},
  {"아 네네.":"fraud"},{"근데 피싱 같은건 아니죠?":"victim"},
  {"그런거 아니시고 저희 기획재정부에서 시행하는 정부 지원 상품이에요.":"fraud"},{"이번에 주최 기관으로 저희 농협 본점이 선정되서 진행 중이신 대출이니까 담당자분과 정상적으로 상담 한번 해보시는걸 추천드려요.":"fraud"},
  {"그리고 진행 의사 있으시면 담당자분께 말씀하셔가지고 정상적으로 진행하시면 됩니다.":"fraud"},{"그래요? 근데 아까 전화가 왔었는데 1시간 뒤에 전화 해달라고 했었거든요.":"victim"},
  {"아 그러시면 담당자분께 전화드리라고 전달해드릴까요?":"fraud"},{"네 부탁드려요.":"victim"},
  {"네 알겠습니다 감사합니다.":"fraud"},{"이후 담당자를 사칭하는 사기범1에게 다시 전화가 걸려온다.":"script"},
];

List part=[20,5];
List select_chat=["선택지1","선택지2","선택지3"];
int select=0;

class _scenario1State extends State<scenario1> {

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent);
    });

    return MaterialApp(
      home: GestureDetector(
        onTap: (){
          setState(() {
            chatting_count++;
            part_count++;
          });
          if(part_count==part[idx]){
            idx++;
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    actions: [
                      Container(
                        height: MediaQuery.of(context).size.height/100*60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                                setState(() {
                                  chatting_count++;
                                  select=0;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/100*10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: Center(
                                  child: Text("선택지1"),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                                setState(() {
                                  chatting_count++;
                                  select=1;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/100*10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: Center(
                                  child: Text("선택지2"),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                                setState(() {
                                  chatting_count++;
                                  select=2;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/100*10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: Center(
                                  child: Text("선택지3"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                });
            part_count=0;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[700],
            title: Container(
              width: MediaQuery.of(context).size.width/100*15,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width/100*5,
                      child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30))
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/100*10,
                    child: Center(
                      child: Text("아들",style: TextStyle(color: Colors.white,fontSize: 25)),
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
                              child: Text("${scenario[index].keys}"),
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
                              child: Text("${scenario[index].keys}"),
                            )
                          ],
                        ),
                      )
                          :
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height/100*12,
                        width: MediaQuery.of(context).size.width/100*70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/100*60,
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Text("${scenario[index].keys}",textAlign: TextAlign.center,),
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