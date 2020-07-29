import 'package:animate_do/animate_do.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:eletecapp/bloc/user_bloc.dart';
import 'package:eletecapp/router/router.dart';
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

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER PROFILE'),
      ),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return ListView(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: ListBody(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: ListTile(
                        onTap: () => Router.instance
                            .navigateTo(context, Routes.userPhoto),
                        leading: Text('avatar'),
                        trailing: Hero(
                          tag: 'photo',
                          child: Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                    image:
                                        state.user?.photo['thumbnail'] != null
                                            ? NetworkImage(
                                                state.user?.photo['thumbnail'])
                                            : ExactAssetImage(
                                                'assets/images/user.png')),
                              )),
                        )),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Fisrt Name'),
                    trailing: Text('${state.user.first_name}'),
                    onTap: () {
                      Router.instance.navigateTo(context, Routes.userEdit);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Last Name'),
                    trailing: Text('${state.user.last_name}'),
                    onTap: () {
                      Router.instance.navigateTo(context, Routes.userEdit);
                    },
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
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
    return Theme(
        data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.black,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: GoogleFonts.righteousTextTheme(
                  Theme.of(context).textTheme.apply(
                      displayColor: Colors.white, bodyColor: Colors.white),
                ),
                brightness: Brightness.dark)),
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Avatar'),
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
                                    child: Text('Camera'),
                                    onPressed: () async {
                                      await ImagePicker()
                                          .getImage(source: ImageSource.camera)
                                          .then((file) {
                                        if (file != null) {
                                          return ImageCropper.cropImage(
                                              sourcePath: file.path,
                                              maxHeight: 400,
                                              maxWidth: 400,
                                              aspectRatio: CropAspectRatio(
                                                  ratioX: 1.0, ratioY: 1.0),
                                              androidUiSettings:
                                                  AndroidUiSettings(
                                                      toolbarTitle: 'Cropper',
                                                      toolbarColor:
                                                          Colors.deepOrange,
                                                      toolbarWidgetColor:
                                                          Colors.white,
                                                      initAspectRatio:
                                                          CropAspectRatioPreset
                                                              .original,
                                                      lockAspectRatio: false),
                                              iosUiSettings: IOSUiSettings(
                                                minimumAspectRatio: 1.0,
                                              )).then((value) {
                                            if (value != null) {
                                              Navigator.pop(context);
                                              BlocProvider.of<AppBloc>(context)
                                                  .add(UploadUserPhoto(value));
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
                                    child: Text('Gallery'),
                                    onPressed: () async {
                                      await ImagePicker()
                                          .getImage(source: ImageSource.gallery)
                                          .then((file) {
                                        if (file != null) {
                                          return ImageCropper.cropImage(
                                              sourcePath: file.path,
                                              maxHeight: 400,
                                              maxWidth: 400,
                                              aspectRatio: CropAspectRatio(
                                                  ratioX: 1.0, ratioY: 1.0),
                                              androidUiSettings:
                                                  AndroidUiSettings(
                                                      toolbarTitle: 'Cropper',
                                                      toolbarColor:
                                                          Colors.deepOrange,
                                                      toolbarWidgetColor:
                                                          Colors.white,
                                                      initAspectRatio:
                                                          CropAspectRatioPreset
                                                              .original,
                                                      lockAspectRatio: false),
                                              iosUiSettings: IOSUiSettings(
                                                minimumAspectRatio: 1.0,
                                              )).then((value) {
                                            if (value != null) {
                                              Navigator.pop(context);
                                              BlocProvider.of<AppBloc>(context)
                                                  .add(UploadUserPhoto(value));
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
                                    child: Text('Cancel'),
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
            body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
              return Stack(
                children: <Widget>[
                  Center(
                      child: PhotoView(
                          heroAttributes:
                              const PhotoViewHeroAttributes(tag: "photo"),
                          imageProvider:
                              NetworkImage(state.user?.photo['thumbnail']))),
                  Center(
                      child: Visibility(
                    visible: state.loading,
                    child: CupertinoActivityIndicator(
                      radius: 40,
                    ),
                  ))
                ],
              );
            })));
  }
}

class UserEditPage extends StatefulWidget {
  @override
  _UserEditPageState createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Avatar'), actions: <Widget>[
          FlatButton(
            child: Text('Submit'),
            onPressed: () {},
          )
        ]),
        body: BlocProvider<UserFormBloc>(
          create: (context) => UserFormBloc(context),
          child: Builder(
            builder: (context) {
              UserFormBloc formBloc = BlocProvider.of<UserFormBloc>(context);
              return FormBlocListener<UserFormBloc, String, String>(
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
                          textFieldBloc: formBloc.first_name
                            ..updateInitialValue(
                                BlocProvider.of<AppBloc>(context)
                                    .state
                                    .user
                                    .first_name),
                          onSubmitted: (value) {
                            formBloc.submit();
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: '',
                          )),
                    ],
                  ));
            },
          ),
        ));
  }
}
