import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eletecapp/apis/client.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

part 'user_event.dart';
part 'user_state.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: close_sinks

class UserBloc extends Bloc<UserEvent, UserState> {
  final BuildContext context;

  UserBloc(this.context) : super(UserState(isLoading: false));

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UploadUserPhoto) {
      AppBloc appBloc = BlocProvider.of<AppBloc>(context);

      yield UserState(isLoading: true);

      yield await RestService.instance
          .uploadPhoto(appBloc.state.user.id, event.file)
          .then((user) {
        appBloc.add(UpdateAppUser(user));
        return UserState(isLoading: false);
      }).catchError((onError) {
        return UserState(isLoading: false);
      });
    }
  }
}

class UserFormBloc extends FormBloc<String, String> {
  final TextFieldBloc first_name = TextFieldBloc();
  final TextFieldBloc last_name = TextFieldBloc();
  final TextFieldBloc email = TextFieldBloc();

  final BuildContext context;

  UserFormBloc(this.context) {
    addFieldBlocs(fieldBlocs: [first_name, last_name]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    first_name
        .addFieldError(errors['first_name'] ?? errors['non_field_errors']);
    last_name.addFieldError(errors['last_name'] ?? errors['non_field_errors']);
    email.addFieldError(errors['email'] ?? errors['non_field_errors']);
  }

  void addValidators() {
    email.addValidators(
        [EmailValidator(errorText: 'Email format is incorrect')]);
  }

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) {
    return super.mapEventToState(event);
  }

  @override
  void onSubmitting() {
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    RestService.instance.updateUser(
        appBloc.state.user.id, {'first_name': first_name.value}).then((user) {
      appBloc.add(UpdateAppUser(user));
      emitSuccess(canSubmitAgain: true);
    }).catchError((onError) {
      emitFailure();
      addErrors(onError?.response?.data);
    });
  }
}
