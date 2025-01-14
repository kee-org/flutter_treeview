import 'dart:convert' show jsonDecode, jsonEncode;

import 'models/node.dart';

/// Defines the insertion mode adding a new [Node] to the [TreeView].
enum InsertMode {
  prepend,
  append,
  insert,
}

/// Defines the controller needed to display the [TreeView].
///
/// Used by [TreeView] to display the nodes and selected node.
///
/// This class also defines methods used to manipulate data in
/// the [TreeView]. The methods ([addNode], [updateNode],
/// and [deleteNode]) are non-mutilating, meaning they will not
/// modify the tree but instead they will return a mutilated
/// copy of the data. You can then use your own logic to appropriately
/// update the [TreeView]. e.g.
///
/// ```dart
/// TreeViewController controller = TreeViewController(children: nodes);
/// Node node = controller.getNode('unique_key')!;
/// Node updatedNode = node.copyWith(
///   key: 'another_unique_key',
///   label: 'Another Node',
/// );
/// List<Node> newChildren = controller.updateNode(node.key, updatedNode);
/// controller = TreeViewController(children: newChildren);
/// ```
class TreeViewController<T> {
  /// The data for the [TreeView].
  final List<Node<T>> children;

  /// The key of the select node in the [TreeView].
  final String? selectedKey;

  TreeViewController({
    this.children = const [],
    this.selectedKey,
  });

  /// Creates a copy of this controller but with the given fields
  /// replaced with the new values.
  TreeViewController<T> copyWith(
      {List<Node<T>>? children, String? selectedKey}) {
    return TreeViewController<T>(
      children: children ?? this.children,
      selectedKey: selectedKey ?? this.selectedKey,
    );
  }

  /// Loads this controller with data from a JSON String
  /// This method expects the user to properly update the state
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.loadJSON(json: jsonString);
  /// });
  /// ```
  TreeViewController loadJSON({String json = '[]'}) {
    List jsonList = jsonDecode(json);
    List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(jsonList);
    return loadMap(list: list);
  }

  /// Loads this controller with data from a Map.
  /// This method expects the user to properly update the state
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.loadMap(map: dataMap);
  /// });
  /// ```
  TreeViewController loadMap({List<Map<String, dynamic>> list = const []}) {
    List<Node<T>> treeData =
        list.map((Map<String, dynamic> item) => Node<T>.fromMap(item)).toList();
    return TreeViewController(
      children: treeData,
      selectedKey: this.selectedKey,
    );
  }

