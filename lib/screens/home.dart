import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shpp/screens/about.dart';
import 'package:shpp/screens/contact.dart';
import 'package:shpp/screens/footer.dart';
import 'package:shpp/screens/landing.dart';
import 'package:shpp/screens/navbar.dart';
import 'package:shpp/screens/news.dart';
import 'package:shpp/screens/services.dart';
import 'package:shpp/screens/showcase.dart';
import 'package:shpp/shared/router.dart';
import 'package:shpp/shared/size_config.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showShadow = false;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _showcaseKey = GlobalKey();
  final GlobalKey _newsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
          alignment: .5,
        );
      });
    }
  }

  void _onNavbarOptionSelected(int index) {
    switch (index) {
      case 0:
        _scrollToSection(_homeKey);
        router.go('/home');
        break;
      case 1:
        _scrollToSection(_aboutKey);
        router.go('/about');
        break;
      case 2:
        _scrollToSection(_servicesKey);
        router.go('/services');
        break;
      case 3:
        _scrollToSection(_showcaseKey);
        router.go('/projects');
        break;
      case 4:
        _scrollToSection(_newsKey);
        router.go('/news');
        break;
      case 5:
        _scrollToSection(_contactKey);
        router.go('/contact');
        break;
    }
  }

  void _onRouteChanged() {
    final location = router.routerDelegate.currentConfiguration.uri.toString();
    if (location == '/home' || location == '/') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    } else if (location == '/about') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    } else if (location == '/services') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    } else if (location == '/showcase') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    } else if (location == '/news') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    } else if (location == '/contact') {
      _scrollToSection(router.routerDelegate.navigatorKey);
    }
  }

  bool _onScroll(ScrollEndNotification notification) {
    if (notification.metrics.pixels <= 0 && showShadow) {
      setState(() {
        showShadow = false;
      });
    } else if (notification.metrics.pixels > 0 && !showShadow) {
      setState(() {
        showShadow = true;
      });
    }
    return showShadow;
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.routerDelegate.addListener(_onRouteChanged);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: showShadow
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                setState(() {
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    curve: Curves.easeInOutCubic,
                    duration: const Duration(seconds: 2),
                  );
                });
              },
              child: Icon(
                FontAwesomeIcons.chevronUp,
                color: Theme.of(context).primaryColorDark,
                size: SizeConfig.safeBlockVertical! * 2,
              ),
            )
          : null,
      body: Container(
        width: SizeConfig.safeBlockHorizontal! * 100,
        height: SizeConfig.safeBlockVertical! * 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 253, 252, 236),
                Theme.of(context).primaryColorLight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.1,
                0.6,
              ],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: !showShadow
                      ? null
                      : LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 253, 252, 236),
                            Theme.of(context).primaryColorLight,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [
                            0.1,
                            0.6,
                          ],
                          tileMode: TileMode.clamp),
                  boxShadow: !showShadow
                      ? null
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                          ),
                        ],
                ),
                child: Navbar(
                  onOptionSelected: _onNavbarOptionSelected,
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: _onScroll,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Landing(globalKey: _homeKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        About(globalKey: _aboutKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        Services(globalKey: _servicesKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        Showcase(globalKey: _showcaseKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        News(globalKey: _newsKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        Contact(globalKey: _contactKey),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                        Footer(
                          onOptionSelected: _onNavbarOptionSelected,
                        ),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                          indent: SizeConfig.safeBlockHorizontal! * 10,
                          endIndent: SizeConfig.safeBlockHorizontal! * 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
