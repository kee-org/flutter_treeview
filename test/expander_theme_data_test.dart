import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_treeview/src/expander_theme_data.dart';

void main() {
  test('fallback', () {
    final ExpanderThemeData theme = ExpanderThemeData.fallback();
    expect(theme.type, ExpanderType.caret);
    expect(theme.position, ExpanderPosition.start);
    expect(theme.size, 30);
    expect(theme.color, Color(0xFF000000));
  });
  test('copyWith', () {
    ExpanderThemeData theme = ExpanderThemeData.fallback();
    theme = theme.copyWith(
      type: ExpanderType.arrow,
      position: ExpanderPosition.end,
      size: 20,
      color: Color(0xFF990000),
    );
    expect(theme.type, ExpanderType.arrow);
    expect(theme.position, ExpanderPosition.end);
    expect(theme.size, 20);
    expect(theme.color, Color(0xFF990000));
  });
  test('merge', () {
    ExpanderThemeData theme = ExpanderThemeData.fallback();
    ExpanderThemeData theme2 = ExpanderThemeData(
      type: ExpanderType.arrow,
      position: ExpanderPosition.end,
      modifier: ExpanderModifier.circleFilled,
      size: 20,
      animated: false,
      color: Color(0xFF990000),
    );
    theme = theme.merge(theme2);
    expect(theme.type, ExpanderType.arrow);
    expect(theme.position, ExpanderPosition.end);
    expect(theme.modifier, ExpanderModifier.circleFilled);
    expect(theme.size, 20);
    expect(theme.color, Color(0xFF990000));
    expect(theme, theme2);
  });
}
