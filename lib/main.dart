import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Constructor Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('member list'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  MemberCard.normal(
                      name: 'test1',
                      imgFileName: 'pexels-daria-nekipelova-9697662.jpg'),
                  MemberCard.disabled(
                      name: 'test2',
                      imgFileName: 'pexels-nina-kuka-10161241.jpg'),
                  MemberCard.normal(
                      name: 'test3',
                      imgFileName: 'pexels-vlada-karpovich-9968467.jpg'),
                  MemberCard.normal(
                      name: 'test4',
                      imgFileName: 'pexels-oksana-kuz-10202772.jpg'),
                ],
              ),
            ),
          )),
    );
  }
}

class MemberCard extends StatefulWidget {
  final String name; //名前
  final String imgFileName; //アバター画像
  final Color backgroundColor; //背景色
  final statusIcon; //メンバーのステータス

  ///下記のコンストラクタはリダイレクトコンストラクタと言って、
  ///例えばMembersCard.normalのコンストラクタが呼び出されると、
  ///そのパラメーターがMembersCard._init(this._init)に伝搬されて、初期化される
  ///その初期化したのを元にWidgetを作成する事が出来る。

  // 通常のユーザー
  MemberCard.normal({name, imgFileName})
      : this._init(
            name: name,
            imgFileName: imgFileName,
            statusIcon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ));

  // 退会したユーザー
  MemberCard.disabled({name, imgFileName})
      : this._init(
            name: name,
            imgFileName: imgFileName,
            backgroundColor: Colors.black12,
            statusIcon: Text('check out'));

  MemberCard._init({
    Key? key,
    this.name = '',
    this.imgFileName = '',
    this.backgroundColor = Colors.white,
    this.statusIcon,
  }) : super(key: key);

  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * 0.9,
      height: _size.height * 0.2,
      child: Card(
        color: widget.backgroundColor,
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: ListTile(
            leading: Container(
              width: _size.width * 0.3,
              height: _size.height * 0.3,
              child: Image.asset(
                'lib/images/${widget.imgFileName}',
                width: 50,
                height: 50,
              ),
            ),
            title: Text(widget.name),
            trailing: widget.statusIcon,
          ),
        ),
      ),
    );
  }
}
