import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Sollicitudintaciti', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Faucibusjusto', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Faucibusjusto', 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imagePath;

  SlideInfo(this.title, this.caption, this.imagePath);
}

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController;

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController = PageController();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      // Si pusiera 1 en vez de 1.5, el usario deberia llegar al final del todo, lo que tarda mucho
      if (!endReached && page >= slides.length - 1.5) {
        endReached = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides.map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imagePath: slideData.imagePath,
                  )),
            ],
          ),
          !endReached
              ? Positioned(
                  right: 20,
                  top: 20,
                  child: TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('Skip')))
              : const SizedBox(),
          endReached
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(microseconds: 600),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Empezar')),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imagePath;

  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imagePath)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
