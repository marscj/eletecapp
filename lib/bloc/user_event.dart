part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UploadUserPhoto extends AppEvent {
  final File file;

  UploadUserPhoto(this.file);

  @override
  List<Object> get props => throw UnimplementedError();
}
