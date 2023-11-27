import 'package:flutter/material.dart';

class chatting extends StatefulWidget {
  const chatting({Key? key}) : super(key: key);

  @override
  State<chatting> createState() => _chattingState();
}

int chatting_count=0;
int part_count=0;
int idx=0;


List scenario= [
  ["part1.text1","part1.text2","part1.text3","part1.text4","select","part2.text1","part2.text2","part2.text3","part2.text4","part2.text5",],
];

List part=[4,5];
List select_chat=["선택지1","선택지2","선택지3"];
int select=0;

class _chattingState extends State<chatting> {

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
                        return scenario[0][index] == "select" ?
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
                        ) ;
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


