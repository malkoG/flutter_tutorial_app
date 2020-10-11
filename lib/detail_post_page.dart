import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('둘러보기'),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['userPhotoUrl']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(document['email'],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                        ),
                        Text(document['displayName'])
                      ],
                    )
                  ),
                ],
              ),
            ),
            Image.network(document['photoUrl']),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(document['contents'])
            )
          ]
        )
      )
    );
  }
}
