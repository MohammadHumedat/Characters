import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void getData() async {
    emit(PostLoading());
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final List posts = json.decode(response.body);
        emit(PostLoaded(posts: posts));
      } else {
        emit(PostError(massage: "Error: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PostError(massage: "$e"));
    }
  }
}
