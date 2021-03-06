import 'package:after_clicks/pervez/utils/hashtags.dart';
import 'package:after_clicks/pervez/hashAndCap.dart';
import 'package:flutter/material.dart';

class selectHash extends StatefulWidget {
  @override
  _selectHashState createState() => _selectHashState();
}

class _selectHashState extends State<selectHash> {

  List<hashtag> hashtags = [
    hashtag(hashTitle: 'Love', hashList: '#love #instagood #like #follow #instagram #photooftheday #photography #beautiful #fashion #picoftheday'),
    hashtag(hashTitle: 'Fashion', hashList: '#fashion #love #style #instagood #like #photography #photooftheday #beautiful #follow #instagram #picoftheday'),
    hashtag(hashTitle: 'Nature', hashList: '#summer #likeforlikes #flowers #model #sky #wildlife #cute #mountains #adventure #followme #india #explore #outdoor'),
    hashtag(hashTitle: 'Travel', hashList: '#traveling #vacation #model #beach #lifestyle #life #india #sunset #beauty #holiday #italy #portrait #europe #traveller #fun'),
    hashtag(hashTitle: 'Selfie', hashList: '#selfies #like #me #love #myself #selfietime #selfieaddict #selfieday #selfiegamestrong #selfiegram #selfienation'),
    hashtag(hashTitle: 'Friends', hashList: '#friendshipgoals #friendsforever #friendsforlife #friendships #friendshipquotes #friendsnotfood #friends4ever'),
    hashtag(hashTitle: 'Music', hashList: '#bestmusic #musicwriter #igmusic #musicismylife #musicindustry #goodmusic #musiclife #musicmaker #singing #songwriter'),
    hashtag(hashTitle: 'Beach', hashList: '#sandbetweenmytoes #oceanview #beachporn #beachsunset #sunsetbeach #beachaddict #sand #ocean #beachlife #sea'),
    hashtag(hashTitle: 'Motivation', hashList: '#determination #instamotivation #motivationmonday #mitivation #lifemotivation #lifestyle #inspirationalquotes #quote #inspire #motivational'),
    hashtag(hashTitle: 'Gym', hashList: '#fitlife #fitgym #gymjunkie #workoutgym #firness #fitnesslife #fitfam #instagym #workout #tbt')

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topP(),
      body: _middle(),
    );
  }

  Widget _topP(){
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      title: Text(
        'Hashtags',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      elevation: 0.0,
    );
  }

  Widget _middle(){
    return ListView.builder(
      itemCount: hashtags.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Card(
            child: ListTile(
              onTap: (){
                hashtagP = hashtagP + hashtags[index].hashList;
                Navigator.pop(context);
              },
              title: Column(
                children: <Widget>[
                  Text(
                    hashtags[index].hashTitle,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    hashtags[index].hashList,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[800]
                    ),
                  )
                ],
              )
            ),
          ),
        );
      },
    );
  }
}
