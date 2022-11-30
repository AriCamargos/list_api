import 'package:flutter/material.dart';
import 'package:pokemon_list/services/remote_service.dart';

import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  posts![index].title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  posts![index].body ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  posts![index].title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
