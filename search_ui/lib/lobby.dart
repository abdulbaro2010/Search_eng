import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Hub",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.search), onPressed: (){
          showSearch(context: context, delegate: DataSearch());
          }),
        ],
      ), 
    drawer: Drawer(),
    );
  }
}
class DataSearch extends SearchDelegate<String>{
final cities = [
  "Pak Patan",
  "Karachi",
  "Lahore",
  "Islamabad",
  "Quetta",
  "Hyderabad",
  "Sukur",
  "Multan",
  "Gujrat",
  "Khairpur",
  "Kashmir",
  "Sikurdo",
];

// ignore: non_constant_identifier_names
final RecentCities = [
  "Karachi",
  "Lahore",
  "Islamabad",
  "Sakur",
];

  @override
  List<Widget> buildActions(BuildContext context) {
      return[
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = "";
        },),
      ];
      
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container(
        height: 100,
        width: 100,
        child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query,style: TextStyle(color:Colors.white,),),
        ),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty ? RecentCities 
    : cities.where((p) => p.startsWith(query)).toList();
      
      return ListView.builder(itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
      leading: Icon(Icons.location_city),
      title: RichText(
        text: TextSpan(
        text: suggestionList[index].substring(0, query.length),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [
        TextSpan(
          text: suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey),
        ),
        ],
        ),
      ),
      ),

      itemCount: suggestionList.length,
      );
  
  }

}