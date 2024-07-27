import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/data/response/status.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider/mvvm/view_model/home_view_model.dart';
import 'package:flutter_provider/mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchMovieListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return PopScope(
      onPopInvoked: (didPop) => false,
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Popular Movies."),
            backgroundColor: Colors.amber,
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                onTap: () {
                  userPreference.removeUser().then((value) {
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  });
                },
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
          body: ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Consumer<HomeViewModel>(
              builder: (context, value, _) {
                switch (value.movieList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return const Text("Error fetching movies list");
                  case Status.SUCCESS:
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              print(
                                  "movies ---->> ${value.movies[index].title}");
                              return Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: ListTile(
                                  leading: Image.network(
                                    value.movies[index].image,
                                    errorBuilder: (context, error, stack) {
                                      return const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                  title: Text(
                                    value.movies[index].title,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  subtitle:
                                      Text(value.movies[index].year.toString()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(value.movies[index].rating),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade700,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  default:
                    return const Text(
                      "The status is null, failed fetching result",
                    );
                }
              },
            ),
          )),
    );
  }
}
