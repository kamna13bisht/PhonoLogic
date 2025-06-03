import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class Learning extends StatelessWidget {
  const Learning({super.key});


  @override
  Widget build(BuildContext context) {
    final List<String> alphabets =
    List.generate(26, (index) => String.fromCharCode(65 + index));
    final colors = [
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.purple.shade100,
      Colors.orange.shade100,
      Colors.pink.shade100,
      Colors.teal.shade100,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Alphabets"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue.shade50],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemCount: alphabets.length,
          itemBuilder: (context, index) {
            final letter = alphabets[index];
            final color = colors[index % colors.length];

            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => LetterSheet(letter: letter),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        letter,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        letter.toLowerCase(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueGrey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LetterSheet extends StatefulWidget {
  final String letter;
  const LetterSheet({required this.letter, super.key});

  @override
  State<LetterSheet> createState() => _LetterSheetState();
}

class _LetterSheetState extends State<LetterSheet> {
  final Flutter3DController controller = Flutter3DController();
  bool isModelLoaded = false;
  double loadingProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    final String modelPath = 'assets/models/${widget.letter.toLowerCase()}.glb';

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Text(
            'Letter ${widget.letter}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Flutter3DViewer(
                    //   //If you pass 'true' the flutter_3d_controller will add gesture interceptor layer
                    //   //to prevent gesture recognizers from malfunctioning on iOS and some Android devices.
                    //   //the default value is true
                    //   activeGestureInterceptor: true,
                    //   //If you don't pass progressBarColor, the color of defaultLoadingProgressBar will be grey.
                    //   //You can set your custom color or use [Colors.transparent] for hiding loadingProgressBar.
                    //   progressBarColor: Colors.orange,
                    //   //You can disable viewer touch response by setting 'enableTouch' to 'false'
                    //   enableTouch: true,
                    //   //This callBack will return the loading progress value between 0 and 1.0
                    //   onProgress: (double progressValue) {
                    //     debugPrint('model loading progress : $progressValue');
                    //   },
                    //   //This callBack will call after model loaded successfully and will return model address
                    //   onLoad: (String modelAddress) {
                    //     debugPrint('model loaded : $modelAddress');
                    //   },
                    //   //this callBack will call when model failed to load and will return failure error
                    //   onError: (String error) {
                    //     debugPrint('model failed to load : $error');
                    //   },
                    //   //You can have full control of 3d model animations, textures and camera
                    //   controller: controller,
                    //   src: 'assets/models/${widget.letter.toLowerCase()}.glb', //3D model with different animations
                    //   //src: 'assets/sheen_chair.glb', //3D model with different textures
                    //   //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                    // )
                    Flutter3DViewer(
                      src: 'assets/models/${widget.letter.toLowerCase()}.glb',
                      controller: controller,
                      activeGestureInterceptor: true,
                      enableTouch: true,
                      progressBarColor: Colors.orange,
                      onProgress: (progressValue) {
                        setState(() {
                          loadingProgress = progressValue;
                        });
                        debugPrint('model loading progress : $progressValue');
                      },
                      onLoad: (modelAddress) {
                        setState(() {
                          isModelLoaded = true;
                        });
                        debugPrint('model loaded : $modelAddress');

                        // Play first animation if available
                        controller.getAvailableAnimations().then((animations) {
                          if (animations.isNotEmpty) {
                            controller.playAnimation();
                          }
                        });
                      },
                      onError: (error) {
                        debugPrint('model failed to load : $error');
                      },
                    ),
                    if (!isModelLoaded)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: loadingProgress,
                              color: Colors.orange,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Loading ${(loadingProgress * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Close",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}