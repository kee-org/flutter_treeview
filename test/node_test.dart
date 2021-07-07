import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_treeview/src/models/node.dart';

class Person {
  final int age;

  Person({required this.age});
}

class Animal {
  final int legs;

  Animal({required this.legs});
}

void main() {
  group('instantiate', () {
    test('from string', () {
      final Node node = Node.fromLabel('Home');
      expect(node.key.isNotEmpty, true);
      expect(node.label, 'Home');
      expect(node.icon, null);
      expect(node.expanded, false);
      expect(node.children.length, 0);
    });
    test('copyWith', () {
      final Node node = Node.fromLabel('Home');
      expect(node.label, 'Home');
      expect(node.icon, null);
      expect(node.expanded, false);
      expect(node.children.length, 0);
      final Node newNode = node.copyWith(label: 'New Home');
      expect(newNode.label, 'New Home');
      expect(newNode.icon, null);
      expect(newNode.expanded, false);
      expect(newNode.children.length, 0);
    });
    test('from map', () {
      final map = {
        "key": "12345",
        "label": "Home",
      };
      final expectedMap = {
        "key": "12345",
        "label": "Home",
        "icon": null,
        "expanded": false,
        "parent": false,
        "children": [],
      };
      final Node node = Node.fromMap(map);
      expect(node.key, '12345');
      expect(node.label, 'Home');
      expect(node.icon, null);
      expect(node.expanded, false);
      expect(node.children.length, 0);
      expect(node.isParent, false);
      expect(node.asMap, expectedMap);
    });
    test('from nested map', () {
      final map = {
        "label": "Home",
        "expanded": 1,
        "icon": Icons.home.codePoint.toString(),
        "children": [
          {
            "key": "12345b",
            "label": "Basement",
          },
          {
            "key": "12345k",
            "label": "Kitchen",
          }
        ],
      };
      final expectedMap = {
        "label": "Home",
        "icon": null,
        "expanded": true,
        "parent": false,
        "children": [
          {
            "key": "12345b",
            "label": "Basement",
            "icon": null,
            "expanded": false,
            "parent": false,
            "children": [],
          },
          {
            "key": "12345k",
            "label": "Kitchen",
            "icon": null,
            "expanded": false,
            "parent": false,
            "children": [],
          }
        ],
      };
      final Node node = Node.fromMap(map);
      expect(node.key.isNotEmpty, true);
      expect(node.label, 'Home');
      expect(node.icon, null);
      expect(node.expanded, true);
      expect(node.children.length, 2);
      expect(node.isParent, true);
      Map nodeMap = node.asMap;
      nodeMap.remove('key');
      expect(nodeMap, expectedMap);
    });
    test('with data', () {
      Person lukas = Person(age: 3);
      Animal otis = Animal(legs: 4);
      final Node node1 =
          Node<Person>(label: 'Lukas', key: 'lukas', data: lukas);
      Node node2 = Node.fromLabel('Friend');
      expect(node1.hasData, true);
      expect(node1.data.runtimeType, Person);

      expect(node2.hasData, false);
      expect(node2.data.runtimeType, Null);
      node2 = node2.copyWith(data: otis);
      expect(node2.data.runtimeType, Animal);
      expect(node2.hasData, true);
      final Node node3 =
          Node<double>(label: 'Building Height', key: 'bldghgt', data: 100.4);
      expect(node3.hasData, true);
      expect(node3.data.runtimeType, double);
    });
  });
}
