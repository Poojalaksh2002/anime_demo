import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimeToggler(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimeToggler extends StatefulWidget {
  const AnimeToggler({super.key});

  @override
  State<AnimeToggler> createState() => _AnimeTogglerState();
}

class _AnimeTogglerState extends State<AnimeToggler>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _widthAnimation;
  Animation<double>? _opacityAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 0, end: 150).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));

    _controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_isExpanded) {
      _controller!.reverse();
    } else {
      _controller!.forward();
    }
    _isExpanded = !_isExpanded;
  }

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Material(
              color: Colors.white,
              child: Container(
                height: 30,
                child: Row(
                  children: [
                    ClipRect(
                      child: Container(
                        height: 20,
                        // color: Colors.red,
                        width: _widthAnimation!.value,
                        child: Opacity(
                          opacity: _opacityAnimation!.value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              '9792526882',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: FloatingActionButton(
                        onPressed: _toggleAnimation,
                        child: Icon(
                          Icons.person_2_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: AnimeToggler()));
// }

// class AnimeToggler extends StatefulWidget {
//   const AnimeToggler({super.key});

//   @override
//   State<AnimeToggler> createState() => _AnimeTogglerState();
// }

// class _AnimeTogglerState extends State<AnimeToggler> {
//   bool _isExpanded = false;
//   void _toggleAnimation() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Material(
//               color: Colors.white,
//               child: Container(
//                 height: 30,
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ClipRect(
//                       child: AnimatedContainer(
//                         color: Colors.red,
//                         duration: Duration(milliseconds: 900),
//                         curve: Curves.easeInOut,
//                         alignment: _isExpanded
//                             ? Alignment.centerLeft
//                             : AlignmentDirectional.center,
//                         width: _isExpanded ? 150 : 0,
//                         child: _isExpanded
//                             ? Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 5.0),
//                                 child: Opacity(
//                                   opacity: _isExpanded
//                                       ? (_isExpanded ? 1.0 : 0.0)
//                                       : 0.0,
//                                   child: Text(
//                                     '9792526882',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ),
//                               )
//                             : SizedBox(width: 10),
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 30,
//                       child: FloatingActionButton(
//                         onPressed: _toggleAnimation,
//                         child: Icon(
//                           Icons.person_2_rounded,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
