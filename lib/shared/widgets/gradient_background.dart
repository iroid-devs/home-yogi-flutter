// import 'package:flutter/material.dart';



// class GradientBackground extends StatelessWidget {
//   /// 是否需要水波浪
//   final bool needWave;
//   final Widget? child;
//   final bool needTopSafeArea;
//   final bool needTopRadius;

//   GradientBackground({
//     Key? key,
//     this.needWave = true,
//     this.needTopSafeArea = true,
//     this.needTopRadius = false,
//     this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return needTopSafeArea
//         ? Container(
//             color: Theme.of(context).colorScheme.primaryContainer,
//             child: SafeArea(
//               child: _buildBackground(context),
//             ),
//           )
//         : _buildBackground(context);
//   }

//   Widget _buildBackground(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: needTopRadius
//                 ? BorderRadius.only(
//                     topLeft: Radius.circular(25.0),
//                     topRight: Radius.circular(25.0),
//                   )
//                 : null,
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               stops: [0.1, 0.9],
//               colors: [
//                 fromHex('#405FA3'),
//                 fromHex('#1ED69D'),
//               ],
//             ),
//           ),
//           child: child,
//         ),
//         if (needWave)
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: WaveWidget(
//               config: CustomConfig(
//                 gradients: [
//                   [fromHex('#2BA99F'), fromHex('#22CC9E')],
//                   [fromHex('#2BA99F'), fromHex('#3BCDAD')],
//                   [fromHex('#3CC8AE'), fromHex('#22C69E')],
//                   [fromHex('#55D5B1'), fromHex('#54D9B1')]
//                 ],
//                 durations: [35000, 19440, 10800, 6000],
//                 heightPercentages: [0.20, 0.23, 0.25, 0.30],
//                 blur: MaskFilter.blur(BlurStyle.solid, 1),
//                 gradientBegin: Alignment.bottomLeft,
//                 gradientEnd: Alignment.topRight,
//               ),
//               waveAmplitude: 20,
//               size: Size(
//                 MediaQuery.of(context).size.width,
//                 60.0,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
