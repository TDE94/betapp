import 'package:flutter/material.dart';
import 'package:iddaa_kazanc/screen/sansli.dart';
import 'package:iddaa_kazanc/screen/settings.dart';
import 'package:iddaa_kazanc/screen/banko.dart';
import 'package:iddaa_kazanc/screen/supriz.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iddaa Kazancım"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.blueGrey,
          tabs: [
            Tab(child: Text('Banko')),
            Tab(child: Text('Tek Maç')),
            Tab(child: Text('Sürpriz')),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Iddaa Bülteni'),
        onPressed: () {
          iddaaGit();
        },
      ),
      body: TabBarView(
        children: [
          Banko(),
          TekMac(),
          Supriz(),
        ],
        controller: _tabController,
      ),
    );
  }

  iddaaGit() async {
    const url = 'https://www.iddaa.com/futbol-programi';
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: true, forceSafariVC: false, enableJavaScript: true);
    } else {
      throw 'Url Bulunamadı $url';
    }
  }
}
