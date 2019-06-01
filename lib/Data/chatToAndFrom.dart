/* 
[
    {
        "_id": "5cf2654200abcd33905ae9e1",
        "from": "angadsharma1016@gmail.com",
        "to": "angadsharma1016@gmail.com",
        "chat": "Hello there",
        "time": 1558867131226,
        "__v": 0
    },
    {
        "_id": "5cf26574bba55733cd615a6c",
        "from": "angadsharma1016@gmail.com",
        "to": "angadsharma1016@gmail.com",
        "chat": "Hello there",
        "time": 1558867131226,
        "__v": 0
    }
]
*/


class ChatToAndFromList {
  final List<ChatToAndFrom> photos;

  ChatToAndFromList({
    this.photos,
});

  factory ChatToAndFromList.fromJson(List<dynamic> parsedJson) {

    List<ChatToAndFrom> photos = new List<ChatToAndFrom>();
    photos = parsedJson.map((i)=>ChatToAndFrom.fromJson(i)).toList();

    return new ChatToAndFromList(
      photos: photos
    );
  }
}

class ChatToAndFrom{
  String id;
  String from;
  String to;
  String chat;
  int time;
  int v;

  ChatToAndFrom({
    this.chat,this.from,this.id,this.time,this.to,this.v
}) ;

  factory ChatToAndFrom.fromJson(Map<String, dynamic> json){
    return new ChatToAndFrom(
      id: json["_id"],
      from: json["from"],
      to: json["to"],
      chat: json["chat"],
      time: json["time"],
      v: json["_v"]
    );
  }

}