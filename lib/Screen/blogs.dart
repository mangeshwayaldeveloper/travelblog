import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/tweet_provider.dart';
import 'blogsList.dart';

class Blogs extends ConsumerStatefulWidget {
  const Blogs({super.key});

  @override
  ConsumerState<Blogs> createState() => _BlogsState();
}

class _BlogsState extends ConsumerState<Blogs> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _tweetController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Blogs"),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Post Blogs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 4,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: _tweetController
              ),
            ),
            TextButton(
                onPressed: () {
                  ref.read(tweetProvider).postTweet(_tweetController.text);
                  Navigator.of(context).pop();
                },
                child: Text("Post Blogs",style: TextStyle(fontSize: 20),)),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1.4,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BlogList()));
                  },
                  child: Text("See Blogs",style: TextStyle(fontSize: 18),)),
            )
          ],
        ),
      ),
    );
  }
}
