import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/apis/client.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:eletecapp/bloc/email_form_bloc.dart';
import 'package:eletecapp/bloc/user_bloc.dart';
import 'package:eletecapp/router/router.gr.dart';
import 'package:eletecapp/views/ifnone_widget.dart';
import 'package:eletecapp/views/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore_for_file: close_sinks

class FtechUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Stack(
      children: <Widget>[
        Center(
            child: FadeIn(
                child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.scaleDown))),
        Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: FadeInUp(
                child: LoadingBouncingGrid.square(
                    backgroundColor: Colors.indigoAccent, inverted: true)))
      ],
    ));
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExtendedNavigator(
        name: 'user',
        initialRoute: UserPageRoutes.userProfilePage,
      ),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Localization.of(context).userProfile),
          leading: BackButton(
            onPressed: () {
              context.navigator.root.pop();
            },
          ),
        ),
        body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: <Widget>[
              Card(
                child: ListBody(
                  children: <Widget>[
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: ListTile(
                          onTap: () => context.navigator.push('/photo'),
                          leading: Text(Localization.of(context).avatar),
                          trailing: Hero(
                            tag: 'photo',
                            child: Container(
                                width: 56,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                      image: state.user?.photo['thumbnail'] !=
                                              null
                                          ? NetworkImage(
                                              state.user?.photo['thumbnail'])
                                          : ExactAssetImage(
                                              'assets/images/user.png')),
                                )),
                          )),
                    ),
                    Divider(),
                    ListTile(
                        leading: Text(Localization.of(context).phoneNumber),
                        title: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${state.user.username}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.grey),
                            ))),
                    Divider(),
                    IfNoneWidget(
                      basis: state.user.email != null,
                      builder: (context) => ListTile(
                        leading: Text(Localization.of(context).email),
                        title: Container(
                            alignment: Alignment.centerRight,
                            child: Text('${state.user.email.email}')),
                        subtitle: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                '(${Localization.of(context).verfiy(state.user.email.verified)})')),
                        onTap: () {
                          ExtendedNavigator.of(context).push('/post/email');
                        },
                      ),
                      none: ListTile(
                          onTap: () {
                            ExtendedNavigator.of(context).push('/post/email');
                          },
                          leading: Text('${Localization.of(context).email}')),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(Localization.of(context).firstName),
                      title: Container(
                          alignment: Alignment.centerRight,
                          child: Text('${state.user.first_name}')),
                      onTap: () {
                        ExtendedNavigator.of(context).push('/post/first_name');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(Localization.of(context).lastName),
                      title: Container(
                          alignment: Alignment.centerRight,
                          child: Text('${state.user.last_name}')),
                      onTap: () {
                        ExtendedNavigator.of(context).push('/post/last_name');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('${Localization.of(context).joinUs}'),
                onPressed: () {},
              )
            ],
          );
        }));
  }
}

class UserPhotoPage extends StatefulWidget {
  @override
  _UserPhotoPageState createState() => _UserPhotoPageState();
}

class _UserPhotoPageState extends State<UserPhotoPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(context),
        child: Builder(
            builder: (context) => Theme(
                data: Theme.of(context).copyWith(
                    buttonTheme:
                        ButtonThemeData(textTheme: ButtonTextTheme.normal),
                    appBarTheme: AppBarTheme(
                        elevation: 0,
                        color: Colors.black,
                        iconTheme: IconThemeData(color: Colors.white),
                        textTheme: GoogleFonts.righteousTextTheme(
                          Theme.of(context).textTheme.apply(
                              displayColor: Colors.white,
                              bodyColor: Colors.white),
                        ),
                        brightness: Brightness.dark)),
                child: Scaffold(
                    key: _scaffoldKey,
                    appBar: AppBar(
                      title: Text(Localization.of(context).avatar),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {
                              _scaffoldKey.currentState.showBottomSheet<void>(
                                (_) {
                                  return Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          FlatButton(
                                            child: Text(Localization.of(context)
                                                .camera),
                                            onPressed: () async {
                                              await ImagePicker()
                                                  .getImage(
                                                      source:
                                                          ImageSource.camera)
                                                  .then((file) {
                                                if (file != null) {
                                                  return ImageCropper.cropImage(
                                                      sourcePath: file.path,
                                                      maxHeight: 400,
                                                      maxWidth: 400,
                                                      aspectRatio:
                                                          CropAspectRatio(
                                                              ratioX: 1.0,
                                                              ratioY: 1.0),
                                                      androidUiSettings:
                                                          AndroidUiSettings(
                                                              toolbarTitle:
                                                                  'Cropper',
                                                              toolbarColor: Colors
                                                                  .deepOrange,
                                                              toolbarWidgetColor:
                                                                  Colors.white,
                                                              initAspectRatio:
                                                                  CropAspectRatioPreset
                                                                      .original,
                                                              lockAspectRatio:
                                                                  false),
                                                      iosUiSettings:
                                                          IOSUiSettings(
                                                        minimumAspectRatio: 1.0,
                                                      )).then((value) {
                                                    if (value != null) {
                                                      Navigator.pop(context);
                                                      BlocProvider.of<UserBloc>(
                                                              context)
                                                          .add(UploadUserPhoto(
                                                              value));
                                                    }
                                                  });
                                                }
                                                return null;
                                              });
                                            },
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          FlatButton(
                                            child: Text(Localization.of(context)
                                                .gallery),
                                            onPressed: () async {
                                              await ImagePicker()
                                                  .getImage(
                                                      source:
                                                          ImageSource.gallery)
                                                  .then((file) {
                                                if (file != null) {
                                                  return ImageCropper.cropImage(
                                                      sourcePath: file.path,
                                                      maxHeight: 400,
                                                      maxWidth: 400,
                                                      aspectRatio:
                                                          CropAspectRatio(
                                                              ratioX: 1.0,
                                                              ratioY: 1.0),
                                                      androidUiSettings:
                                                          AndroidUiSettings(
                                                              toolbarTitle:
                                                                  'Cropper',
                                                              toolbarColor: Colors
                                                                  .deepOrange,
                                                              toolbarWidgetColor:
                                                                  Colors.white,
                                                              initAspectRatio:
                                                                  CropAspectRatioPreset
                                                                      .original,
                                                              lockAspectRatio:
                                                                  false),
                                                      iosUiSettings:
                                                          IOSUiSettings(
                                                        minimumAspectRatio: 1.0,
                                                      )).then((value) {
                                                    if (value != null) {
                                                      Navigator.pop(context);
                                                      BlocProvider.of<UserBloc>(
                                                              context)
                                                          .add(UploadUserPhoto(
                                                              value));
                                                    }
                                                  });
                                                }
                                                return null;
                                              });
                                            },
                                          ),
                                          Divider(
                                            height: 20,
                                            thickness: 6,
                                          ),
                                          FlatButton(
                                            child: Text(Localization.of(context)
                                                .cancel),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            })
                      ],
                    ),
                    body: BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                      return Stack(
                        children: <Widget>[
                          Center(
                              child: PhotoView(
                                  heroAttributes: const PhotoViewHeroAttributes(
                                      tag: "photo"),
                                  imageProvider:
                                      state.user?.photo['full_size'] != null
                                          ? NetworkImage(
                                              state.user?.photo['full_size'])
                                          : ExactAssetImage(
                                              'assets/images/user.png'))),
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              return Center(
                                  child: Visibility(
                                visible: state.isLoading,
                                child: CupertinoActivityIndicator(
                                  radius: 40,
                                ),
                              ));
                            },
                          )
                        ],
                      );
                    })))));
  }
}

