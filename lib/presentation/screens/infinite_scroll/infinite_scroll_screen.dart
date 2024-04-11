import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imageIDs = [1, 2, 3, 4, 5];

  final scrollController = ScrollController();

  bool isLoading = false;
  bool isMounted = true;

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }


  void addFiveImages() {
    final lastID = imageIDs.last;
    imageIDs.addAll([1, 2, 3, 4, 5].map((e) => lastID + e));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        addFiveImages();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: imageIDs.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imageIDs[index]}/500/300'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.pop,
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
