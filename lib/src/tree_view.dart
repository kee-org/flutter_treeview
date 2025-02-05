import 'package:flutter/material.dart';

import 'tree_view_controller.dart';
import 'tree_view_theme.dart';
import 'tree_node.dart';
import 'models/node.dart';

/// Defines the [TreeView] widget.
///
/// This is the main widget for the package. It requires a controller
/// and allows you to specify other optional properties that manages
/// the appearance and handle events.
///
/// ```dart
/// TreeView(
///   controller: _treeViewController,
///   allowParentSelect: false,
///   supportParentDoubleTap: false,
///   onExpansionChanged: _expandNodeHandler,
///   onNodeTap: (key) {
///     setState(() {
///       _treeViewController = _treeViewController.copyWith(selectedKey: key);
///     });
///   },
///   theme: treeViewTheme
/// ),
/// ```
class TreeView<T> extends InheritedWidget {
  /// The controller for the [TreeView]. It manages the data and selected key.
  final TreeViewController<T> controller;

  /// The tap handler for a node. Passes the node key.
  final Function(String)? onNodeTap;

  /// Custom builder for nodes. Parameters are the build context and tree node.
  final Widget Function(BuildContext, Node<T>)? nodeBuilder;

  /// The double tap handler for a node. Passes the node key.
  final Function(String)? onNodeDoubleTap;

  /// The long press handler for a node. Passes the node key.
  final Function(String)? onNodeLongPress;

  /// The expand/collapse handler for a node. Passes the node key and the
  /// expansion state.
  final Function(String, bool)? onExpansionChanged;

  /// The theme for [TreeView].
  final TreeViewTheme theme;

  /// Determines whether the user can select a parent node. If false,
  /// tapping the parent will expand or collapse the node. If true, the node
  /// will be selected and the use has to use the expander to expand or
  /// collapse the node.
  final bool allowParentSelect;

  /// How the [TreeView] should respond to user input.
  final ScrollPhysics? physics;

  /// Whether the extent of the [TreeView] should be determined by the contents
  /// being viewed.
  ///
  /// Defaults to false.
  final bool shrinkWrap;

  /// Whether the [TreeView] is the primary scroll widget associated with the
  /// parent PrimaryScrollController..
  ///
  /// Defaults to true.
  final bool primary;

  /// Determines whether the parent node can receive a double tap. This is
  /// useful if [allowParentSelect] is true. This allows the user to double tap
  /// the parent node to expand or collapse the parent when [allowParentSelect]
  /// is true.
  /// ___IMPORTANT___
  /// _When true, the tap handler is delayed. This is because the double tap
  /// action requires a short delay to determine whether the user is attempting
  /// a single or double tap._
  final bool supportParentDoubleTap;

  TreeView({
    Key? key,
    required this.controller,
    this.onNodeTap,
    this.onNodeDoubleTap,
    this.onNodeLongPress,
    this.physics,
    this.onExpansionChanged,
    this.allowParentSelect = false,
    this.supportParentDoubleTap = false,
    this.shrinkWrap = false,
    this.primary = true,
    this.nodeBuilder,
    TreeViewTheme? theme,
  })  : this.theme = theme ?? const TreeViewTheme(),
        super(
          key: key,
          child: _TreeViewData<T>(
            controller,
            shrinkWrap: shrinkWrap,
            primary: primary,
            physics: physics,
          ),
        );

  static TreeView<T>? of<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: TreeView);

  @override
  bool updateShouldNotify(TreeView oldWidget) {
    return oldWidget.controller.children != this.controller.children ||
        oldWidget.onNodeTap != this.onNodeTap ||
        oldWidget.onNodeLongPress != this.onNodeLongPress ||
        oldWidget.onExpansionChanged != this.onExpansionChanged ||
        oldWidget.theme != this.theme ||
        oldWidget.supportParentDoubleTap != this.supportParentDoubleTap ||
        oldWidget.allowParentSelect != this.allowParentSelect;
  }
}

class _TreeViewData<T> extends StatelessWidget {
  final TreeViewController<T> _controller;
  final bool? shrinkWrap;
  final bool? primary;
  final ScrollPhysics? physics;

  const _TreeViewData(this._controller,
      {this.shrinkWrap, this.primary, this.physics});

  @override
  Widget build(BuildContext context) {
    ThemeData _parentTheme = Theme.of(context);
    return Theme(
      data: _parentTheme.copyWith(hoverColor: Colors.grey.shade100),
      child: ListView(
        shrinkWrap: shrinkWrap!,
        primary: primary,
        physics: physics,
        padding: EdgeInsets.zero,
        children: _controller.children.map<TreeNode<T>>((Node<T> node) {
          return TreeNode<T>(node: node);
        }).toList(),
      ),
    );
  }
}
