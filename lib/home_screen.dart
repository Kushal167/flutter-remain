import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_learning/item_provider.dart';
import 'package:riverpod_learning/search_provider.dart';
import 'package:riverpod_learning/slider_provider.dart';

import 'package:riverpod/riverpod.dart';

// PROVIDERS TO READ CONSTANT VALUES
// final hello = Provider<String>((ref) {
//   return 'This is Apple';
// });

// final counter = StateProvider<int>((ref) {
//   return 0;
// });

// final switchProvider = StateProvider<bool>((ref) {
//   return false;
// });

//-------------------------------------------------------------------------------

// 1. USING PROVIDER TO READ CONSTANT VALUES IN STATELESS WIDGET
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final greet = ref.watch(hello);
//     final yr = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Text(
//               greet,
//               style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '$yr',
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 2. USING PROVIDER IN STATEFUL WIDGET
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final greet = ref.watch(hello);
//     final yr = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Text(
//               greet + " " + yr.toString(),
//               style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 3. REBUILDING SPECIFIC WIDGET WHEN THE DATA (STATE) CHANGES IN STATELESS WIDGET
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('build');
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Consumer(
//               builder: ((context, ref, child) {
//                 final count = ref.watch(counter);
//                 print('build2');
//                 return Text(
//                   count.toString(),
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 );
//               }),
//             ),

//             Consumer(
//               builder: ((context, ref, child) {
//                 final count = ref.watch(switchProvider);
//                 print('build3');
//                 return Switch(
//                   value: count,
//                   onChanged: (val) {
//                     ref.read(switchProvider.notifier).state = val;
//                   },
//                 );
//               }),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(counter.notifier).state++;
//                   },
//                   child: Text('+'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(counter.notifier).state--;
//                   },
//                   child: Text('-'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 4. REBUILDING SPECIFIC WIDGET WHEN THE DATA (STATE) CHANGES IN STATEFULL WIDGET
// class HomeScreen extends ConsumerStatefulWidget {
//   const new({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Consumer(
//               builder: ((context, ref, child) {
//                 final count = ref.watch(counter);
//                 print('build2');
//                 return Text(
//                   count.toString(),
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 );
//               }),
//             ),

//             Consumer(
//               builder: ((context, ref, child) {
//                 final count = ref.watch(switchProvider);
//                 print('build3');
//                 return Switch(
//                   value: count,
//                   onChanged: (val) {
//                     ref.read(switchProvider.notifier).state = val;
//                   },
//                 );
//               }),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(counter.notifier).state++;
//                   },
//                   child: Text('+'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(counter.notifier).state--;
//                   },
//                   child: Text('-'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 5. REBUILDING EACH WIDGET WHEN THE DATA CHANGES
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('Build');
//     return Scaffold(
//       appBar: AppBar(title: Text('Counter App')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Consumer(
//             builder: ((context, ref, child) {
//               final slider = ref.watch(
//                 silderProvider.select((state) => state.showPassword),
//               );
//               print('icon');

//               return InkWell(
//                 onTap: () {
//                   ref.read(silderProvider.notifier).state = ref
//                       .read(silderProvider.notifier)
//                       .state
//                       .copyWith(showPassword: !slider);
//                 },
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   child: slider
//                       ? Icon(Icons.remove_red_eye)
//                       : Icon(Icons.block),
//                 ),
//               );
//             }),
//           ),
//           Consumer(
//             builder: ((context, ref, child) {
//               final slider = ref.watch(
//                 silderProvider.select((state) => state.slider),
//               );
//               print('Contaainer');

//               return Container(
//                 height: 200,
//                 width: 200,
//                 color: Colors.red.withValues(alpha: slider),
//               );
//             }),
//           ),
//           Consumer(
//             builder: ((context, ref, child) {
//               final slider = ref.watch(
//                 silderProvider.select((state) => state.slider),
//               );
//               print('Slider');

//               return Slider(
//                 value: slider,
//                 onChanged: (value) {
//                   // final stateProvider = ref.read(silderProvider.notifier);
//                   ref.read(silderProvider.notifier).state = ref
//                       .read(silderProvider.notifier)
//                       .state
//                       .copyWith(slider: value);
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final search = ref.watch(searchProvider);
//     return ProviderScope(
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Counter App')),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 ref.read(searchProvider.notifier).search(value);
//               },
//             ),
//             Consumer(
//               builder: ((context, ref, child) {
//                 final search = ref.watch(
//                   (searchProvider).select((state) => state.search),
//                 );
//                 print('Text built');

//                 return Text(search);
//               }),
//             ),
//             Consumer(
//               builder: ((context, ref, child) {
//                 final isChange = ref.watch(
//                   (searchProvider).select((state) => state.isChange),
//                 );
//                 print('Switch build');

//                 return Switch(
//                   value: isChange,
//                   onChanged: (value) {
//                     ref.read(searchProvider.notifier).onChange(value);
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// TextField(
//             onChanged: (value) {
//               ref.read(searchProvider.notifier).search(value);
//             },
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final search = ref.watch(searchProvider);

//               return Text(search.search);
//             },
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final search = ref.watch(searchProvider);

//               return Switch(
//                 value: search.isChange,
//                 onChanged: (value) {
//                   ref.read(searchProvider.notifier).onChange(value);
//                 },
//               );
//             },
//           ),
//         ],

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Counter App'))),
      body: item.isEmpty
          ? Center(child: Text('List Empty'))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final itemDetail = item[index];
                return ListTile(
                  title: Text(itemDetail.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .updateItem(itemDetail.id, 'updated Item');
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).delete(itemDetail.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child: Text('+'),
      ),
    );
  }
}
