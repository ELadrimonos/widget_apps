import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars',
      subTitle: 'Mensajes flotante',
      link: '/snackbars',
      icon: Icons.message),
  MenuItem(
      title: 'Animated',
      subTitle: 'Animaciones',
      link: '/animated',
      icon: Icons.abc),
  MenuItem(
      title: 'UI Controls',
      subTitle: 'Controles de la interfaz',
      link: '/ui-controls',
      icon: Icons.settings),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Scroll infinito con refresco de pagina',
      link: '/infinite-scroll',
      icon: Icons.arrow_downward),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'Tutorial de la app',
      link: '/tutorial',
      icon: Icons.help_center),
];