  /// Adds a new node to an existing node identified by specified key.
  /// It returns a new controller with the new node added. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.addNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withAddNode(key, newNode);
  /// });
  /// ```
  TreeViewController withAddNode(
    String key,
    Node<T> newNode, {
    Node<T>? parent,
    int? index,
    InsertMode mode = InsertMode.append,
  }) {
    List<Node<T>> _data =
        addNode(key, newNode, parent: parent, mode: mode, index: index);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Replaces an existing node identified by specified key with a new node.
  /// It returns a new controller with the updated node replaced. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.updateNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withUpdateNode(key, newNode);
  /// });
  /// ```
  TreeViewController<T> withUpdateNode(String key, Node<T> newNode,
      {Node<T>? parent}) {
    List<Node<T>> _data = updateNode(key, newNode, parent: parent);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Removes an existing node identified by specified key.
  /// It returns a new controller with the node removed. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.deleteNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withDeleteNode(key);
  /// });
  /// ```
  TreeViewController<T> withDeleteNode(String key, {Node<T>? parent}) {
    List<Node<T>> _data = deleteNode(key, parent: parent);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Toggles the expanded property of an existing node identified by
  /// specified key. It returns a new controller with the node toggled.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// See [TreeViewController.toggleNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withToggleNode(key, newNode);
  /// });
  /// ```
  TreeViewController withToggleNode(String key, {Node<T>? parent}) {
    List<Node<T>> _data = toggleNode(key, parent: parent);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Expands all nodes down to Node identified by specified key.
  /// It returns a new controller with the nodes expanded.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.expandToNode].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withExpandToNode(key, newNode);
  /// });
  /// ```
  TreeViewController withExpandToNode(String key) {
    List<Node<T>> _data = expandToNode(key);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Collapses all nodes down to Node identified by specified key.
  /// It returns a new controller with the nodes collapsed.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.collapseToNode].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withCollapseToNode(key, newNode);
  /// });
  /// ```
  TreeViewController withCollapseToNode(String key) {
    List<Node<T>> _data = collapseToNode(key);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Expands all nodes down to parent Node.
  /// It returns a new controller with the nodes expanded.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.expandAll].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withExpandAll();
  /// });
  /// ```
  TreeViewController withExpandAll({Node<T>? parent}) {
    List<Node<T>> _data = expandAll(parent: parent);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Collapses all nodes down to parent Node.
  /// It returns a new controller with the nodes collapsed.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.collapseAll].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withCollapseAll();
  /// });
  /// ```
  TreeViewController withCollapseAll({Node<T>? parent}) {
    List<Node<T>> _data = collapseAll(parent: parent);
    return TreeViewController(
      children: _data,
      selectedKey: this.selectedKey,
    );
  }

  /// Gets the node that has a key value equal to the specified key.
  Node<T>? getNode(String key, {Node<T>? parent}) {
    Node<T>? _found;
    List<Node<T>> _children = parent == null ? this.children : parent.children;
    Iterator iter = _children.iterator;
    while (iter.moveNext()) {
      Node<T> child = iter.current;
      if (child.key == key) {
        _found = child;
        break;
      } else {
        if (child.isParent) {
          _found = this.getNode(key, parent: child);
          if (_found != null) {
            break;
          }
        }
      }
    }
    return _found;
  }

  /// Expands all node that are children of the parent node parameter. If no parent is passed, uses the root node as the parent.
  List<Node<T>> expandAll({Node<T>? parent}) {
    List<Node<T>> _children = [];
    Iterator iter =
        parent == null ? this.children.iterator : parent.children.iterator;
    while (iter.moveNext()) {
      Node<T> child = iter.current;
      if (child.isParent) {
        _children.add(child.copyWith(
          expanded: true,
          children: this.expandAll(parent: child),
        ));
      } else {
        _children.add(child);
      }
    }
    return _children;
  }

  /// Collapses all node that are children of the parent node parameter. If no parent is passed, uses the root node as the parent.
  List<Node<T>> collapseAll({Node<T>? parent}) {
    List<Node<T>> _children = [];
    Iterator iter =
        parent == null ? this.children.iterator : parent.children.iterator;
    while (iter.moveNext()) {
      Node<T> child = iter.current;
      if (child.isParent) {
        _children.add(child.copyWith(
          expanded: false,
          children: this.expandAll(parent: child),
        ));
      } else {
        _children.add(child);
      }
    }
    return _children;
  }

  /// Gets the parent of the node identified by specified key.
  Node<T>? getParent(String key, {Node<T>? parent}) {
    Node<T>? _found;
    List<Node<T>> _children = parent == null ? this.children : parent.children;
    Iterator iter = _children.iterator;
    while (iter.moveNext()) {
      Node<T> child = iter.current;
      if (child.key == key) {
        _found = parent ?? child;
        break;
      } else {
        if (child.isParent) {
          _found = this.getParent(key, parent: child);
          if (_found != null) {
            break;
          }
        }
      }
    }
    return _found;
  }

  /// Expands a node and all of the node's ancestors so that the node is
  /// visible without the need to manually expand each node.
  List<Node<T>> expandToNode(String key) {
    List<String> _ancestors = [];
    String _currentKey = key;

    _ancestors.add(_currentKey);

    Node<T>? _parent = this.getParent(_currentKey);
    if (_parent != null) {
      while (_parent!.key != _currentKey) {
        _currentKey = _parent.key;
        _ancestors.add(_currentKey);
        _parent = this.getParent(_currentKey);
      }
      TreeViewController<T> _this = this;
      _ancestors.forEach((String k) {
        Node<T> _node = _this.getNode(k)!;
        Node<T> _updated = _node.copyWith(expanded: true);
        _this = _this.withUpdateNode(k, _updated);
      });
      return _this.children;
    }
    return this.children;
  }

  /// Collapses a node and all of the node's ancestors without the need to
  /// manually collapse each node.
  List<Node<T>> collapseToNode(String key) {
    List<String> _ancestors = [];
    String _currentKey = key;

    _ancestors.add(_currentKey);

    Node<T>? _parent = this.getParent(_currentKey);
    if (_parent != null) {
      while (_parent!.key != _currentKey) {
        _currentKey = _parent.key;
        _ancestors.add(_currentKey);
        _parent = this.getParent(_currentKey);
      }
      TreeViewController<T> _this = this;
      _ancestors.forEach((String k) {
        Node<T> _node = _this.getNode(k)!;
        Node<T> _updated = _node.copyWith(expanded: false);
        _this = _this.withUpdateNode(k, _updated);
      });
      return _this.children;
    }
    return this.children;
  }

  /// Adds a new node to an existing node identified by specified key. It optionally
  /// accepts an [InsertMode] and index. If no [InsertMode] is specified,
  /// it appends the new node as a child at the end. This method returns
  /// a new list with the added node.
  List<Node<T>> addNode(
    String key,
    Node<T> newNode, {
    Node<T>? parent,
    int? index,
    InsertMode mode = InsertMode.append,
  }) {
    List<Node<T>> _children = parent == null ? this.children : parent.children;
    return _children.map((Node<T> child) {
      if (child.key == key) {
        List<Node<T>> _children = child.children.toList(growable: true);
        if (mode == InsertMode.prepend) {
          _children.insert(0, newNode);
        } else if (mode == InsertMode.insert) {
          _children.insert(index ?? _children.length, newNode);
        } else {
          _children.add(newNode);
        }
        return child.copyWith(children: _children);
      } else {
        return child.copyWith(
          children: addNode(
            key,
            newNode,
            parent: child,
            mode: mode,
            index: index,
          ),
        );
      }
    }).toList();
  }

  /// Updates an existing node identified by specified key. This method
  /// returns a new list with the updated node.
  List<Node<T>> updateNode(String key, Node<T> newNode, {Node<T>? parent}) {
    List<Node<T>> _children = parent == null ? this.children : parent.children;
    return _children.map((Node<T> child) {
      if (child.key == key) {
        return newNode;
      } else {
        if (child.isParent) {
          return child.copyWith(
            children: updateNode(
              key,
              newNode,
              parent: child,
            ),
          );
        }
        return child;
      }
    }).toList();
  }

  /// Toggles an existing node identified by specified key. This method
  /// returns a new list with the specified node toggled.
  List<Node<T>> toggleNode(String key, {Node<T>? parent}) {
    Node<T>? _node = getNode(key, parent: parent);
    return updateNode(key, _node!.copyWith(expanded: !_node.expanded));
  }

  /// Deletes an existing node identified by specified key. This method
  /// returns a new list with the specified node removed.
  List<Node<T>> deleteNode(String key, {Node<T>? parent}) {
    List<Node<T>> _children = parent == null ? this.children : parent.children;
    List<Node<T>> _filteredChildren = [];
    Iterator iter = _children.iterator;
    while (iter.moveNext()) {
      Node<T> child = iter.current;
      if (child.key != key) {
        if (child.isParent) {
          _filteredChildren.add(child.copyWith(
            children: deleteNode(key, parent: child),
          ));
        } else {
          _filteredChildren.add(child);
        }
      }
    }
    return _filteredChildren;
  }

  /// Get the current selected node. Returns null if there is no selectedKey
  Node<T>? get selectedNode {
    return this.selectedKey!.isEmpty ? null : getNode(this.selectedKey!);
  }

  /// Map representation of this object
  List<Map<String, dynamic>> get asMap {
    return children.map((Node<T> child) => child.asMap).toList();
  }

  @override
  String toString() {
    return jsonEncode(asMap);
  }
}
