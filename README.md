1.Container
2.Column
3.Row 
4.Card
5.ListView
6.GridView
7.PageView
8.Divider
9. Bottom Bar
10. Alert Dialog
11. Text Field
12. Radio Button
13. List of Widget Screen
14. Bottom Navigation Bar
15. Stack
16. Text Button
17. Icon Button
18. Elevated Button
19. Back Button
20. Drop Down Button
21. Filled Button
22. Drawer Button
23. DropdownButtonFormField Button
24. Toggle Button
25. Switch Button
26. InkWell Button
27. PopUp Button
28. Outline Button
29. Checkbox Button
30. Inkwell
31. GestureDetector
32. Expanded
33. Flexible
34. Stepper
35. Visibility
36. Expantion Tile
37. Chip
38. Wrap
39. Circular Progress Indicator
40. Linear Progress Indicator
41. Refresh Progress Indicator
42. Flex
43. Reorderable
44. CustomScrollView
45. Sliver
     - SliverAppBar
     - SliverList
     - SliverGrid
46. Snack Bar
47. Tab Bar
48. Tab Page Selector
49. Future Builder
50. Animated Container
51. Animated Builder
52. Table
53. Navigation Rail
54. Auto Complete
55. Drawer
56. ClipRRect
57. ClipRect
58. ClipOval
59. ClipPath
60. Bottom Sheet
61. Show Model Bottom Sheet
62. TextField
63. TextFormField
64. CRUD Operation using sqflite
65. Todo notes
66. image picker
67. getx implment
68. todo task using MVC structure
69. todo notes using Provider and Firebase
70. Implement get Api using http
71. stay login, fetch data using api token and logout with validation
72. Pagination
73. responsive UI.













import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/widget_Controller.dart';

// 1 . stack and positioned , container
class AllWidgetsScreen extends StatefulWidget {
  const AllWidgetsScreen({super.key});

  @override
  State<AllWidgetsScreen> createState() => _AllwidgetsScreenState();
}

class _AllwidgetsScreenState extends State<AllWidgetsScreen> {
  List<dynamic>? args;
  int? widgetId;
  String? title;
  TextEditingController? _controller;
  WidgetController? controller;

