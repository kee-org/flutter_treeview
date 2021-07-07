import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_treeview/src/models/node.dart';
import 'package:flutter_treeview/src/tree_view_controller.dart';

void main() {
  List<Node> nodes = [
    Node(label: 'documents', key: 'docs', children: [
      Node(label: 'personal', key: 'd3', children: [
        Node(label: 'Resume.docx', key: 'pd1'),
        Node(label: 'Cover Letter.docx', key: 'pd2'),
      ]),
      Node(label: 'Inspection.docx', key: 'd1'),
      Node(label: 'Invoice.docx', key: 'd2'),
    ]),
    Node(
      label: 'MeetingReport.xls',
      key: 'mrxls',
    ),
    Node(
      label: 'MeetingReport.pdf',
      key: 'mrpdf',
    ),
    Node(
      label: 'Demo.zip',
      key: 'demo',
    ),
  ];
  group('TreeViewController Tests', () {
    test('...get node', () {
      TreeViewController controller = TreeViewController(children: nodes);
      Node? validNode = controller.getNode('pd1');
      Node? invalidNode = controller.getNode('xpd1');
      expect(controller.children.length, 4);
      expect(validNode.runtimeType, Node);
      expect(validNode!.label, 'Resume.docx');
      expect(invalidNode.runtimeType, Null);
    });
    test('...get parent', () {
      TreeViewController controller = TreeViewController(children: nodes);
      Node? nodeParent = controller.getParent('pd1');
      Node? rootParent = controller.getParent('docs');
      Node? noParent = controller.getParent('xpd1');
      expect(nodeParent.runtimeType, Node);
      expect(nodeParent!.key, 'd3');
      expect(rootParent.runtimeType, Node);
      expect(rootParent!.key, 'docs');
      expect(noParent.runtimeType, Null);
    });
    test('...update node', () {
      TreeViewController controller = TreeViewController(children: nodes);
      Node? node = controller.getNode('pd1');
      Node updatedNode = node!.copyWith(
        key: 'pdf1',
        label: 'My Resume.pdf',
      );
      List<Node> newChildren = controller.updateNode(node.key, updatedNode);
      controller = TreeViewController(children: newChildren);
      Node? validNode = controller.getNode('pdf1');
      Node? invalidNode = controller.getNode('pd1');
      expect(validNode.runtimeType, Node);
      expect(validNode!.key, updatedNode.key);
      expect(validNode.label, updatedNode.label);
      expect(invalidNode.runtimeType, Null);
    });
    test('...delete child node', () {
      TreeViewController controller = TreeViewController(children: nodes);
      List<Node> newChildren = controller.deleteNode('pd1');
      controller = TreeViewController(children: newChildren);
      Node? invalidNode = controller.getNode('pd1');
      expect(invalidNode.runtimeType, Null);
    });
    test('...delete parent node', () {
      TreeViewController controller = TreeViewController(children: nodes);
      List<Node> newChildren = controller.deleteNode('docs');
      controller = TreeViewController(children: newChildren);
      expect(controller.getNode('docs'), null);
      expect(controller.getNode('pd1'), null);
      expect(controller.getNode('pd2'), null);
      expect(controller.getNode('d3'), null);
      expect(controller.getNode('d1'), null);
      expect(controller.getNode('d2'), null);
    });
    test('...add child node', () {
      TreeViewController controller = TreeViewController(children: nodes);
      Node? invalidNode = controller.getNode('pd3');
      expect(invalidNode.runtimeType, Null);
      Node newNode = Node(label: 'References.docx', key: 'pd3');
      List<Node> newChildren = controller.addNode('d3', newNode);
      controller = TreeViewController(children: newChildren);
      Node? validNode = controller.getNode('pd3');
      expect(validNode.runtimeType, Node);
      expect(validNode!.label, newNode.label);
    });
  });
}
