abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminSuccess extends AdminState {
  final List<dynamic> productos;

  AdminSuccess(this.productos);
}

class AdminError extends AdminState {
  final String message;

  AdminError(this.message);
}