  final List<Widget> ScreenWidget = <Widget>[
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    debugPrint("-------1111111111---------");
    setState(() {
      controller!.selectedIndex = index.obs;
      debugPrint("-------1111111111${controller!.selectedIndex}---------");
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(WidgetController());
    _controller = TextEditingController();
    args = Get.arguments;
    widgetId = args![0];
    title = args![1];
    return widgetId == 0
        ? Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.black45,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  "${title}",
                  style: TextStyle(color: Colors.white),
                )),
            body: Center(
              child: Container(
                height: 300,
                width: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.yellow,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 100,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ))
        : widgetId == 1
            ? Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.black45,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: Colors.white),
                    title: Text(
                      "${title}",
                      style: TextStyle(color: Colors.white),
                    )),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 4.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadiusDirectional.circular(2.5),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black,
                                blurRadius: 10.0,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(5, 5)),
                          ],
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 4.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadiusDirectional.circular(2.5),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      Container(
                        height: 4.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadiusDirectional.circular(2.5),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      Container(
                        height: 4.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadiusDirectional.circular(2.5),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      Container(
                        height: 4.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadiusDirectional.circular(2.5),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(2.5),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : widgetId == 2
                ? Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.black45,
                        iconTheme: IconThemeData(color: Colors.white),
                        centerTitle: true,
                        title: Text(
                          "${title}",
                          style: TextStyle(color: Colors.white),
                        )),
                    body: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: Card(
                            elevation: 4,
                            clipBehavior: Clip.hardEdge,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Card Title',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'This is a simple card widget.',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        child: Text('back'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      TextButton(
                                        child: Text('back'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: Card(
                            elevation: 5,
                            // clipBehavior is necessary because, without it, the InkWell's animation
                            // This comes with a small performance cost, and you should not set [clipBehavior]
                            // unless you need it.
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 300,
                                height: 100,
                                child: Center(
                                    child: Text('A card that can be tapped')),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : widgetId == 3
                    ? Scaffold(
                        appBar: AppBar(
                            backgroundColor: Colors.black45,
                            iconTheme: IconThemeData(color: Colors.white),
                            centerTitle: true,
                            title: Text(
                              "${title}",
                              style: TextStyle(color: Colors.white),
                            )),
                        body: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('Local Asset Image',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10),
                                    Image.asset('assets/images/a1.jpg',
                                        height: 150),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('Network Image',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10),
                                    Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg",
                                        height: 150),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('ClipOval Image',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10),
                                    ClipOval(
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg",
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('ClipRect Image',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10),
                                    ClipRect(
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg",
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('Icon Widgets',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.image, size: 50),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : widgetId == 4
                        ? Scaffold(
                            appBar: AppBar(
                                backgroundColor: Colors.black45,
                                centerTitle: true,
                                iconTheme: IconThemeData(color: Colors.white),
                                title: Text(
                                  "${title}",
                                  style: TextStyle(color: Colors.white),
                                )),
                            body: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // so multiple count so used GridView builder
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[100],
                                    child: Center(child: const Text("0")),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[200],
                                    child: Center(child: const Text('1')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[300],
                                    child: Center(child: const Text('2')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[400],
                                    child: Center(child: const Text('3')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[500],
                                    child: Center(child: const Text('4')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.grey[600],
                                    child: Center(child: const Text('5')),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : widgetId == 5
                            ? Scaffold(
                                appBar: AppBar(
                                    backgroundColor: Colors.black45,
                                    centerTitle: true,
                                    iconTheme:
                                        IconThemeData(color: Colors.white),
                                    title: Text(
                                      "${title}",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                body: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Open Alert Dialog used Alert MSG user"),
                                                    content: const Text(
                                                        'AlertDialog description'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Get.back(),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Get.back(),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text("Open Alert Dialog")),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : widgetId == 6
                                ? DefaultTabController(
                                    initialIndex: 1,
                                    length: 3,
                                    child: Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: Colors.black45,
                                        centerTitle: true,
                                        iconTheme:
                                            IconThemeData(color: Colors.white),
                                        title: Text(
                                          "${title}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        bottom: const TabBar(
                                          dividerHeight: 2,
                                          indicatorColor: Colors.black54,
                                          tabs: [
                                            Tab(
                                              icon: Icon(
                                                Icons.add_alert_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(Icons.account_box,
                                                  color: Colors.white),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                  Icons.access_time_filled,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      body: const TabBarView(
                                        children: [
                                          Center(
                                            child: Text("notification",
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                          Center(
                                            child: Text("account",
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                          Center(
                                            child: Text("time",
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : widgetId == 7
                                    ? Scaffold(
                                        appBar: AppBar(
                                            backgroundColor: Colors.black45,
                                            centerTitle: true,
                                            iconTheme: IconThemeData(
                                                color: Colors.white),
                                            title: Text(
                                              "${title}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        body: ScreenWidget.elementAt(
                                            controller!.selectedIndex.value),
                                        bottomNavigationBar:
                                            BottomNavigationBar(
                                          items: const <BottomNavigationBarItem>[
                                            BottomNavigationBarItem(
                                              icon: Icon(Icons.home),
                                              label: 'Home',
                                            ),
                                            BottomNavigationBarItem(
                                              icon: Icon(Icons.search),
                                              label: 'Search',
                                            ),
                                            BottomNavigationBarItem(
                                              icon: Icon(Icons.person),
                                              label: 'Profile',
                                            ),
                                          ],
                                          currentIndex:
                                              controller!.selectedIndex.value,
                                          selectedItemColor: Colors.blue,
                                          unselectedItemColor: Colors.grey,
                                          onTap: _onItemTapped,
                                        ),
                                      )
                                    : widgetId == 8
                                        ? Scaffold(
                                            appBar: AppBar(
                                                backgroundColor: Colors.black45,
                                                centerTitle: true,
                                                iconTheme: IconThemeData(
                                                    color: Colors.white),
                                                title: Text(
                                                  "${title}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            body: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Container(
                                                              height: 200,
                                                              child: Center(
                                                                child: Text(
                                                                    'This is a BottomSheet!'),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Text(
                                                          "ElevatedButton"),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        : widgetId == 9
                                            ? Scaffold(
                                                appBar: AppBar(
                                                    backgroundColor:
                                                        Colors.black45,
                                                    centerTitle: true,
                                                    iconTheme: IconThemeData(
                                                        color: Colors.white),
                                                    title: Text(
                                                      "${title}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                body: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextField(
                                                        controller: _controller,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Enter your text',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(Icons
                                                              .text_fields),
                                                        ),
                                                      ),
                                                      SizedBox(height: 20),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          // Handle button press
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                          print(
                                                              'Entered text: ${_controller!.text}');
                                                        },
                                                        child: Text('Submit'),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Text(
                                                          "Entered text: ${_controller!.text}"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : widgetId == 10
                                                ? Scaffold(
                                                    appBar: AppBar(
                                                        backgroundColor:
                                                            Colors.black45,
                                                        centerTitle: true,
                                                        iconTheme:
                                                            IconThemeData(
                                                                color: Colors
                                                                    .white),
                                                        title: Text(
                                                          "${title}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                    body: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              'Select an option:'),
                                                          RadioListTile(
                                                            title: Text(
                                                                'Option 1'),
                                                            value: 1,
                                                            groupValue: controller!
                                                                .selectedRadioValue,
                                                            onChanged:
                                                                (int? value) {
                                                              setState(() {
                                                                controller!
                                                                        .selectedRadioValue =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            title: Text(
                                                                'Option 2'),
                                                            value: 2,
                                                            groupValue: controller!
                                                                .selectedRadioValue,
                                                            onChanged:
                                                                (int? value) {
                                                              setState(() {
                                                                controller!
                                                                        .selectedRadioValue =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            title: Text(
                                                                'Option 3'),
                                                            value: 3,
                                                            groupValue: controller!
                                                                .selectedRadioValue,
                                                            onChanged:
                                                                (int? value) {
                                                              setState(() {
                                                                controller!
                                                                        .selectedRadioValue =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          SizedBox(height: 20),
                                                          Text(
                                                              'Selected Value: ${controller!.selectedRadioValue}'),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : widgetId == 11
                                                    ? Scaffold(
                                                        appBar: AppBar(
                                                            backgroundColor:
                                                                Colors.black45,
                                                            centerTitle: true,
                                                            iconTheme:
                                                                const IconThemeData(
                                                                    color: Colors
                                                                        .white),
                                                            title: Text(
                                                              "${title}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                        body: Table(
                                                          border: TableBorder
                                                              .all(), // Adds borders to the table
                                                          children: const [
                                                            TableRow(children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(
                                                                    'Header 1',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Text(
                                                                    'Header 2',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('1'),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('2'),
                                                              ),
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('3'),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('4'),
                                                              ),
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('5'),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Text('6'),
                                                              ),
                                                            ]),
                                                          ],
                                                        ),
                                                      )
                                                    : widgetId == 12 ? Scaffold(   appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        iconTheme:
        IconThemeData(color: Colors.white),
        title: Text(
          "${title}",
          style: TextStyle(color: Colors.white),
        )),
                                                body: , ) : Scaffold();
  }
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../controller/widget_Controller.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  WidgetController controller = Get.put(WidgetController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Color RandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      128 + random.nextInt(128), // Red: Minimum 128 to ensure lightness
      128 + random.nextInt(128), // Green: Minimum 128 to ensure lightness
      128 + random.nextInt(128), // Blue: Minimum 128 to ensure lightness
    );
  }

  void navigatorMathod(index) {
    // if (index == 0 ||
    //     index == 1 ||
    //     index == 2 ||
    //     index == 3 ||
    //     index == 4 ||
    //     index == 5) {
      Get.toNamed('allWidgets', arguments: [
        controller.widgetsList[index].id,
        controller.widgetsList[index].title
      ]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        title: Text(
          "AppBar Example",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.settings_rounded, color: Colors.white),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add_outlined, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Profile', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title:
                  Text('App Settings', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.black),
              title: Text('Help', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.widgetsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigatorMathod(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    // Optional padding between items
                    child: Container(
                      height: 8.h,
                      // Adjust the height as needed
                      width: double.infinity,
                      // This makes the Container full width
                      decoration: BoxDecoration(
                        color: RandomColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "${controller.widgetsList[index].title}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17.sp),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:practice/allWidgets/model/widgets_list_model.dart';

class WidgetController extends ChangeNotifier{

  RxList<Widgets_Model> widgetsList = <Widgets_Model>[
    Widgets_Model(title: "Stack in Container",id: 0),
    Widgets_Model(title: "Column and Row",id: 1),
    Widgets_Model(title: "Card",id: 2),
    Widgets_Model(title: "Assets,Images, and Icon ",id: 3),
    Widgets_Model(title: "GridView builder ",id: 4),
    Widgets_Model(title: "Alert Dialog",id: 5),
    Widgets_Model(title: "Tab bar",id: 6),
    Widgets_Model(title: "BottomNavigationBar",id: 7),
    Widgets_Model(title: "BottomSheet",id: 8),
    Widgets_Model(title: "Text Field",id: 9),
    Widgets_Model(title: "Radio Button",id: 10),
    Widgets_Model(title: "Table",id: 11),
    Widgets_Model(title: "Drop Down Button",id: 12),
    Widgets_Model(title: " Filled Button",id: 13),
    Widgets_Model(title: "DropdownButtonFormField Button",id: 14),
    Widgets_Model(title: " Toggle Button",id: 15),
    Widgets_Model(title: " Switch Button",id: 16),
    Widgets_Model(title: "PopUp Button",id: 17),
    Widgets_Model(title: "Outline Button",id: 18),
    Widgets_Model(title: "Checkbox Button",id: 19),
    Widgets_Model(title: "GestureDetector",id: 20),
    Widgets_Model(title: "Expanded",id: 21),
    Widgets_Model(title: "Flexible",id: 22),
    Widgets_Model(title: "Stepper",id: 23),
    Widgets_Model(title: "Visibility",id: 24),
    Widgets_Model(title: "Expantion Tile",id: 25),
    Widgets_Model(title: "Chip",id: 26),
    Widgets_Model(title: " Circular Progress Indicator",id: 27),
    Widgets_Model(title: "Reorderable",id: 28),
    Widgets_Model(title: "Flex",id: 29),
    Widgets_Model(title: "Wrap",id: 30),
    Widgets_Model(title: "CustomScrollView",id: 31),
    Widgets_Model(title: "Sliver",id: 32),
    Widgets_Model(title: "Snack Bar",id: 33),

  ].obs;

  String text = '';
  RxInt selectedIndex = 0.obs;
  int? selectedRadioValue;

}
