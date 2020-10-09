import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trial_app/create_page.dart';

class SearchPage extends StatefulWidget {
  final FirebaseUser user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePage(widget.user))
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('awesome-post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var items = snapshot.data.documents ?? [];

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3칸 짜리 열
              childAspectRatio: 1.0, // 가로세로 비율
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0, // 가로 세로 간격
            ),
            itemCount: items.length, // items 의 갯수만큼 렌더링
            itemBuilder: (context, index) {
              return _buildListItem(context, items[index]);
            }
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, document) {
    return Image.network(
      document['photoUrl'],
      fit: BoxFit.cover);
  }
}
