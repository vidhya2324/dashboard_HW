import 'package:dashboardca/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'meeting_page.dart';
//import 'bottom_nav.dart';
import '../widgets/more_overlay.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _currentIndex = 0;
  bool _showMore = false;

  final pages = const [
    DashboardPage(),
    Center(child: Text('Appointments')),
    MeetingPage(),
    Center(child: Text('Compliance')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[_currentIndex < pages.length ? _currentIndex : 0],

          // if (_showMore)
          //   GestureDetector(
          //     onTap: () => setState(() => _showMore = false),
          //     child: Container(
          //       color: Colors.transparent,
          //       child: MoreOverlay(
          //         onClose: () => setState(() => _showMore = false),
          //       ),
          //     ),
          //   ),


          if (_showMore)
            MoreOverlay(
              onClose: () {
                setState(() => _showMore = false);
              },
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: BottomNavBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    _showMore = false;
                  });
                },
                onMoreTap: () {
                  setState(() {
                    _currentIndex = 4; //  THIS IS THE KEY
                    _showMore = !_showMore;
                  });
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
