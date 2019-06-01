//{
//"docs": [
//{
//"_id": "5ceaa5a1515e386a48b78dfc",
//"from": "angadsharma1016",
//"to": "angad.sharma2017",
//"chat": "Hello there",
//"__v": 0
//},
//]
//}
class ChatData{
  List<Docs> docs;

  ChatData({this.docs});

  factory ChatData.fromJson(Map<String,dynamic> json){
    var list = json['docs'] as List;
    List<Docs> docList = list.map((i) => Docs.fromJson(i)).toList();

    return ChatData(
       docs: docList
    );
  }
}
class Docs{
  String id;
  String from;
  String to;
  String chat;
  int time;
  int v;

  Docs({this.id,this.from,this.to,this.chat,this.v,this.time});

  factory Docs.fromJson(Map<String,dynamic> json){

    return Docs(
        id: json["_id"],
      from: json["from"],
      to: json["to"],
      chat: json["chat"],
      time: json["time"],
      v: json["_v"]
    );
  }

}