import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Methode, um die Lambda-Funktion über das API-Gateway aufzurufen
  Future<dynamic> callLambdaFunction() async {
    final url = Uri.parse('https://6gb4c52s5m.execute-api.us-east-1.amazonaws.com/Stufe1/TrainDuelDB/timetable/8000105/241028/11');

    try {
      // Sende eine POST-Anfrage an den API-Gateway-Endpoint
      final response = await http.get(
        url
      );

      // Überprüfe den Statuscode der Antwort
      if (response.statusCode == 200) {
        // Erfolgreiche Antwort, parse das Ergebnis
        return jsonDecode(response.body);
      } else {
        // Fehlerbehandlung für den Fall eines unerwarteten Statuscodes
        throw Exception('Fehler beim Aufruf der Lambda-Funktion: ${response.statusCode}');
      }
    } catch (e) {
      // Fehlerbehandlung für andere Fehler, z.B. Netzwerkfehler
      throw Exception('Fehler: $e');
    }
  }
}