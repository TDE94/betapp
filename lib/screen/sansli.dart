import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class TekMac extends StatefulWidget {
  @override
  _TekMacState createState() => _TekMacState();
}

class _TekMacState extends State<TekMac> {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('sansli').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            actions: [
                              FlatButton(
                                child: Text('Kapat'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                            title: Text('Maç Analizi'),
                            content: Text(data['a1']),
                          ));
                    },
                    child: ListTile(
                      title: Text(data['m1']),
                      subtitle: Text(data['o1']),
                      trailing: Text(data['s1']),
                      leading: Text(data['ino1']),
                    ),
                  );
                },
              );
      },
    );
  }
}
