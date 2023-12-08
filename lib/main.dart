import 'package:flutter/material.dart';

void main() {
  runApp(const MagnifierExampleApp());
}

class MagnifierExampleApp extends StatefulWidget {
  const MagnifierExampleApp({super.key});

  @override
  State<MagnifierExampleApp> createState() => _MagnifierExampleAppState();
}

class _MagnifierExampleAppState extends State<MagnifierExampleApp> {
  Offset dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Use the magnifier'),
              RepaintBoundary(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onPanUpdate: (DragUpdateDetails details) => setState(
                        () {
                          dragGesturePosition = details.localPosition;
                        },
                      ),
                      child: const FlutterLogo(size: 200),
                    ),
                    Positioned(
                      left: dragGesturePosition.dx,
                      top: dragGesturePosition.dy,
                      child: const RawMagnifier(
                        decoration: MagnifierDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.green, width: 4),
                          ),
                        ),
                        size: Size(150, 150),
                        magnificationScale: 2,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
