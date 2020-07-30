import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:eletecapp/bloc/user_bloc.dart';
import 'package:eletecapp/router/router.gr.dart';
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
                      height: 100,
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
                        trailing: SizedBox(
                            width: 120,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${state.user.username}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.grey),
                                )))),
                    Divider(),
                    ListTile(
                      leading: Text(Localization.of(context).firstName),
                      trailing: SizedBox(
                          width: 120,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('${state.user.first_name}'))),
                      onTap: () {
                        ExtendedNavigator.of(context).push('/post/first_name');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(Localization.of(context).lastName),
                      trailing: SizedBox(
                          width: 120,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('${state.user.last_name}'),
                          )),
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
              RaisedButton(
                child: Text('shenq'),
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
    return BlocProvider<UserFormBloc>(
        create: (context) => UserFormBloc(context),
        child: Builder(builder: (context) {
          UserFormBloc formBloc = BlocProvider.of<UserFormBloc>(context);
          return Scaffold(
              appBar: AppBar(
                  title: Text(RouteData.of(context).pathParams['field'].value ==
                          'first_name'
                      ? Localization.of(context).firstName
                      : Localization.of(context).lastName),
                  actions: <Widget>[
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
                    Navigator.pop(context);
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
                            ..updateInitialValue(RouteData.of(context)
                                        .pathParams['field']
                                        .value ==
                                    'first_name'
                                ? BlocProvider.of<AppBloc>(context)
                                    .state
                                    .user
                                    .first_name
                                : BlocProvider.of<AppBloc>(context)
                                    .state
                                    .user
                                    .last_name),
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
