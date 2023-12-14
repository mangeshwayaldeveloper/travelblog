import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/Models/tweet.dart';
import 'package:travel_booking/provider/tweet_provider.dart';

import '../provider/user_provider.dart';

class BlogList extends ConsumerStatefulWidget {
  const BlogList({super.key});

  @override
  ConsumerState<BlogList> createState() => _BlogListState();
}

class _BlogListState extends ConsumerState<BlogList> {
  @override
  Widget build(BuildContext context) {
    LocalUser currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Text("Blogs"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(ref.watch(userProvider).user.profilePic),
              ),
            ),
          );
        }),
      ),
      body: ref.watch(feedProvider).when(
        data: (List<Tweet> tweets) {
          if (tweets.isNotEmpty) {
            return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                Tweet tweet = tweets[index];
                return ListTile(
                  title: Text(tweet.name),
                  subtitle: Text(tweet.tweet),
                  // Add more widgets based on your needs
                );
              },
            );
          } else {
            return Center(child: Text("No blogs available."));
          }
        },
        error: (error, stackTrace) {
          return Center(child: Text("Error: $error"));
        },
        loading: () {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ) as Widget?, // Add the cast to Widget?
    );
  }
}
