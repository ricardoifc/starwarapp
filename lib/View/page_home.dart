import 'package:starwarapp/Services/remote_service.dart';
import 'package:starwarapp/Util/global_color.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  static String routePage = 'viewSpash';
  const PageHome({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PageHome> {

  int? peopleCount;
  var isLoadedCount = false;

  List? peoples = [];
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getDataCount();
  }
  getDataCount() async{
    peopleCount = await RemoteService().getPeopleCount();
    if (peopleCount != null){
      setState(() {
        isLoadedCount = true;
        getData(peopleCount);
      });
    }
  }

  getData(i) async{
    peoples = await RemoteService().getPeople(i);
    if (peoples != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes',
          style: TextStyle(fontSize: 18),
        ),
        actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      backgroundColor: GlobalColor.colorPrincipal,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: isLoaded,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: peoples?.length,
                      itemBuilder: (context, index) {
                        print(peoples?[index][0]);
                        print(peoples?[index][1]);
                        print(peoples?[index][2].toString());
                        return containerCards(peoples?[index][0], peoples?[index][1], peoples?[index][2]);
                      }
                  ),
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          )),
    );

  }
  Widget containerCards(var nombre, var gen, List filmsC) {
    return Card(
      child: Container(
        padding : const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nombre, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(gen, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 12)),
                ],

              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: filmsC.length,
                        itemBuilder: (context, index) {
                          return Text(filmsC[index].toString(), style: TextStyle(fontSize: 12));
                        }
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 50.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}