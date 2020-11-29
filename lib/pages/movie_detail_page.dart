import 'package:flutter/material.dart';

import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';
import '../widgets/runtime.dart';
import '../widgets/chip_genre.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar();
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError.message);
    }

    return ListView(
      children: [
        _buildCover(),
        _buildTitle(),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              _buildStatus(),
              _buildGenres(),
              _buildVerticalSpace(),
              _buildOverview(),
            ],
          ),
        )
      ],
    );
  }

  _buildTitle() {
    return Container(
      child: Text(
        _controller.movieDetail.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(10),
    );
  }

  _buildVerticalSpace({double height = 10.0}) {
    return SizedBox(height: height);
  }

  _buildOverview() {
    return Container(
      child: Text(
        _controller.movieDetail.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
    );
  }

  _buildStatus() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Rate(_controller.movieDetail.voteAverage),
            Runtime(_controller.movieDetail.runtime),
            ChipDate(date: _controller.movieDetail.releaseDate),
          ],
        ),
      ],
    );
  }

  _buildGenres() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        for (var genre in _controller.movieDetail.genres) ChipGenre(genre.name)
      ],
    );
  }

  _buildCover() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${_controller.movieDetail.backdropPath}',
    );
  }
}
