import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String title = "Home";

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint(title);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.pinkAccent, Colors.blue])),
              ),
              centerTitle: true,
              title: Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                height: 50,
                child: (title == "Home")
                    ? TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: "WorkSansLight",
                        fontSize: 11.0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type here to search'),
                )
                    :
                Center(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : <Widget>[
                      Container(
                        child : Text(title),
                      ),
                      Container(
                        child : (title == "CreatePost") ?
                        Text("Post"):Text(""),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              FirstTab(),
              MyBody(title),
              CreateUser(),
              MyBody(title),
              MyBody(title)
            ],
            controller: tabController,
          ),
          bottomNavigationBar: Material(
            color: Colors.white,
            child: TabBar(
              onTap: (indedx) {
                if (indedx == 0) {
                  setState(() {
                    title = "Home";
                  });
                } else if (indedx == 1) {
                  setState(() {
                    title = "Communities";
                  });
                } else if (indedx == 2) {
                  setState(() {
                    title = "CreatePost";
                  });
                } else if (indedx == 3) {
                  setState(() {
                    title = "Notifications";
                  });
                } else if (indedx == 4) {
                  setState(() {
                    title = "Profile";
                  });
                }
              },
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,

              tabs: <Widget>[
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.people),),
                Tab(icon: Icon(Icons.add_box),),
                Tab(icon: Icon(Icons.notifications),),
                Tab(icon: Icon(Icons.person),),
              ],
              controller: tabController,
            ),
          ),
        ));
  }
}

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: new TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Tab(text: "FEED",),
                Tab(text: "COMUNITY",),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            ComunityPage(),
          ],
        ),
      ),
    );
  }
}

class CreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'Dob',
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: null,
                )),
          ],
        ),
      ),
    );
  }
}

class ComunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.people, size: 50),
                    title: Text('Sahat'),
                    subtitle: Text('xxxxxxxxxx'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.people, size: 50),
                    title: Text('Sahat'),
                    subtitle: Text('xxxxxxxxxx'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.people, size: 50),
                    title: Text('Sahat'),
                    subtitle: Text('xxxxxxxxxx'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.people, size: 50),
                    title: Text('Sahat'),
                    subtitle: Text('xxxxxxxxxx'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1),
        itemBuilder: (context, index) {
          return Container(
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey, width: 1.0)),
            padding: const EdgeInsets.all(5),
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.network('https://img.icons8.com/officel/80/000000/conference-call.png'),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border,
                              color: Colors.pink,
                              size: 11.0,
                            ),
                            Text(' 46',
                              style: new TextStyle(
                                fontSize: 11.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                        size: 11.0,
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Title Description",
                      style: new TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.network('https://img.icons8.com/plasticine/24/000000/user-male-circle.png'),
                        Text(
                          'Sahat ',
                          style: new TextStyle(
                            fontSize: 10.0,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.fiber_manual_record,
                          color: Colors.black,
                          size: 5.0,
                        ),
                        Text(
                          ' full name ',
                          style: new TextStyle(
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  final String title;

  MyBody(this.title);

  final mySnackBar = SnackBar(
    content: Text(
      "Hello There!",
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (title == "Communities")
            Text(title)
          else if (title == "CreatePost")
            CreateUser()
          else if (title == "Notifications")
              Text(title)
        ],
      ),
    );
  }
}
