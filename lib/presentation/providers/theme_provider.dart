import 'package:riverpod/riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);