part of 'post_cubit.dart';

final class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  List<dynamic> posts = [];
  PostLoaded({required this.posts});
}

final class PostError extends PostState {
  String massage;
  PostError({required this.massage});
}
