part of 'restaurants_cubit.dart';


class RestaurantsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const RestaurantsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,

  });
}
