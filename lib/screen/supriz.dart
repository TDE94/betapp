import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Supriz extends StatefulWidget {
  @override
  _SuprizState createState() => _SuprizState();
}

class _SuprizState extends State<Supriz> {
  FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('süpriz').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  return ExpansionTile(
                    title: Text(
                      data['tarih'],
                    ),
                    trailing: Text(data['to']),
                    children: [
                      InkWell(
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
                      ),
                      Divider(),
                      InkWell(
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
                                content: Text(data['a2']),
                              ));
                        },
                        child: ListTile(
                          title: Text(data['m2']),
                          subtitle: Text(data['o2']),
                          trailing: Text(data['s2']),
                          leading: Text(data['ino2']),
                        ),
                      ),
                      Divider(),
                      InkWell(
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
                                content: Text(data['a3']),
                              ));
                        },
                        child: ListTile(
                          title: Text(data['m3']),
                          subtitle: Text(data['o3']),
                          trailing: Text(data['s3']),
                          leading: Text(data['ino3']),
                        ),
                      ),
                      Text(data['to'])
                    ],
                  );
                },
              );
      },
    );
  }
}