class UserPostPage extends StatefulWidget {
  @override
  _UserEditPageState createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserPostPage> {
  @override
  Widget build(BuildContext context) {
    String field = RouteData.of(context).pathParams['field'].value;

    return BlocProvider<UserFormBloc>(
        create: (context) => UserFormBloc(context),
        child: Builder(builder: (context) {
          UserFormBloc formBloc = BlocProvider.of<UserFormBloc>(context);
          User user = BlocProvider.of<AppBloc>(context).state.user;
          String fieldValue() {
            switch (field) {
              case 'email':
                return user.email != null ? user.email.email : '';
              case 'first_name':
                return user.first_name;
              case 'last_name':
                return user.last_name;
            }
            return '';
          }

          String titleValue() {
            switch (field) {
              case 'email':
                return Localization.of(context).email;
              case 'first_name':
                return Localization.of(context).firstName;
              case 'last_name':
                return Localization.of(context).lastName;
            }
            return '';
          }

          return Scaffold(
              appBar: AppBar(title: Text(titleValue()), actions: <Widget>[
                FlatButton(
                  child: Text(Localization.of(context).submit),
                  onPressed: () {
                    formBloc.submit();
                  },
                )
              ]),
              body: FormBlocListener<UserFormBloc, String, String>(
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                  },
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    if (field == 'email') {
                      context.navigator
                          .push('/emailvalidate/${formBloc.field.value}');
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  onSubmitting: (context, state) {
                    LoadingDialog.show(context);
                  },
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    children: <Widget>[
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.field
                            ..updateInitialValue(fieldValue()),
                          onSubmitted: (value) {
                            formBloc.submit();
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: '',
                          )),
                    ],
                  )));
        }));
  }
}

class EmailValidatePage extends StatefulWidget {
  @override
  _EmailValidatePageState createState() => _EmailValidatePageState();
}

class _EmailValidatePageState extends State<EmailValidatePage> {
  @override
  Widget build(BuildContext context) {
    String value = RouteData.of(context).pathParams['email'].value;

    return BlocProvider<EmailFormBloc>(
        create: (context) => EmailFormBloc(context),
        child: Builder(builder: (context) {
          EmailFormBloc formBloc = BlocProvider.of<EmailFormBloc>(context);

          return Scaffold(
            appBar: AppBar(title: Text(value), actions: <Widget>[
              FlatButton(
                child: Text(Localization.of(context).submit),
                onPressed: () {
                  formBloc.submit();
                },
              )
            ]),
            body: FormBlocListener<EmailFormBloc, String, String>(
                onFailure: (context, state) {
                  LoadingDialog.hide(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);
                  context.navigator.popUntilPath('/');
                },
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Text(
                            Localization.of(context).code,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PinCodeTextField(
                          length: 4,
                          obsecureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          autoDisposeControllers: false,
                          onCompleted: (value) {
                            formBloc.submit();
                          },
                          onChanged: (value) {
                            formBloc.field.updateValue(value);
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                        BlocBuilder<TextFieldBloc, TextFieldBlocState>(
                            bloc: BlocProvider.of<EmailFormBloc>(context).field,
                            builder: (context, state) {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  state.error ?? '',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              );
                            }),
                      ],
                    ))),
          );
        }));
  }
}
