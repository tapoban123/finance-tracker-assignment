abstract class BaseProviderModel {
  final bool isLoading;
  final bool isError;
  final String? errorMessage;

  const BaseProviderModel({
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
  });
}
