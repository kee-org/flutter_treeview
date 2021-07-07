import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_treeview/src/expander_theme_data.dart';
import 'package:flutter_treeview/src/tree_view_theme.dart';

void main() {
  test('fallback', () {
    final TreeViewTheme theme = TreeViewTheme.fallback();
    expect(theme.colorScheme, ColorScheme.light());
    expect(theme.levelPadding, 20);
    expect(theme.iconTheme.isConcrete, true);
    expect(theme.labelStyle, TextStyle());
  });
  test('copyWith', () {
    TreeViewTheme theme = TreeViewTheme.fallback();
    theme = theme.copyWith(
      colorScheme: ColorScheme.dark(),
      levelPadding: 25,
      iconTheme: IconThemeData(),
      expanderTheme: ExpanderThemeData(),
      labelStyle: TextStyle(fontSize: 35),
    );
    expect(theme.colorScheme, ColorScheme.dark());
    expect(theme.levelPadding, 25);
    expect(theme.iconTheme.isConcrete, false);
    // expect(theme.expanderTheme.isConcrete, true);
    expect(theme.labelStyle.fontSize, 35);
  });
  test('merge', () {
    TreeViewTheme theme = TreeViewTheme.fallback();
    TreeViewTheme theme2 = TreeViewTheme(
      colorScheme: ColorScheme.dark(),
      levelPadding: 25,
      iconTheme: IconThemeData(),
      expanderTheme: ExpanderThemeData(),
      labelStyle: TextStyle(fontSize: 35),
    );
    theme = theme.merge(theme2);
    expect(theme.colorScheme, ColorScheme.dark());
    expect(theme.levelPadding, 25);
    expect(theme.iconTheme.isConcrete, false);
    // expect(theme.expanderTheme.isConcrete, true);
    expect(theme.labelStyle.fontSize, 35);
    expect(theme, theme2);
  });
  test('isConcrete', () {
    TreeViewTheme theme = TreeViewTheme.fallback();
    TreeViewTheme theme2 = TreeViewTheme();
    expect(theme == theme2, true);
  });
}
