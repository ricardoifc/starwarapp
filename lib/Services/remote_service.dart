import 'package:starwarapp/Model/People.dart';
import 'package:starwarapp/Model/Film.dart';
import 'package:starwarapp/Model/PeopleList.dart';
import 'package:starwarapp/View/page_home.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<int?> getPeopleCount() async {
    var client1 = http.Client();
    var uri1 = Uri.parse('https://swapi.dev/api/people/?format=json');
    var response1 = await client1.get(uri1);
    if (response1.statusCode == 200) {
      var json1 = response1.body;
      return peopleListFromJson(json1).count;
    }
  }

  Future<List?> getPeople(i) async {
    var valor = [];
    var peliculas = [];
    for (int j = 0; j < i; j++) {
      var numUrl = j + 1;
      var uri2Str = 'https://swapi.dev/api/people/$numUrl/?format=json';
      print('obteniendo url');
      print(uri2Str);
      var client2 = http.Client();
      var uri2 = Uri.parse(uri2Str);
      var response2 = await client2.get(uri2);
       if (response2.statusCode == 200) {
         var json2 = response2.body;
         People peoples = peopleFromJson(json2);
        var filmsCount = peoples.films.length.toInt();
         peliculas.clear();
         for (int k = 0; k < filmsCount; k++){
           var client3 = http.Client();
           var uri3 = Uri.parse(peoples.films[k]);
           var response3 = await client3.get(uri3);
           if (response3.statusCode == 200) {
             var json3 = response3.body;
             var filmsx = filmFromJson(json3).title;
             peliculas.add(filmsx);
           }

         }
         valor.add([peoples.name, peoples.gender, peliculas]);
      }
    }
    return valor;
  }
}
