import 'package:flutter/material.dart';
import 'package:voicepreventer/chatting.dart';
import 'package:voicepreventer/scenario1.dart';

class chapter_list extends StatefulWidget {
  const chapter_list({Key? key}) : super(key: key);

  @override
  State<chapter_list> createState() => _chapter_listState();
}

class _chapter_listState extends State<chapter_list> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/100*85,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/100*20,
                height: MediaQuery.of(context).size.height/100*85,
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/100*25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.person,color: Colors.grey[600],size: 30,),
                          Icon(Icons.chat_bubble,color: Colors.grey[600],size: 30),
                          Icon(Icons.more_horiz,color: Colors.grey[600],size: 30)
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/100*25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.sentiment_satisfied_alt,color: Colors.grey[600],size: 30),
                          Icon(Icons.notifications_off_outlined,color: Colors.grey[600],size: 30),
                          Icon(Icons.settings,color: Colors.grey[600],size: 30)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/100*80,
                height: MediaQuery.of(context).size.height/100*85,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/100*5,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/100*60,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/100*20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.horizontal_rule,color: Colors.grey),
                                Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                Icon(Icons.close,color: Colors.grey,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/100*80,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/100*80,
                            height: MediaQuery.of(context).size.height/100*8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width/100*20,
                                  child: Row(
                                    children: [
                                      DefaultTextStyle(style: TextStyle(color: Colors.black,fontSize: 20),child: Text("채팅"),),
                                      Icon(Icons.arrow_drop_down_sharp,size: 30,)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/100*30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.search_rounded,color: Colors.black,size: 25,),
                                      Icon(Icons.question_answer_rounded,color: Colors.black,size: 25,),
                                      Icon(Icons.add_comment_outlined,color: Colors.black,size: 25,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const scenario1()));
                            },
                            child:Container(
                              margin: EdgeInsets.only(left: 20),
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle_rounded,size: 50,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chapter1"),
                                      Text("핸드폰 수리")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const chatting()));
                            },
                            child:Container(
                              margin: EdgeInsets.only(left: 20),
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle_rounded,size: 50,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chapter2"),
                                      Text("핸드폰 수리")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const chatting()));
                            },
                            child:Container(
                              margin: EdgeInsets.only(left: 20),
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle_rounded,size: 50,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chapter3"),
                                      Text("핸드폰 수리")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const chatting()));
                            },
                            child:Container(
                              margin: EdgeInsets.only(left: 20),
                              height: MediaQuery.of(context).size.height/100*12,
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle_rounded,size: 50,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chapter4"),
                                      Text("핸드폰 수리")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/100*15,
          color: Colors.black,
        )
      ],
    );
  }
}
