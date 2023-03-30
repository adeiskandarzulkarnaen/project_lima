import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_lima/modules/splash_screeen/splash_screen.dart ';

import '../models/news.dart';
import '../models/user.dart';
import '../modules/home_screen/home_screen.dart';
import '../modules/news_detail_screen/news_detail_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String newsDetail = 'news-detail';

  static Page _splashScreenBuilder(BuildContext context, GoRouterState state){
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state){
    late User user;
    
    // Jika tidak kosong isi dengan extra
    if (state.extra != null && state.extra is User) {
      user = state.extra! as User; // di identifikasi sebagai User
    } else {
      // jika kosong isi dengan data berikut
      // user = User(
      //   id: 002,
      //   name: "Ade Irfan Zaelani",
      //   username: "adeirfanzaelani",
      //   email: "adeirfanzaelani@gmail.com",
      //   profilePhoto: "https://avatars.githubusercontent.com/u/121000896?v=4",
      //   phoneNumber: "083113787777"
      // );
      user = User.dummy();
    }

    return MaterialPage(
      child: HomeScreen(
        user: user,
      ),
    );
  }

  static Page _newsScreenBuilder(BuildContext context, GoRouterState state){
    return MaterialPage(
      child: NewsDetailScreen(
        news: News.dummy(state.params["id"]!),
      ),
    );
  }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail:id",
            pageBuilder: _newsScreenBuilder 
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}