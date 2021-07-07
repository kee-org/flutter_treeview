# flutter_treeview

A hierarchical data widget for your flutter apps. 

It offers a number of options for customizing the appearance and handling user interaction.

It also offers some convenience methods for importing data into the tree.


## Features

* Separately customize child and parent labels
* Add any icon to a node
* Choose from four different expander icons and several modifiers for adjusting shape, outline, and fill. 
* Import data from a Map 
* Includes ability to handle expandChange, tap, and double tap user interactions
* Includes convenience methods for adding, updating and deleting nodes


## Sample Code
### Creating a TreeView
```dart
List<Node> nodes = [
 Node(
   label: 'Documents',
   key: 'docs',
   expanded: true,
   icon: docsOpen ? Icons.folder_open : Icons.folder,
   children: [
     Node(
         label: 'Job Search',
         key: 'd3',
         icon: Icons.input,
         children: [
           Node(
               label: 'Resume.docx',
               key: 'pd1',
               icon: Icons.insert_drive_file,
           ),
           Node(
               label: 'Cover Letter.docx',
               key: 'pd2',
               icon: Icons.insert_drive_file),
         ]),
     Node(
       label: 'Inspection.docx',
       key: 'd1',
     ),
     Node(
         label: 'Invoice.docx',
         key: 'd2',
         icon: Icons.insert_drive_file),
   ],
 ),
 Node(
     label: 'MeetingReport.xls',
     key: 'mrxls',
     icon: Icons.insert_drive_file),
 Node(
     label: 'MeetingReport.pdf',
     key: 'mrpdf',
     icon: Icons.insert_drive_file),
 Node(
     label: 'Demo.zip',
     key: 'demo',
     icon: Icons.archive),
];
TreeViewController _treeViewController = TreeViewController(children: nodes);
TreeView(
  controller: _treeViewController,
  allowParentSelect: false,
  supportParentDoubleTap: false,
  onExpansionChanged: _expandNodeHandler,
  onNodeTap: (key) {
    setState(() {
      _treeViewController = _treeViewController.copyWith(selectedKey: key);
    });
  },
  theme: treeViewTheme
),
```
_The TreeView requires that the onExpansionChange property updates the expanded
node so that the tree is rendered properly.

### Creating a theme
```dart
TreeViewTheme _treeViewTheme = TreeViewTheme(
  expanderTheme: ExpanderThemeData(
    type: ExpanderType.caret,
    modifier: ExpanderModifier.none,
    position: ExpanderPosition.start,
    color: Colors.red.shade800,
    size: 20,
  ),
  labelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.3,
  ),
  parentLabelStyle: TextStyle(
    fontSize: 16,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w800,
    color: Colors.red.shade600,
  ),
  iconTheme: IconThemeData(
    size: 18,
    color: Colors.grey.shade800,
  ),
  colorScheme: ColorScheme.light(),
)
```

### Using custom data
The Node class supports the use of custom data. You can use the data property on the Node instance to store data that you want to easily retrieve.
```dart
class Person {
  final String name;
  final List<Animal> pets;

  Person({this.name, this.pets});
}

class Animal {
  final String name;

  Animal({this.name});
}

Animal otis = Animal(name: 'Otis');
Animal zorro = Animal(name: 'Zorro');
Person lukas = Person(name: 'Lukas', pets: [otis, zorro]);

List<Node> nodes = [
  Node<Person>(
    label: 'Lukas',
    key: 'lukas',
    data: lukas,
    children: [
      Node<Animal>(
        label: 'Otis',
        key: 'otis',
        data: otis,
      ),      
      //<T> is optional but recommended. If not specified, code can return Node<dynamic> instead of Node<Animal>
      Node(
        label: 'Zorro',
        key: 'zorro',
        data: zorro,
      ),
    ]
  ),
];
TreeViewController _treeViewController = TreeViewController(children: nodes);
TreeView(
  controller: _treeViewController,
  onNodeTap: (key) {
    Node selectedNode = _treeViewController.getNode(key);
    Person selectedModel = selectedNode.data;
  },
),
```


## Getting Started

For help getting started with this widget, view our 
[online documentation](https://bitbucket.org/kevinandre/flutter_treeview/wiki/Home) or view the
full [API reference](https://pub.dev/documentation/flutter_treeview/latest/).

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
