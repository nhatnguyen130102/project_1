import 'package:flutter/material.dart';
import '../model/screening_model.dart';
import '../repository/screening_repository.dart';

class ScreeningListPage extends StatefulWidget {
  const ScreeningListPage({Key? key}) : super(key: key);

  @override
  _ScreeningListPageState createState() => _ScreeningListPageState();
}

class _ScreeningListPageState extends State<ScreeningListPage> {
  late String movieId = 'movie_2';
  late Future<List<ScreeningModel>> _screeningsFuture;
  late ScreeningRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = ScreeningRepository();
    _screeningsFuture = _repository.getScreeningsByMovieId(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screenings'),
      ),
      body: FutureBuilder<List<ScreeningModel>>(
        future: _screeningsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ScreeningModel screening = snapshot.data![index];
                return ListTile(
                  title: Text('Screening ID: ${screening.screeningID}'),
                  subtitle: Text('Start At: ${screening.startAt}\n'
                      'Cinema ID: ${screening.cinemaID}\n'
                      'Room Type ID: ${screening.roomTypeID}\n'
                      'Date: ${screening.date}'),
                  // You can customize the ListTile to display more information
                );
              },
            );
          } else {
            return Center(child: Text('No screenings available'));
          }
        },
      ),
    );
  }
}
