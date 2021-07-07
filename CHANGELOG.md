## [1.0.3+2]
* Removed unnecessary asserts
* Removed null safety check on TreeView scroll physics property

## [1.0.3+1]
* Null check bug fixes

## [1.0.2+1]
* Bug fixes

### Updated
* Fixes: Null check operator used on a null value
* Fixes: Node Data not being written when TreeViewController is converted back to a Map
Create issue


## [1.0.1+1]
* Updated internal references

## [1.0.0+1]

### Updated
* Updated project to null-safety

## [0.10.0+1]

### Updated
* Fixed NodeExpander Size issue
* Updated code to use proper hover color between web and mobile

## [0.9.0+1]

### Added
* Added expandSpeed property to TreeViewTheme to control the speed in which nodes are animated.
* Added node builder to TreeView to allow custom display of node data. Builder function accepts build context and Node as parameters.
* Added expandAll, collapseAll, withExpandAll and withCollapseAll to TreeViewController

### Updated
* Refactored Node class to use IconData for the icon property.

### Removed
* Removed NodeIcon class.

## [0.8.0+1]

### Added
* Added support for labelOverflow and parentLabelOverflow. Thanks to Long Ti.

## [0.7.1+1]

### Updated
* Refactored logic to prevent getter 'key' called on null error when calling expandToNode and collapseToNode functions.

## [0.7.0+1]

### Added
* Added support for vertical and horizontal spacing. Thanks to Long Ti.
* Added support for padding node icons.
* Added bool parent property to Node class to force node to act as parent. 

### Updated
* Updated expander theme to not default to black but instead use the color of the current theme.
* Removed background color from tree nodes that aren't selected 

## [0.6.0+1]

### Added
* Added support for importing data property during JSON and Map load

## [0.5.0+1]

### Added
* Added support for using shrinkWrap, primary, and physics property on TreeView 

## [0.4.2+1]

### Added
* Added support for using external font packages

## [0.4.1+1]

### Updated
* Updated TreeView widget so that it inherits the ThemeData from context

## [0.4.0+1]

### Added
* Added expandToNode method to TreeViewController to support expanding all nodes down to specified node. Returns List<Node>.
* Added collapseToNode method to TreeViewController to support collapsing all nodes down to specified node. Returns List<Node>.
* Added withExpandToNode method to TreeViewController to support expanding all nodes down to specified node. Returns TreeViewController.
* Added withCollapseToNode method to TreeViewController to support expanding all nodes down to specified node. Returns TreeViewController.

## [0.3.0+1]

### Added
* Added generic data property to Node class to support the use of custom data

## [0.2.0+1]

### Updated
* Added animation controller dispose to TreeNode to prevent memory leaks

### Added
* Added new dense property to TreeViewTheme
* Added new loadJSON and loadMap convenience methods to TreeViewController for data loading
* Added new convenience methods to TreeViewController: toggleNode, withToggleNode, selectedNode

## [0.1.0+2]

### Updated
* Updated links to repository documentation
* Cleaned up warnings

## [0.0.4+1]

### Updated
* Added logic to update TreeNode when expanded programmatically
* Fixed issue with adding new node to a TreeNode with new children

## [0.0.3+7]

### Added
* Added api documentation

### Updated
* Added parentLabelStyle to TreeViewTheme to support separate styling for parent node

## [0.0.2+1]

### Added
* Added ExpanderModifier

### Updated
* Updated open source license
* Simplified ExpanderType
* Refactored TreeNodeExpander class and added animation to icon
* Updated default expander size

### Removed
* Removed custom TreeView font

## [0.0.1]

* Initial package release
