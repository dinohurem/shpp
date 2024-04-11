import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:shpp/responsive.dart';
import 'package:shpp/screens/about.dart';
import 'package:shpp/screens/about_details.dart';
import 'package:shpp/screens/contact.dart';
import 'package:shpp/screens/footer.dart';
import 'package:shpp/screens/landing.dart';
import 'package:shpp/screens/services.dart';
import 'package:shpp/screens/showcase/showcase.dart';
import 'package:shpp/shared/custom_divider.dart';
import 'package:shpp/shared/navbar_shell.dart';
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
  final ScrollController _scrollController = ScrollController();
  late ScrollToId scrollToId;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _showcaseKey = GlobalKey();
  final GlobalKey _newsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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
        setState(() {
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            curve: Curves.easeInOutCubic,
            duration: const Duration(seconds: 2),
          );
        });
        router.goNamed(AppRouteNames.home.name);
        break;
      case 1:
        _scrollToSection(_aboutKey);
        router.goNamed(AppRouteNames.about.name);
        break;
      case 2:
        _scrollToSection(_servicesKey);
        router.goNamed(AppRouteNames.services.name);
        break;
      case 3:
        _scrollToSection(_showcaseKey);
        router.goNamed(AppRouteNames.projects.name);
        break;
      case 4:
        _scrollToSection(_newsKey);
        router.goNamed(AppRouteNames.news.name);
        break;
      case 5:
        _scrollToSection(_contactKey);
        router.goNamed(AppRouteNames.contact.name);
        break;
    }
  }

  void _onRouteChanged() {
    final location = router.routerDelegate.currentConfiguration.uri.toString();
    if (location == '/home' || location == '/') {
      _scrollToSection(_homeKey);
    } else if (location == '/about') {
      _scrollToSection(_aboutKey);
    } else if (location == '/services') {
      _scrollToSection(_servicesKey);
    } else if (location == '/projects') {
      _scrollToSection(_showcaseKey);
    } else if (location == '/news') {
      _scrollToSection(_newsKey);
    } else if (location == '/contact') {
      _scrollToSection(_contactKey);
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

  void _scrollListener() {
    print(scrollToId.idPosition());
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(_onRouteChanged);
    // _homeKey.currentState!.dispose();
    // _aboutKey.currentState!.dispose();
    // _servicesKey.currentState!.dispose();
    // _showcaseKey.currentState!.dispose();
    // _newsKey.currentState!.dispose();
    // _contactKey.currentState!.dispose();
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

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: _scrollController);
    _scrollController.addListener(_scrollListener);
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
                            // const CustomDivider(),
                            // News(globalKey: _newsKey),
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
          tablet: Container(color: Colors.red),
          mobile: Container(color: Colors.green)),
    );
  }
}
