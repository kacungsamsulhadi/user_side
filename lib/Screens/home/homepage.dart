import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<Map<String, dynamic>?> getDataUser() async {
    Uri uri =
        Uri.parse("https://62bba1a66b1401736ce7248a.mockapi.io/api/users/2");
    var response = await http.get(uri);

    print(response.statusCode);
    if (response.statusCode != 200) {
      print('object invalid');
      return null;
    } else {
      print(response.body);
      return json.decode(response.body) as Map<String, dynamic>;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Diagnosa Penyakit Padi',
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: FutureBuilder<Map<String, dynamic>?>(
                        future: getDataUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data!['avatar'],
                                  ),
                                  radius: 40,
                                ),
                                const SizedBox(height: 5),
                                Text("${snapshot.data!['name']}"),
                                const SizedBox(height: 3),
                                Text("${snapshot.data!['email']}"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          child: InkWell(
                            onTap:
                                () {}, // Navigator.pushNamed(context, '/diagnosa');
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Diagnosa',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Daftar Penyakit',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Feedback',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Riwayat',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Bantuan',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: const <Widget>[
                                sb30(),
                                Icon(Icons.assignment, size: 80),
                                sb10(),
                                Text(
                                  'Tentang',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}

class sb10 extends StatelessWidget {
  const sb10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class sb30 extends StatelessWidget {
  const sb30({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 40);
  }
}
/*  */