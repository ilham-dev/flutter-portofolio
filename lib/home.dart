import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:helloworld/pages/about.dart';
import 'package:helloworld/pages/portofolio.dart';
import 'package:helloworld/pages/profile.dart';
import 'package:helloworld/pages/repo.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final Profile _profile = Profile();
  final Portofolio _portofolio = Portofolio();
  final About _about = About();
  final Repo _repo = Repo();

  Widget _showPage = new Profile();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _profile;
        break;
      case 1:
        return _repo;
        break;
      case 2:
        return _portofolio;
        break;
      case 3:
        return _about;
        break;
      default:
        return _profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tapIndex) {
            setState(() {
              _showPage = _pageChooser(tapIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
