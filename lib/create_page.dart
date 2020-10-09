import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController(); // 화면이 없어질때 해제해줘야함

  File _image;

  @override
  void dispose() { // 메모리 해제하는 역할.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        )
      ]
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _image == null ? Text("No Image") : Image.file(_image),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
  }

  void _getImage() async {
    PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    File image = File(pickedImage.path);

    setState(() {
      _image = image;
    });
  }
}
