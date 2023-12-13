import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/tweet_provider.dart';

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
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 4,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  controller: _tweetController,
                  maxLength: 280,
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(tweetProvider).postTweet(_tweetController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Post Tweet"))
            ],
          )),
    );
  }
}
