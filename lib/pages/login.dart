import 'package:animate_do/animate_do.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:eletecapp/bloc/login_bloc.dart';
import 'package:eletecapp/views/loading_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore_for_file: close_sinks

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          return BlocProvider<SendFormBloc>(
            create: (_) => SendFormBloc(context),
            child: Builder(
              builder: (context) {
                return BlocProvider<VerifyFormBloc>(
                    create: (_) => VerifyFormBloc(context), child: LoginView());
              },
            ),
          );
        },
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo.shade50,
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox.fromSize(
              size: Size.fromHeight(MediaQuery.of(context).size.height / 4),
              child: FlareActor(
                "assets/images/otp.flr",
                animation: "otp",
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            Flexible(child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state.step == LogInStep.SEND) {
                return FadeInUp(
                    child: SendView(), duration: Duration(milliseconds: 500));
              }

              if (state.step == LogInStep.VERIFY) {
                return FadeInUp(
                    child: VerifyView(), duration: Duration(milliseconds: 500));
              }

              return Container();
            }))
          ],
        ));
  }
}

class SendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SendFormBloc formBloc = BlocProvider.of<SendFormBloc>(context);
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    final Widget buidlPhoneField = TextFieldBlocBuilder(
        textFieldBloc: formBloc.phoneNumber,
        onSubmitted: (value) {
          formBloc.submit();
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            labelText: Localization.of(context).phoneNumber,
            prefixIcon: Container(
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<TextFieldBloc, TextFieldBlocState>(
                  bloc: formBloc.dialCode,
                  builder: (_, __) {
                    return CountryCodePicker(
                      onInit: (value) {
                        formBloc.dialCode.updateValue(value.dialCode);
                      },
                      onChanged: (value) {
                        formBloc.dialCode.updateValue(value.dialCode);
                      },
                      initialSelection: 'AE',
                      favorite: ['+971', 'AE'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    );
                  },
                )),
            errorMaxLines: 6,
            border: OutlineInputBorder(),
            suffixIcon: const Icon(Icons.phone)));

    final Widget buildSubmit = BlocBuilder<FormBloc, dynamic>(
      bloc: formBloc,
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RaisedButton(
                child: Text(BlocProvider.of<LoginBloc>(context).state.leftTime >
                        0
                    ? '${BlocProvider.of<LoginBloc>(context).state.leftTime}'
                    : Localization.of(context).send),
                onPressed: state.isValid() &&
                        BlocProvider.of<LoginBloc>(context).state.leftTime == 0
                    ? () {
                        formBloc.submit();
                      }
                    : null));
      },
    );

    return FormBlocListener<SendFormBloc, String, String>(
        onFailure: (context, state) {
          LoadingDialog.hide(context);
          loginBloc.add(LoginStopTime());
        },
        onSuccess: (context, state) {
          LoadingDialog.hide(context);
          loginBloc.add(UpdateStep(LogInStep.VERIFY));
        },
        onSubmitting: (context, state) {
          LoadingDialog.show(context);
          loginBloc.add(LoginStartTime());
        },
        child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: <Widget>[buidlPhoneField, buildSubmit],
            )));
  }
}

class VerifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VerifyFormBloc formBloc = BlocProvider.of<VerifyFormBloc>(context);
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    final Widget buildSubmit = BlocBuilder<FormBloc, dynamic>(
      bloc: formBloc,
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RaisedButton(
                child: Text(Localization.of(context).verify),
                onPressed: state.isValid()
                    ? () {
                        formBloc.submit();
                      }
                    : null));
      },
    );

    return FormBlocListener<VerifyFormBloc, String, String>(
        onFailure: (context, state) {
          LoadingDialog.hide(context);
        },
        onSuccess: (context, state) {
          LoadingDialog.hide(context);
          BlocProvider.of<AppBloc>(context).add(AuthenticationStart());
        },
        onSubmitting: (context, state) {
          LoadingDialog.show(context);
        },
        child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    Localization.of(context).verification,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                  backgroundColor: Colors.indigo.shade50,
                  enableActiveFill: false,
                  autoDisposeControllers: true,
                  onCompleted: (value) {
                    formBloc.submit();
                  },
                  onChanged: (value) {
                    formBloc.otp.updateValue(value);
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                BlocBuilder<TextFieldBloc, TextFieldBlocState>(
                    bloc: formBloc.otp,
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
                SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Localization.of(context).receiveHelp,
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: Localization.of(context).reSend,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                loginBloc.add(UpdateStep(LogInStep.SEND));
                              },
                            style: TextStyle(
                                color: Color(0xFF91D3B3),
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                SizedBox(
                  height: 18,
                ),
                buildSubmit
              ],
            )));
  }
}
