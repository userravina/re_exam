
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/widget_Controller.dart';

// 1 . stack and positioned , container

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

enum SampleItem { itemOne, itemTwo, itemThree }

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
  List<String> dropDwonlist = ['one', 'two', 'three', 'Four'];
  String dropdownValue = list.first;
  List<bool> selections = [false, false, false];
  int selectedIndex = 0;
  bool isSwitched = false;
  SampleItem? selectedItem;
  bool isChecked = false; // Checkbox state
  String message = "Tap or Double Tap";
  int index = 0;
  bool isVisible = true;
  bool customTileExpanded = false;
  List<String> items = List<String>.generate(10, (index) => "Item $index");
  bool selected = false;

  // Function to handle single tap
  void onTap() {
    setState(() {
      message = "You tapped!";
    });
  }

  // Function to handle double tap
  void onDoubleTap() {
    setState(() {
      message = "You double tapped!";
    });
  }

  // Function to toggle checkbox state
  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false; // Update checkbox state
    });
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  final List ScreenWidget = [
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
                  fit: StackFit.loose,
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
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'My Column',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20), // Spacer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                              height: 100,
                              alignment: Alignment.center,
                              child: Text(
                                'Left',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Spacer
                          Expanded(
                            child: Container(
                              color: Colors.grey,
                              height: 100,
                              alignment: Alignment.center,
                              child: Text(
                                'Right',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Spacer
                      Container(
                        color: Colors.blueGrey,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          'Bottom Section',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
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
                                                barrierDismissible: false,
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
                                              ),
                                            ),
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
                                                    : widgetId == 12
                                                        ? Scaffold(
                                                            appBar: AppBar(
                                                              backgroundColor:
                                                                  Colors
                                                                      .black45,
                                                              centerTitle: true,
                                                              iconTheme:
                                                                  IconThemeData(
                                                                      color: Colors
                                                                          .white),
                                                              title: Text(
                                                                "${title}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            body: Center(
                                                              child:
                                                                  DropdownButton<
                                                                      String>(
                                                                value:
                                                                    dropdownValue,
                                                                icon: const Icon(
                                                                    Icons
                                                                        .arrow_downward),
                                                                elevation: 30,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .deepPurple),
                                                                underline:
                                                                    Container(
                                                                  height: 2,
                                                                  color: Colors
                                                                      .deepPurpleAccent,
                                                                ),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  // This is called when the user selects an item.
                                                                  setState(() {
                                                                    dropdownValue =
                                                                        value!;
                                                                  });
                                                                },
                                                                items: list.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          )
                                                        : widgetId == 13
                                                            ? Scaffold(
                                                                appBar: AppBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black45,
                                                                    centerTitle:
                                                                        true,
                                                                    iconTheme:
                                                                        const IconThemeData(
                                                                            color:
                                                                                Colors.white),
                                                                    title: Text(
                                                                      "${title}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                                body: Center(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Column(
                                                                          children: [
                                                                            const SizedBox(height: 30),
                                                                            const Text('Filled'),
                                                                            const SizedBox(height: 15),
                                                                            FilledButton(
                                                                              style: ButtonStyle(),
                                                                              onPressed: () {},
                                                                              child: const Text('Enabled'),
                                                                            ),
                                                                            const SizedBox(height: 30),
                                                                            const FilledButton(
                                                                              onPressed: null,
                                                                              child: Text('Disabled'),
                                                                            ),
                                                                          ]),
                                                                      const SizedBox(
                                                                          width:
                                                                              30),
                                                                      Column(
                                                                          children: <Widget>[
                                                                            const SizedBox(height: 30),
                                                                            const Text('Filled tonal'),
                                                                            const SizedBox(height: 15),
                                                                            FilledButton.tonal(
                                                                              onPressed: () {},
                                                                              child: const Text('Enabled'),
                                                                            ),
                                                                            const SizedBox(height: 30),
                                                                            FilledButton.tonalIcon(
                                                                              onPressed: null,
                                                                              label: Text("rty"),
                                                                              icon: Icon(Icons.access_alarm),
                                                                            ),
                                                                          ])
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            : widgetId == 14
                                                                ? Scaffold(
                                                                    appBar: AppBar(
                                                                        backgroundColor: Colors.black45,
                                                                        centerTitle: true,
                                                                        iconTheme: const IconThemeData(color: Colors.white),
                                                                        title: Text(
                                                                          "${title}",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        )),
                                                                    body:
                                                                        Center(
                                                                      child:
                                                                          DropdownButtonFormField(
                                                                        value:
                                                                            dropdownValue,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Choose an option',
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        ),
                                                                        icon: Icon(
                                                                            Icons.keyboard_arrow_down),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.deepPurple),
                                                                        onChanged:
                                                                            (String?
                                                                                newValue) {
                                                                          setState(
                                                                              () {
                                                                            dropdownValue =
                                                                                newValue!;
                                                                          });
                                                                        },
                                                                        validator:
                                                                            (String?
                                                                                value) {
                                                                          if (value ==
                                                                              null) {
                                                                            return 'Please select an option';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        items: list.map<
                                                                            DropdownMenuItem<
                                                                                String>>((String
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Text(value),
                                                                          );
                                                                        }).toList(),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : widgetId == 15
                                                                    ? Scaffold(
                                                                        appBar: AppBar(
                                                                            backgroundColor: Colors.black45,
                                                                            centerTitle: true,
                                                                            iconTheme: const IconThemeData(color: Colors.white),
                                                                            title: Text(
                                                                              "${title}",
                                                                              style: TextStyle(color: Colors.white),
                                                                            )),
                                                                        body:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    Center(
                                                                                      child: ToggleButtons(
                                                                                        children: <Widget>[
                                                                                          Icon(Icons.ac_unit),
                                                                                          Icon(Icons.call),
                                                                                          Icon(Icons.camera),
                                                                                        ],
                                                                                        isSelected: selections,
                                                                                        onPressed: (int index) {
                                                                                          setState(() {
                                                                                            // Toggle the selected state of the button
                                                                                            selections[index] = !selections[index];
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Center(
                                                                                      child: SegmentedButton<int>(
                                                                                        segments: [
                                                                                          ButtonSegment<int>(
                                                                                            value: 0,
                                                                                            label: Text('Option 1'),
                                                                                          ),
                                                                                          ButtonSegment<int>(
                                                                                            value: 1,
                                                                                            label: Text('Option 2'),
                                                                                          ),
                                                                                          ButtonSegment<int>(
                                                                                            value: 2,
                                                                                            label: Text('Option 3'),
                                                                                          ),
                                                                                        ],
                                                                                        selected: {
                                                                                          selectedIndex
                                                                                        },
                                                                                        onSelectionChanged: (Set<int> newSelection) {
                                                                                          setState(() {
                                                                                            selectedIndex = newSelection.first; // Get the first selected index
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : widgetId ==
                                                                            16
                                                                        ? Scaffold(
                                                                            appBar: AppBar(
                                                                                backgroundColor: Colors.black45,
                                                                                centerTitle: true,
                                                                                iconTheme: const IconThemeData(color: Colors.white),
                                                                                title: Text(
                                                                                  "${title}",
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )),
                                                                            body:
                                                                                Center(
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    isSwitched ? 'Switch is ON' : 'Switch is OFF',
                                                                                    style: TextStyle(fontSize: 20),
                                                                                  ),
                                                                                  SizedBox(height: 20),
                                                                                  Switch(
                                                                                    value: isSwitched,
                                                                                    onChanged: toggleSwitch,
                                                                                    activeColor: Colors.green,
                                                                                    inactiveThumbColor: Colors.red,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : widgetId ==
                                                                                17
                                                                            ? Scaffold(
                                                                                appBar: AppBar(
                                                                                  backgroundColor: Colors.black45,
                                                                                  centerTitle: true,
                                                                                  iconTheme: const IconThemeData(color: Colors.white),
                                                                                  title: Text(
                                                                                    "${title}",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  actions: [
                                                                                    PopupMenuButton<String>(
                                                                                      // Key for the PopupMenuButton
                                                                                      key: Key('popupMenuButton'),
                                                                                      // Define the menu items
                                                                                      itemBuilder: (BuildContext context) {
                                                                                        return [
                                                                                          PopupMenuItem<String>(
                                                                                            value: 'Option 1',
                                                                                            child: Text('Option 1'),
                                                                                          ),
                                                                                          PopupMenuItem<String>(
                                                                                            value: 'Option 2',
                                                                                            child: Text('Option 2'),
                                                                                          ),
                                                                                          PopupMenuItem<String>(
                                                                                            value: 'Option 3',
                                                                                            child: Text('Option 3'),
                                                                                          ),
                                                                                        ];
                                                                                      },
                                                                                      // Initial value
                                                                                      initialValue: 'Option 1',
                                                                                      // Called when the menu is opened
                                                                                      onOpened: () {
                                                                                        print('Menu opened');
                                                                                      },
                                                                                      // Called when a menu item is selected
                                                                                      onSelected: (String value) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(content: Text('Selected: $value')),
                                                                                        );
                                                                                      },
                                                                                      // Called when the menu is canceled
                                                                                      onCanceled: () {
                                                                                        print('Menu canceled');
                                                                                      },
                                                                                      // Tooltip for the button
                                                                                      tooltip: 'Open Menu',

                                                                                      // Elevation of the menu
                                                                                      elevation: 8.0,
                                                                                      // Menu padding
                                                                                      menuPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                                                                      // Child widget (icon)
                                                                                      child: Icon(Icons.more_vert),
                                                                                      // Icon color
                                                                                      iconColor: Colors.white,
                                                                                      // Size of the icon
                                                                                      iconSize: 30.0,
                                                                                      // Popup menu position
                                                                                      position: PopupMenuPosition.over,
                                                                                      // Animation style
                                                                                      // popUpAnimationStyle: AnimationStyle.fade,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                body: Center(
                                                                                  child: PopupMenuButton<SampleItem>(
                                                                                    initialValue: selectedItem,
                                                                                    onSelected: (SampleItem item) {
                                                                                      setState(() {
                                                                                        selectedItem = item;
                                                                                      });
                                                                                    },
                                                                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                                                                      const PopupMenuItem(
                                                                                        value: SampleItem.itemOne,
                                                                                        child: Text('Item 1'),
                                                                                      ),
                                                                                      const PopupMenuItem(
                                                                                        value: SampleItem.itemTwo,
                                                                                        child: Text('Item 2'),
                                                                                      ),
                                                                                      const PopupMenuItem(
                                                                                        value: SampleItem.itemThree,
                                                                                        child: Text('Item 3'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : widgetId == 19
                                                                                ? Scaffold(
                                                                                    appBar: AppBar(
                                                                                        backgroundColor: Colors.black45,
                                                                                        centerTitle: true,
                                                                                        iconTheme: const IconThemeData(color: Colors.white),
                                                                                        title: Text(
                                                                                          "${title}",
                                                                                          style: TextStyle(color: Colors.white),
                                                                                        )),
                                                                                    body: Center(
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            isChecked ? 'Checked' : 'Unchecked', // Display state
                                                                                            style: TextStyle(fontSize: 20),
                                                                                          ),
                                                                                          SizedBox(height: 20),
                                                                                          Checkbox(
                                                                                            value: isChecked,
                                                                                            // Checkbox value
                                                                                            onChanged: toggleCheckbox,
                                                                                            // Callback on change
                                                                                            activeColor: Colors.blue,
                                                                                            // Color when checked
                                                                                            checkColor: Colors.white, // Color of check mark
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : widgetId == 20
                                                                                    ? Scaffold(
                                                                                        appBar: AppBar(
                                                                                            backgroundColor: Colors.black45,
                                                                                            centerTitle: true,
                                                                                            iconTheme: const IconThemeData(color: Colors.white),
                                                                                            title: Text(
                                                                                              "${title}",
                                                                                              style: TextStyle(color: Colors.white),
                                                                                            )),
                                                                                        body: Center(
                                                                                          child: GestureDetector(
                                                                                            onTap: onTap,
                                                                                            // Handle single tap
                                                                                            onDoubleTap: onDoubleTap,
                                                                                            // Handle double tap
                                                                                            child: Container(
                                                                                              padding: EdgeInsets.all(20),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.blue,
                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                              ),
                                                                                              child: Text(
                                                                                                message,
                                                                                                style: TextStyle(color: Colors.white, fontSize: 24),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : widgetId == 21
                                                                                        ? Scaffold(
                                                                                            appBar: AppBar(
                                                                                                backgroundColor: Colors.black45,
                                                                                                centerTitle: true,
                                                                                                iconTheme: const IconThemeData(color: Colors.white),
                                                                                                title: Text(
                                                                                                  "${title}",
                                                                                                  style: TextStyle(color: Colors.white),
                                                                                                )),
                                                                                            body: Column(
                                                                                              children: [
                                                                                                Container(
                                                                                                  color: Colors.brown,
                                                                                                  height: 100,
                                                                                                  child: Center(child: Text('Fixed Height', style: TextStyle(color: Colors.white, fontSize: 20))),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    color: Colors.lime,
                                                                                                    child: Center(child: Text('Expanded Area', style: TextStyle(color: Colors.white, fontSize: 20))),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  color: Colors.teal,
                                                                                                  height: 100,
                                                                                                  child: Center(child: Text('Fixed Height', style: TextStyle(color: Colors.white, fontSize: 20))),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          )
                                                                                        : widgetId == 18
                                                                                            ? Scaffold(
                                                                                                appBar: AppBar(
                                                                                                    backgroundColor: Colors.black45,
                                                                                                    centerTitle: true,
                                                                                                    iconTheme: const IconThemeData(color: Colors.white),
                                                                                                    title: Text(
                                                                                                      "${title}",
                                                                                                      style: TextStyle(color: Colors.white),
                                                                                                    )),
                                                                                                body: Center(
                                                                                                  child: OutlinedButton(
                                                                                                    onPressed: () {
                                                                                                      // Action when the button is pressed
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(content: Text('OutlinedButton Pressed')),
                                                                                                      );
                                                                                                    },
                                                                                                    style: OutlinedButton.styleFrom(
                                                                                                      // primary: Colors.blue, // Text color
                                                                                                      side: BorderSide(color: Colors.blue, width: 2),
                                                                                                      // Border color and width
                                                                                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding
                                                                                                    ),
                                                                                                    child: Text('Click Me'),
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            : widgetId == 22
                                                                                                ? Scaffold(
                                                                                                    appBar: AppBar(
                                                                                                        backgroundColor: Colors.black45,
                                                                                                        centerTitle: true,
                                                                                                        iconTheme: const IconThemeData(color: Colors.white),
                                                                                                        title: Text(
                                                                                                          "${title}",
                                                                                                          style: TextStyle(color: Colors.white),
                                                                                                        )),
                                                                                                    body: Column(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          color: Colors.red,
                                                                                                          height: 100,
                                                                                                          child: Center(
                                                                                                            child: Text(
                                                                                                              'Fixed Height',
                                                                                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          fit: FlexFit.tight,
                                                                                                          // This child will take 2 parts of the available space
                                                                                                          child: Container(
                                                                                                            color: Colors.green,
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'Flexible Height (2 parts)',
                                                                                                                style: TextStyle(color: Colors.white, fontSize: 20),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          // This child will take 1 part of the available space
                                                                                                          child: Container(
                                                                                                            color: Colors.blue,
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'Flexible Height (1 part)',
                                                                                                                style: TextStyle(color: Colors.white, fontSize: 20),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  )
                                                                                                : widgetId == 23
                                                                                                    ? Scaffold(
                                                                                                        appBar: AppBar(
                                                                                                            backgroundColor: Colors.black45,
                                                                                                            centerTitle: true,
                                                                                                            iconTheme: const IconThemeData(color: Colors.white),
                                                                                                            title: Text(
                                                                                                              "${title}",
                                                                                                              style: TextStyle(color: Colors.white),
                                                                                                            )),
                                                                                                        body: Stepper(
                                                                                                          currentStep: index,
                                                                                                          onStepCancel: () {
                                                                                                            if (index > 0) {
                                                                                                              setState(() {
                                                                                                                index -= 1;
                                                                                                              });
                                                                                                            }
                                                                                                          },
                                                                                                          onStepContinue: () {
                                                                                                            if (index <= 0) {
                                                                                                              setState(() {
                                                                                                                index += 1;
                                                                                                              });
                                                                                                            }
                                                                                                          },
                                                                                                          onStepTapped: (int index) {
                                                                                                            setState(() {
                                                                                                              index = index;
                                                                                                            });
                                                                                                          },
                                                                                                          steps: [
                                                                                                            Step(
                                                                                                              title: const Text('Step 1 title'),
                                                                                                              content: Container(
                                                                                                                alignment: Alignment.centerLeft,
                                                                                                                child: const Text('Content for Step 1'),
                                                                                                              ),
                                                                                                            ),
                                                                                                            const Step(
                                                                                                              title: Text('Step 2 title'),
                                                                                                              content: Text('Content for Step 2'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      )
                                                                                                    : widgetId == 24
                                                                                                        ? Scaffold(
                                                                                                            appBar: AppBar(
                                                                                                                backgroundColor: Colors.black45,
                                                                                                                centerTitle: true,
                                                                                                                iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                title: Text(
                                                                                                                  "${title}",
                                                                                                                  style: TextStyle(color: Colors.white),
                                                                                                                )),
                                                                                                            body: Center(
                                                                                                              child: Column(
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Visibility(
                                                                                                                    visible: isVisible,
                                                                                                                    maintainSize: true,
                                                                                                                    maintainAnimation: true,
                                                                                                                    maintainState: true,
                                                                                                                    child: Container(
                                                                                                                      color: Colors.blue,
                                                                                                                      width: 200,
                                                                                                                      height: 100,
                                                                                                                      child: Center(
                                                                                                                        child: Text(
                                                                                                                          'I am visible!',
                                                                                                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  SizedBox(height: 20),
                                                                                                                  ElevatedButton(
                                                                                                                    onPressed: () {
                                                                                                                      setState(() {
                                                                                                                        isVisible = !isVisible; // Toggle visibility
                                                                                                                      });
                                                                                                                    },
                                                                                                                    child: Text(isVisible ? 'Hide' : 'Show'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ))
                                                                                                        : widgetId == 25
                                                                                                            ? Scaffold(
                                                                                                                appBar: AppBar(
                                                                                                                    backgroundColor: Colors.black45,
                                                                                                                    centerTitle: true,
                                                                                                                    iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                    title: Text(
                                                                                                                      "${title}",
                                                                                                                      style: TextStyle(color: Colors.white),
                                                                                                                    )),
                                                                                                                body: Column(
                                                                                                                  children: [
                                                                                                                    const ExpansionTile(
                                                                                                                      title: Text('ExpansionTile 1'),
                                                                                                                      subtitle: Text('Trailing expansion arrow icon'),
                                                                                                                      children: [
                                                                                                                        ListTile(title: Text('This is tile number 1')),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    ExpansionTile(
                                                                                                                      title: const Text('ExpansionTile 2'),
                                                                                                                      subtitle: const Text('Custom expansion arrow icon'),
                                                                                                                      trailing: Icon(
                                                                                                                        customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
                                                                                                                      ),
                                                                                                                      children: const [
                                                                                                                        ListTile(title: Text('This is tile number 2')),
                                                                                                                      ],
                                                                                                                      onExpansionChanged: (bool expanded) {
                                                                                                                        setState(() {
                                                                                                                          customTileExpanded = expanded;
                                                                                                                        });
                                                                                                                      },
                                                                                                                    ),
                                                                                                                    const ExpansionTile(
                                                                                                                      title: Text('ExpansionTile 3'),
                                                                                                                      subtitle: Text('Leading expansion arrow icon'),
                                                                                                                      controlAffinity: ListTileControlAffinity.leading,
                                                                                                                      children: [
                                                                                                                        ListTile(title: Text('This is tile number 3')),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              )
                                                                                                            : widgetId == 26
                                                                                                                ? Scaffold(
                                                                                                                    appBar: AppBar(
                                                                                                                        backgroundColor: Colors.black45,
                                                                                                                        centerTitle: true,
                                                                                                                        iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                        title: Text(
                                                                                                                          "${title}",
                                                                                                                          style: TextStyle(color: Colors.white),
                                                                                                                        )),
                                                                                                                    body: Padding(
                                                                                                                      padding: const EdgeInsets.all(16.0),
                                                                                                                      child: Column(
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'Selectable Chips:',
                                                                                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                                                          ),
                                                                                                                          Wrap(
                                                                                                                            spacing: 8.0,
                                                                                                                            children: [
                                                                                                                              ChoiceChip(
                                                                                                                                label: Text('Chip 1'),
                                                                                                                                selected: false,
                                                                                                                                onSelected: (selected) {
                                                                                                                                  // Handle selection
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              ChoiceChip(
                                                                                                                                label: Text('Chip 2'),
                                                                                                                                selected: true,
                                                                                                                                onSelected: (selected) {
                                                                                                                                  // Handle selection
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              ChoiceChip(
                                                                                                                                label: Text('Chip 3'),
                                                                                                                                selected: false,
                                                                                                                                onSelected: (selected) {
                                                                                                                                  // Handle selection
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          SizedBox(height: 20),
                                                                                                                          Text(
                                                                                                                            'Action Chips:',
                                                                                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                                                          ),
                                                                                                                          Wrap(
                                                                                                                            spacing: 8.0,
                                                                                                                            children: [
                                                                                                                              ActionChip(
                                                                                                                                label: Text('Action 1'),
                                                                                                                                onPressed: () {
                                                                                                                                  // Handle action
                                                                                                                                  print('Action 1 pressed');
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              ActionChip(
                                                                                                                                label: Text('Action 2'),
                                                                                                                                onPressed: () {
                                                                                                                                  // Handle action
                                                                                                                                  print('Action 2 pressed');
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          SizedBox(height: 20),
                                                                                                                          Text(
                                                                                                                            'Filter Chips:',
                                                                                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                                                          ),
                                                                                                                          Wrap(
                                                                                                                            spacing: 8.0,
                                                                                                                            children: [
                                                                                                                              FilterChip(
                                                                                                                                label: Text('Filter 1'),
                                                                                                                                selected: false,
                                                                                                                                onSelected: (selected) {
                                                                                                                                  // Handle filter
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              FilterChip(
                                                                                                                                label: Text('Filter 2'),
                                                                                                                                selected: true,
                                                                                                                                onSelected: (selected) {
                                                                                                                                  // Handle filter
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  )
                                                                                                                : widgetId == 27
                                                                                                                    ? Scaffold(
                                                                                                                        appBar: AppBar(
                                                                                                                            backgroundColor: Colors.black45,
                                                                                                                            centerTitle: true,
                                                                                                                            iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                            title: Text(
                                                                                                                              "${title}",
                                                                                                                              style: TextStyle(color: Colors.white),
                                                                                                                            )),
                                                                                                                        body: Center(
                                                                                                                          child: CircularProgressIndicator(
                                                                                                                            semanticsLabel: "Loading",
                                                                                                                            strokeWidth: 2.5,
                                                                                                                            backgroundColor: Colors.teal,
                                                                                                                            color: Colors.purple,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    : widgetId == 28
                                                                                                                        ? Scaffold(
                                                                                                                            appBar: AppBar(
                                                                                                                                backgroundColor: Colors.black45,
                                                                                                                                centerTitle: true,
                                                                                                                                iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                title: Text(
                                                                                                                                  "${title}",
                                                                                                                                  style: TextStyle(color: Colors.white),
                                                                                                                                )),
                                                                                                                            body: ReorderableListView(
                                                                                                                              onReorder: (oldIndex, newIndex) {
                                                                                                                                setState(() {
                                                                                                                                  if (newIndex > oldIndex) {
                                                                                                                                    newIndex--;
                                                                                                                                  }
                                                                                                                                  final String item = items.removeAt(oldIndex);
                                                                                                                                  items.insert(newIndex, item);
                                                                                                                                });
                                                                                                                              },
                                                                                                                              children: [
                                                                                                                                for (final item in items)
                                                                                                                                  ListTile(
                                                                                                                                    key: ValueKey(item),
                                                                                                                                    title: Text(item),
                                                                                                                                  ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        : widgetId == 29
                                                                                                                            ? Scaffold(
                                                                                                                                appBar: AppBar(
                                                                                                                                    backgroundColor: Colors.black45,
                                                                                                                                    centerTitle: true,
                                                                                                                                    iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                    title: Text(
                                                                                                                                      "${title}",
                                                                                                                                      style: TextStyle(color: Colors.white),
                                                                                                                                    )),
                                                                                                                                body: Container(
                                                                                                                                  child: Row(
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Column(
                                                                                                                                          children: [Text("Hellow World")],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Expanded(
                                                                                                                                        flex: 2,
                                                                                                                                        child: Column(
                                                                                                                                          children: [
                                                                                                                                            Text("This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is ")
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      )
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ))
                                                                                                                            : widgetId == 31
                                                                                                                                ? Scaffold(
                                                                                                                                    appBar: AppBar(
                                                                                                                                        backgroundColor: Colors.black45,
                                                                                                                                        centerTitle: true,
                                                                                                                                        iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                        title: Text(
                                                                                                                                          "$title",
                                                                                                                                          style: TextStyle(color: Colors.white),
                                                                                                                                        )),
                                                                                                                                    body: CustomScrollView(
                                                                                                                                      slivers:[
                                                                                                                                        SliverAppBar(
                                                                                                                                          expandedHeight: 200.0,
                                                                                                                                          flexibleSpace: FlexibleSpaceBar(
                                                                                                                                            title: Text('SliverAppBar'),
                                                                                                                                            background: Image.network(
                                                                                                                                              'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg',
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        SliverList(
                                                                                                                                          delegate: SliverChildBuilderDelegate(
                                                                                                                                            (BuildContext context, int index) {
                                                                                                                                              return ListTile(
                                                                                                                                                leading: Icon(Icons.star),
                                                                                                                                                title: Text('List Item $index'),
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                            childCount: 10, // Number of items
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        SliverGrid(
                                                                                                                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                                                            crossAxisCount: 2,
                                                                                                                                            childAspectRatio: 3,
                                                                                                                                          ),
                                                                                                                                          delegate: SliverChildBuilderDelegate(
                                                                                                                                            (BuildContext context, int index) {
                                                                                                                                              return Card(
                                                                                                                                                child: Center(
                                                                                                                                                  child: Text('Grid Item $index'),
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                            childCount: 10, // Number of grid items
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  )
                                                                                                                                : widgetId == 30
                                                                                                                                    ? Scaffold(
                                                                                                                                        appBar: AppBar(
                                                                                                                                            backgroundColor: Colors.black45,
                                                                                                                                            centerTitle: true,
                                                                                                                                            iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                            title: Text(
                                                                                                                                              "${title}",
                                                                                                                                              style: TextStyle(color: Colors.white),
                                                                                                                                            )),
                                                                                                                                        body: Center(
                                                                                                                                          child: Wrap(
                                                                                                                                            spacing: 8.0,
                                                                                                                                            // Horizontal space between children
                                                                                                                                            runSpacing: 8.0,
                                                                                                                                            // Vertical space between lines
                                                                                                                                            alignment: WrapAlignment.start,
                                                                                                                                            // Alignment of the children
                                                                                                                                            children: List.generate(10, (index) {
                                                                                                                                              return Chip(
                                                                                                                                                label: Text('Item $index'),
                                                                                                                                              );
                                                                                                                                            }),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      )
                                                                                                                                    : widgetId == 32
                                                                                                                                        ? Scaffold(
                                                                                                                                            appBar: AppBar(
                                                                                                                                                backgroundColor: Colors.black45,
                                                                                                                                                centerTitle: true,
                                                                                                                                                iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                                title: Text(
                                                                                                                                                  "${title}",
                                                                                                                                                  style: TextStyle(color: Colors.white),
                                                                                                                                                )),
                                                                                                                                            body: Center(
                                                                                                                                              child: ElevatedButton(
                                                                                                                                                  onPressed: () {
                                                                                                                                                    final snackBar = SnackBar(
                                                                                                                                                      content: const Text('i am SnackBar!'),
                                                                                                                                                      action: SnackBarAction(
                                                                                                                                                        label: 'Undo',
                                                                                                                                                        onPressed: () {
                                                                                                                                                          // Some code to undo the change.
                                                                                                                                                        },
                                                                                                                                                      ),
                                                                                                                                                    );

                                                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                                                                                                                  },
                                                                                                                                                  child: Text("Show SnakBar")),
                                                                                                                                            ),
                                                                                                                                          )
                                                                                                                                        : widgetId == 33
                                                                                                                                            ? Scaffold(
                                                                                                                                                appBar: AppBar(
                                                                                                                                                    backgroundColor: Colors.black45,
                                                                                                                                                    centerTitle: true,
                                                                                                                                                    iconTheme: const IconThemeData(color: Colors.white),
                                                                                                                                                    title: Text(
                                                                                                                                                      "${title}",
                                                                                                                                                      style: TextStyle(color: Colors.white),
                                                                                                                                                    )),
                                                                                                                                                body: GestureDetector(
                                                                                                                                                  onTap: () {
                                                                                                                                                    setState(() {
                                                                                                                                                      selected = !selected;
                                                                                                                                                    });
                                                                                                                                                  },
                                                                                                                                                  child: Center(
                                                                                                                                                    child: AnimatedContainer(
                                                                                                                                                      width: selected ? 200.0 : 100.0,
                                                                                                                                                      height: selected ? 100.0 : 200.0,
                                                                                                                                                      color: selected ? Colors.red : Colors.blue,
                                                                                                                                                      alignment:
                                                                                                                                                      selected ? Alignment.center : AlignmentDirectional.topCenter,
                                                                                                                                                      duration: const Duration(seconds: 2),
                                                                                                                                                      curve: Curves.bounceOut,
                                                                                                                                                      child: const FlutterLogo(size: 75),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              )
                                                                                                                                            : Scaffold();
  }
}
