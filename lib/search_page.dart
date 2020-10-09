import 'package:flutter/material.dart';
import 'package:flutter_trial_app/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePage())
          );
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3칸 짜리 열
        childAspectRatio: 1.0, // 가로세로 비율
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0, // 가로 세로 간격
      ), itemBuilder: (context, index) {
        return _buildListItem(context, index);
      }
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('https://picsum.photos/id/237/200/200', fit: BoxFit.cover);
  }
}
