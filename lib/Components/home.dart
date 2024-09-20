import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donor = FirebaseFirestore.instance.collection("donor");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation App"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },  // Corrected here
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add, 
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: donor.snapshots(), 
        builder:(context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length  ,
              itemBuilder: (context, index){
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height:  80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 15,
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 30,
                              child: Text(donorSnap['blood'],
                              style: TextStyle(fontSize:  25),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(donorSnap['name'] ,style: TextStyle(
                            fontSize:  22,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text(donorSnap['phone'].toString(), style: TextStyle(fontSize:  18),)
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
          }
            return Container();
        })
    );
  }
}
