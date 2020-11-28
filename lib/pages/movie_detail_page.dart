import 'package:flutter/material.dart';

import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';
import '../widgets/runtime.dart';

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
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
    );
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
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              _buildStatus(),
              _buildVerticalSpace(),
              _buildGenresList(),
              _buildVerticalSpace(height: 15),
              _buildOverview(),
            ],
          ),
        )
      ],
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

  _buildGenresList() {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          for (var genre in _controller.movieDetail.genres)
            Container(
              child: Chip(
                label: Text(
                  '${genre.name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red.withOpacity(0.9),
              ),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            ),
        ],
      ),
    );
  }

  _buildCover() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${_controller.movieDetail.backdropPath}',
    );
  }
}
