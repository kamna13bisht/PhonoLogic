import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

class WhiteboardScreen extends StatefulWidget {
  const WhiteboardScreen({Key? key}) : super(key: key);

  @override
  State<WhiteboardScreen> createState() => _WhiteboardScreenState();
}

class _WhiteboardScreenState extends State<WhiteboardScreen> {
  final WhiteBoardController _controller = WhiteBoardController();
  Color _selectedColor = Colors.black;
  double _strokeWidth = 3.0;

  final List<Color> _colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Writing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _controller.clear,
            tooltip: 'Clear Board',
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: _controller.undo,
            tooltip: 'Undo',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: WhiteBoard(
                controller: _controller,
                strokeWidth: _strokeWidth,
                strokeColor: _selectedColor,
                backgroundColor: Colors.white,
                isErasing: false,
              ),
            ),
          ),
          _buildColorPalette(),
          _buildStrokeSlider(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildColorPalette() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = _colors[index];
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _colors[index],
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedColor == _colors[index]
                      ? Colors.blue
                      : Colors.grey,
                  width: _selectedColor == _colors[index] ? 3 : 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStrokeSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.line_weight, size: 20),
          Expanded(
            child: Slider(
              value: _strokeWidth,
              min: 1.0,
              max: 20.0,
              divisions: 19,
              label: _strokeWidth.round().toString(),
              onChanged: (value) {
                setState(() {
                  _strokeWidth = value;
                });
              },
            ),
          ),
          Text('${_strokeWidth.round()}px'),
        ],
      ),
    );
  }
}