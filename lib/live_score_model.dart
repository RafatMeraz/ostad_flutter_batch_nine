class LiveScoreModel {
  final String title;
  final String team1;
  final String team2;
  final int team1Score;
  final int team2Score;
  final String winnerTeam;
  final bool isRunning;

  LiveScoreModel(
      {required this.title,
      required this.team1,
      required this.team2,
      required this.team1Score,
      required this.team2Score,
      required this.winnerTeam,
      required this.isRunning});

  factory LiveScoreModel.fromJson(String docId, Map<String, dynamic> jsonData) {
    return LiveScoreModel(
      title: docId,
      team1: jsonData['team1'],
      team2: jsonData['team2'],
      team1Score: jsonData['team1_score'],
      team2Score: jsonData['team2_score'],
      winnerTeam: jsonData['winner_team'],
      isRunning: jsonData['isRunning'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team1': team1,
      'team2': team2,
      'team1_score': team1Score,
      'team2_score': team2Score,
      'winner_team': winnerTeam,
      'isRunning': isRunning
    };
  }
}
