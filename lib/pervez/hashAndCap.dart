import 'package:after_clicks/pervez/selectHashtags.dart';
import 'package:flutter/material.dart';
import 'package:after_clicks/pervez/schedule.dart';
import 'dart:io';

String hashtagP = '';

class hashAndCap extends StatefulWidget {

  final File _image;
  final String _imagePath; //
  hashAndCap(this._image, this._imagePath);

  @override
  _hashAndCapState createState() => _hashAndCapState(_image, _imagePath);
}

class _hashAndCapState extends State<hashAndCap> {

  File imageP;
  String _imagePathP; //
  _hashAndCapState(this.imageP, this._imagePathP);

  DateTime dateTimeP;
  TimeOfDay timeOfDayP;
  String captionP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topP(),
      body: _middle(),
      bottomNavigationBar: _bottomP(),
    );
  }

  Widget _topP(){
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      title: Text(
        'New Post',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      elevation: 0.0,
    );
  }

  Widget _middle(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.white,
            backgroundImage: Image.file(imageP).image,
          ),
          SizedBox(height: 10.0),
          TextField(
            onChanged: (enteredCaption){
              captionP = enteredCaption;
            },
            decoration: InputDecoration(
                labelText: 'Write a caption...'
            ),
          ),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.blueGrey[100])
              ),
            ),
            child: Center(
                child: TextButton(
                  child: Text(
                    'Add Hashtags',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => selectHash()), ).then((value) => setState(() {}));

                  },
                )
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.blueGrey[100])
              ),
          ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Text(
                hashtagP,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomP(){
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.blueGrey[100])
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton(
              child: Text(
                'Schedule',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),
              ),
              onPressed: (){
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030)
                ).then((date){
                  setState(() {
                    dateTimeP = date;
                    if(dateTimeP != null && timeOfDayP != null){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => scheduleP(captionP, hashtagP,dateTimeP,timeOfDayP,imageP,_imagePathP)));
                    }
                  });
                });
                showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now()
                ).then((time){
                  setState(() {
                    timeOfDayP = time;
                  });
                });
              }
          ),
        ],
      ),
    );
  }
}
