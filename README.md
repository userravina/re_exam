widgetId == 34 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body: PageView(
        controller: _pageController, // Set the controller
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Page 3',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ) : widgetId == 35 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body:  Center(
        child: Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: AnimatedBuilder(
              animation: animationController!,
              child: Container(
                height: 15.h,color: Colors.amber,
                width: 15.h,
                // child: Image.asset("assets/images"}"),
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: animationController!.value * 2 * pi,
                  child: child,
                );
              },
            )),
      ),
    ) : widgetId == 36 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body:  Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text('Selected Index: $selectedIndex'),
            ),
          ),
        ],
      ),

    ) : widgetId == 37 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return ["Apple", "Banana", "Cherry"]
                .where((option) => option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
                .toList();
          },
        ),
      ),
    ) :widgetId == 38 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body:Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            'https://via.placeholder.com/150',
            width: 150,
            height: 150,
          ),
        ),
      ),
    ) :widgetId == 39 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Image.network('https://via.placeholder.com/150'),
          ),
        ),
      ),
    ) : widgetId == 40 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body:Center(
        child: ClipOval(
          child: Image.network(
            'https://via.placeholder.com/150',
            width: 150,
            height: 150,
          ),
        ),
      ),
    ) : widgetId == 41 ? Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          )),
      body: PageView(
        controller: _pageController, // Set the controller
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Page 3',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ) : Scaffold();
    Widgets_Model(title: "PageView",id: 34),
    Widgets_Model(title: "Animated Builder",id: 35),
    Widgets_Model(title: "Navigation Roll",id: 36),
    Widgets_Model(title: "Auto Complete",id: 37),
    Widgets_Model(title: "ClipRRect",id: 38),
    Widgets_Model(title: "ClipRect",id: 39),
    Widgets_Model(title: "ClipOval",id: 40),
    Widgets_Model(title: "ClipPath",id: 41),
    Widgets_Model(title: "TextFormField",id: 42),
