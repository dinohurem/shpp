import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shpp/responsive.dart';
import 'package:shpp/screens/about.dart';
import 'package:shpp/screens/about_details.dart';
import 'package:shpp/screens/contact.dart';
import 'package:shpp/screens/footer.dart';
import 'package:shpp/screens/landing.dart';
import 'package:shpp/screens/news.dart';
import 'package:shpp/screens/services.dart';
import 'package:shpp/screens/showcase.dart';
import 'package:shpp/shared/custom_divider.dart';
import 'package:shpp/shared/navbar_shell.dart';
import 'package:shpp/shared/router.dart';
import 'package:shpp/shared/size_config.dart';

GlobalKey _homeKey = GlobalKey();
GlobalKey _aboutKey = GlobalKey();
GlobalKey _servicesKey = GlobalKey();
GlobalKey _showcaseKey = GlobalKey();
GlobalKey _newsKey = GlobalKey();
GlobalKey _contactKey = GlobalKey();

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showShadow = false;

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
      body: Responsive(
        desktop: Container(
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
                NavbarShell(
                    showShadow: showShadow, action: _onNavbarOptionSelected),
                Expanded(
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: _onScroll,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          Landing(globalKey: _homeKey, aboutKey: _aboutKey),
                          const CustomDivider(),
                          About(globalKey: _aboutKey),
                          const CustomDivider(),
                          const AboutDetails(),
                          const CustomDivider(),
                          Services(globalKey: _servicesKey),
                          const CustomDivider(),
                          Showcase(globalKey: _showcaseKey),
                          const CustomDivider(),
                          News(globalKey: _newsKey),
                          const CustomDivider(),
                          Contact(globalKey: _contactKey),
                          const CustomDivider(),
                          Footer(
                            onOptionSelected: _onNavbarOptionSelected,
                          ),
                          const CustomDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        tablet: Container(
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
                // NavbarShell(
                //     showShadow: showShadow, action: _onNavbarOptionSelected),
                Expanded(
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: _onScroll,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          Landing(
                            globalKey: _homeKey,
                            aboutKey: _aboutKey,
                          ),
                          const CustomDivider(),
                          About(globalKey: _aboutKey),
                          const CustomDivider(),
                          // ignore: prefer_const_constructors
                          AboutDetails(),
                          const CustomDivider(),
                          Services(globalKey: _servicesKey),
                          const CustomDivider(),
                          Showcase(globalKey: _showcaseKey),
                          const CustomDivider(),
                          News(globalKey: _newsKey),
                          const CustomDivider(),
                          Contact(globalKey: _contactKey),
                          const CustomDivider(),
                          Footer(
                            onOptionSelected: _onNavbarOptionSelected,
                          ),
                          const CustomDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        mobile: Container(
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
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                //NavbarShell(showShadow: showShadow, action: _onNavbarOptionSelected),
                Expanded(
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: _onScroll,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          Landing(
                            globalKey: _homeKey,
                            aboutKey: _aboutKey,
                          ),
                          const CustomDivider(),
                          About(globalKey: _aboutKey),
                          const CustomDivider(),
                          const AboutDetails(),
                          const CustomDivider(),
                          Services(globalKey: _servicesKey),
                          const CustomDivider(),
                          Showcase(globalKey: _showcaseKey),
                          const CustomDivider(),
                          News(globalKey: _newsKey),
                          const CustomDivider(),
                          Contact(globalKey: _contactKey),
                          const CustomDivider(),
                          Footer(
                            onOptionSelected: _onNavbarOptionSelected,
                          ),
                          const CustomDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
