import 'package:flutter/material.dart';
import 'package:fluttering_flat/utils/colors.dart';
import 'package:fluttering_flat/utils/fonts.dart';
import 'package:fluttering_flat/widgets/footer.dart';
import 'package:fluttering_flat/widgets/header.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot My Pie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _token() async {
    final url = Uri.parse('http://localhost:3000');
    final response = await http.get(url);
    final token = response.body;
    return token;
  }

  Widget body(ConnectionState connectionState, String? data) {
    switch (connectionState) {
      case ConnectionState.done:
        if (data!.isNotEmpty) {
          // Map<String, dynamic> keys = Map.castFrom(jsonDecode(data));
          // debugPrint(keys['access_token']);
          return Text(data,
              style: const TextStyle(
                  fontSize: ThemeFonts.lg, decoration: TextDecoration.none));
        }
        return const Text("No Data");
      case ConnectionState.none:
        return const Text('Connection None');
      case ConnectionState.waiting:
        return const Text('Connection Waiting');
      case ConnectionState.active:
        return const Text('Connection Active');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(ThemeColors.white),
        height: 1024,
        width: 360,
        child: FutureBuilder(
            future: _token(),
            builder:
                (BuildContext builder, AsyncSnapshot<String> asyncSnapshot) =>
                    Column(
                      children: [
                        const Header(),
                        body(asyncSnapshot.connectionState, asyncSnapshot.data),
                        const Footer()
                      ],
                    )));
  }
}
