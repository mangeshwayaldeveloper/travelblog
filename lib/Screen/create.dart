import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/Screen/blogsList.dart';

import '../provider/tweet_provider.dart';
import '../provider/user_provider.dart';

class CreateTweet extends ConsumerWidget {
  const CreateTweet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _tweetController = TextEditingController();
    LocalUser currentUser = ref.watch(userProvider);
    print("Printing users ${currentUser.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post a Tweet"),
        centerTitle: true,
      ),
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
                child: Text("Post Blog")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlogList()));
            }, child: Text("See Blogs")

            )
          ],
        ),
      ),
    );
  }
}
