import 'package:flutter/material.dart';

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
  {": NH농협은행 대출상담사 (사기범1) 대리라고 합니다.":"fraud"},{"아 네네. 무슨 일이신가요?":"victim"},
  {"고객님 오늘 자로 대출 신청해주셔서 제가 상담 안내 연락드렸고요.":"fraud"},{"아 죄송한데 지금 급한 일이 있어서 1시간 이따가 전화 주세요.":"victim"},
  {"아 네네 1시간 뒤에 연락드릴게요.":"fraud"},
  {"피해자는 전화를 받은 당시 용무가 있어서 1시간 뒤에 연락해달라고 말한다.":"script"},
  {"1시간 뒤, 전화가 오지 않자 피해자가 전화가 왔던 번호로 다시 전화를 걸게 된다.":"script"},
  {"여보세요? NH농협은행 맞으신가요?":"victim"},{"네 NH농협입니다. 어떤 업무 때문에 그러시나요?":"fraud"},
  {"네 안녕하세요 고객님.":"fraud"},{"네 누구시죠?":"victim"},
];

List part=[20,5];
List select_chat=["선택지1","선택지2","선택지3"];
int select=0;

class _scenario1State extends State<scenario1> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
          children:[
            Scaffold(
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
                          );
                          /*scenario[0][index] == "select" ?
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
                                  child: Text("${select_chat[select]}"),
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
                                  child: Text("${scenario[0][index]}"),
                                )
                              ],
                            ),
                          );*/
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
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width/100*10,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: (){
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
                child: Container(
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width/100*80,
                    height: MediaQuery.of(context).size.height/100*30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(style: TextStyle(fontSize: 30,color: Colors.black), child: Text("이름"),),
                        DefaultTextStyle(style: TextStyle(fontSize: 20,color: Colors.black), child: Text("내용내용내용내용내용내용"),),
                      ],
                    )
                ),
              ),
            ),
          ]
      ),
    );
  }
}


