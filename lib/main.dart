import 'package:flutter/material.dart';
import 'package:learn_flutter/app_routers.dart';

void main() {
  // Bloc.observer = MyObserver();
  runApp(BreakingBadApp());
}

class BreakingBadApp extends StatelessWidget {
  BreakingBadApp({super.key});
  final AppRouters appRouter = AppRouters();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
    );
  }
}

// class PostPage extends StatefulWidget {
//   const PostPage({super.key});

//   @override
//   State<PostPage> createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   @override
//   void initState() {
//     context.read<PostCubit>().getData();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PostCubit, PostState>(
//       bloc: BlocProvider.of<PostCubit>(context),

//       builder: (context, state) {
//         if (state is PostLoading) {
//           return const CircularProgressIndicator.adaptive();
//         } else if (state is PostLoaded) {
//           // Replace with your actual widget for loaded state
//           return ListView.builder(
//             itemCount: state.posts.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text("${state.posts[index]['name']}"),
//                 subtitle: Text("${state.posts[index]['email']}"),
//               );
//             },
//           );
//         } else if (state is PostError) {
//           return Center(child: Text(state.massage));
//         } else {
//           // Default widget if none of the above states match
//           return const Center(child: Text('No Data'));
//         }
//       },
//     );
//   }
// }
