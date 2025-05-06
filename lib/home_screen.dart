import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/live_score_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<LiveScoreModel> _liveScoreList = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool _inProgess = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _getLiveScoreList();
  // }
  //
  // Future<void> _getLiveScoreList() async {
  //   _liveScoreList.clear();
  //   _inProgess = true;
  //   setState(() {});
  //   final QuerySnapshot snapshot = await db.collection('football').get();
  //   for (QueryDocumentSnapshot doc in snapshot.docs) {
  //     LiveScoreModel liveScoreModel =
  //         LiveScoreModel.fromJson(doc.id, doc.data() as Map<String, dynamic>);
  //
  //     _liveScoreList.add(liveScoreModel);
  //   }
  //   _inProgess = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: StreamBuilder(
        stream: db.collection('football').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData == false) {
            return const SizedBox();
          }

          _liveScoreList.clear();
          for (QueryDocumentSnapshot doc in snapshot.data!.docs) {
            LiveScoreModel liveScoreModel = LiveScoreModel.fromJson(
                doc.id, doc.data() as Map<String, dynamic>);

            _liveScoreList.add(liveScoreModel);
          }

          return ListView.builder(
            itemCount: _liveScoreList.length,
            itemBuilder: (context, index) {
              LiveScoreModel liveScore = _liveScoreList[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      liveScore.isRunning ? Colors.green : Colors.grey,
                  radius: 8,
                ),
                title: Text(liveScore.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Team 1: ${liveScore.team1}'),
                    Text('Team 2: ${liveScore.team2}'),
                    Text('Winner Team: ${liveScore.winnerTeam}'),
                  ],
                ),
                trailing: Text(
                  '${liveScore.team1Score}:${liveScore.team2Score}',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LiveScoreModel liveScoreModel = LiveScoreModel(
              title: 'gervseng',
              team1: 'Germany',
              team2: 'England',
              team1Score: 3,
              team2Score: 1,
              winnerTeam: '',
              isRunning: true);
          db
              .collection('football')
              .doc(liveScoreModel.title)
              .set(liveScoreModel.toJson());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
