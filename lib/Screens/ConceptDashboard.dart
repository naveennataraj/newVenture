import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iventure001/Widgets/NavigationBar.dart';

class ConceptDashBoard extends StatefulWidget {
  @override
  _ConceptDashBoardState createState() => _ConceptDashBoardState();
}

class _ConceptDashBoardState extends State<ConceptDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavigationBar(),
      ),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color(0xFFE95420),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Overview',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Customer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Solution',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Feedback',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Next Steps',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            children: _tiles,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
          )
        ],
      ),
    );
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];
List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth),
  const _Example01Tile(Colors.pink, Icons.battery_alert),
  const _Example01Tile(Colors.purple, Icons.desktop_windows),
  const _Example01Tile(Colors.blue, Icons.radio),
];

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
