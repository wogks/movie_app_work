import 'package:flutter/material.dart';
import 'package:movie_search/domain/presentation/main_screen/main_view_model.dart';
import 'package:movie_search/domain/presentation/search_screen/search_screen.dart';
import 'package:movie_search/ui/movie_list/movie_list.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();
  @override
  void dispose() {
    final controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieList(movieList: viewModel.movieList, filterTitle: '상영중인 영화'),
              MovieList(
                  movieList: viewModel.sortedByRealseDate, filterTitle: '최신영화'),
              MovieList(
                  movieList: viewModel.sortedByVoteAverage, filterTitle: '평점순'),
              MovieList(movieList: viewModel.sortedByTitle, filterTitle: '이름순'),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '라이센스',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
