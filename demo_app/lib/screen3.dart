import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List images = [];
  int page = 1;

  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=78'),
        headers: {
          'Authorization':
              'RcNZwTypBJTthovFVJDGIPqCa7tAZEY0qmFo5ATLQts90ZTIlRWqcZia'
        }).then((value) {
      Map result = jsonDecode(value.body);

      setState(() {
        images = result['photos'];
      });
      print(images);
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=78&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'RcNZwTypBJTthovFVJDGIPqCa7tAZEY0qmFo5ATLQts90ZTIlRWqcZia'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wallpapers'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: Image.network(
                        images[index]['src']['tiny'],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            )),
            InkWell(
              onTap: () {
                loadmore();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "load more",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
