import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // for formatting the time
import '../states/app_state.dart';

class BookContentPage extends StatefulWidget {
  @override
  BookContentPageState createState() => BookContentPageState();
}

class BookContentPageState extends State<BookContentPage> {
  late final Future<List<String>> _pagesFuture;
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  String chapter = "Hoofdstuk 1";
  Duration readingTime = Duration.zero;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        readingTime += Duration(minutes: 1);
      });
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChange);
    _pageController.dispose();
    _currentPageNotifier.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _handlePageChange() {
    Provider.of<AppState>(context, listen: false).currentBookPage =
        _pageController.page!.round();
    _currentPageNotifier.value = _pageController.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final book = appState.currentBook;

    if (book == null) {
      return Center(child: Text('No book selected.'));
    } else {
      return FutureBuilder<List<String>>(
        future: appState.loadBookPages(book.title),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            List<String> pages = snapshot.data!;

            // Add post frame callback here
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              _pageController.jumpToPage(appState.currentBookPage);
            });

            return Scaffold(
              backgroundColor: Color.fromRGBO(255, 253, 208, 1),
              body: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        pages[index],
                        style: TextStyle(fontSize: 20, letterSpacing: 0.5),
                      ),
                    ),
                  );
                },
              ),
              bottomNavigationBar: BottomAppBar(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: _currentPageNotifier,
                        builder:
                            (BuildContext context, int value, Widget? child) {
                          return Text('${value + 1}/${pages.length}');
                        },
                      ),
                      SizedBox(height: 8.0),
                      Text("Boek: ${book.title}",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14)),
                      Text("Hoofdstuk: $chapter",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14)),
                      Text("Leestijd: ${_formatDuration(readingTime)}",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    }
  }

  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    return "${NumberFormat().format(minutes)} minuten";
  }
}
