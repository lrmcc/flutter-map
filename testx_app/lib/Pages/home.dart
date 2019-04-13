import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testx_app/Pages/map.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    this.user
}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Home Page'), //${widget.user.email}'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: navigateToMapPage,
              child: Text('Map'),
            ),
          ],
        )
    );
  }


  void navigateToMapPage() {
    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => MapPage(), fullscreenDialog: true));
  }

}








//
//class GameCount extends StatefulWidget {
//  @override
//  _GameCountState createState() => _GameCountState();
//}
//
//class _GameCountState extends State<GameCount> {
//
//  Widget _buildGameCount(BuildContext context, MockGameinfo gameInfo) {
//    return ListTile(
//      title: Row(
//        children: [
//          Expanded(
//            child: Text(
//              gameInfo.name,
//              style: Theme.of(context).textTheme.headline,
//            ),
//          ),
//          Container(
//            decoration: const BoxDecoration(
//              color: Color(0xffddddff),
//            ),
//            padding: const EdgeInsets.all(10.0),
//            child: Text(
//              gameInfo.place,
//              style: Theme.of(context).textTheme.display1,
//            ),
//          )
//        ],
//      ),
//      onTap: () {
//        print("Game count increase here");
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//        title: Text('Game Count'),
//    ),
//    body: StreamBuilder(
//        stream: Firestore.instance.collection('users').snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) return const Text('Loading...');
//          return ListView.builder(
//            itemExtent: 80.0,
//            itemCount: snapshot.data.documents.length,
//            itemBuilder: (context, index) =>
//                _GameCountState(context, snapshot.data.documents[index]),
//    );
//    }),
//    );
//  }
//}
