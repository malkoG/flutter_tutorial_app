import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

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
          onPressed: () {
            final firebaseStorageRef = FirebaseStorage.instance
                .ref()
                .child('awesome-post') // directory
                .child('${DateTime.now().millisecondsSinceEpoch}.png');

            final task = firebaseStorageRef.putFile(
                _image, StorageMetadata(contentType: 'image/png'));

            task.onComplete.then((value) {
              var downloadUrl = value.ref.getDownloadURL();

              downloadUrl.then((url) {
               var doc = Firestore.instance.collection('awesome-post').document();
               doc.setData({
                 'id': doc.documentID,
                 'photoUrl': url.toString(),
                 'contents': textEditingController.text,
                 'email': widget.user.email,
                 'displayName': widget.user.displayName,
                 'userPhotoUrl': widget.user.photoUrl
               });
              }).then((onValue) {
                Navigator.pop(context);
              });
            });

          },
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
