// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/constant.dart';
import 'package:login/model/user_model.dart';
import 'package:login/provider/all_provider.dart';
import 'package:login/utils/extension.dart';
import 'package:login/utils/snackbar.dart';
import 'package:login/widgets/v_dialog.dart';
import 'package:login/widgets/v_image.dart';
import 'package:login/widgets/v_input.dart';

class UserForm extends ConsumerStatefulWidget {
  UserForm(this.user, {Key? key}) : super(key: key);

  @override
  ConsumerState<UserForm> createState() => _UserFormState();

  final UserModel user;
}

class _UserFormState extends ConsumerState<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final namaDepan = TextEditingController();
  final namaBelakang = TextEditingController();
  final email = TextEditingController();
  final emailNew = TextEditingController();
  final password = TextEditingController();
  final passwordNew = TextEditingController();
  final tanggalLahir = TextEditingController();
  final jenisKelamin = TextEditingController();

  String fotoProfil = '';
  String emailBefore = '';
  String passwordBefore = '';
  bool isUpload = false;

  @override
  void initState() {
    ref.refresh(getUserDataProvider);
    final user = widget.user;

    namaDepan.text = user.namaDepan;
    namaBelakang.text = user.namaBelakang;
    email.text = user.email;
    password.text = user.password;
    tanggalLahir.text = user.tanggalLahir;
    jenisKelamin.text = user.jenisKelamin;
    fotoProfil = user.fotoProfil;

    print('INIT HERE');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final userId = "fvcZjC3UL5M2T2WkbOdg";

    final fotoUpload = ref.watch(fileStorageProvider.notifier);

    final isemailPasswordChanged = ref.watch(isEmaillPassChangedProvider);

    final hero = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: 144.0,
          height: 144.0,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 144,
                    width: 144,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(72),
                        child: VNetworkImage(
                          url: isUpload
                              ? ref.read(fileStorageProvider.notifier).text
                              : fotoProfil,
                          height: 144,
                          width: 144,
                        )),
                  )),
              // edit profile
              Positioned(
                  bottom: 0,
                  right: -65,
                  left: 0,
                  child: InkWell(
                    onTap: () async {
                      await uploadImageDialog(
                          onImgPick:
                              ref.read(fileStorageProvider.notifier).onImgPick,
                          onDone: ref
                              .read(fireStoreProvider.notifier)
                              .updateData(
                                  'users',
                                  userId,
                                  UserModel(
                                          namaDepan: namaDepan.text,
                                          namaBelakang: namaBelakang.text,
                                          email: email.text,
                                          password: password.text,
                                          tanggalLahir: tanggalLahir.text,
                                          jenisKelamin: jenisKelamin.text,
                                          fotoProfil: ref
                                              .read(
                                                  fileStorageProvider.notifier)
                                              .text)
                                      .toJson())
                              .then((value) {
                            setState(() {
                              ref.refresh(getUserDataProvider);
                              isUpload = true;
                              FocusScope.of(context).unfocus();
                              Get.back();
                            });
                          }));
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(Icons.edit, color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );

    final userData = Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 400,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  hero,
                  VTextForm(
                      label: 'Nama Depan',
                      value: namaDepan.text,
                      controller: namaDepan),
                  VTextForm(
                      label: 'Nama Belakang',
                      value: namaBelakang.text,
                      controller: namaBelakang),

                  InkWell(
                    onTap: () async {
                      final value = await VDate.vShowDatePicker(context);
                      if (value == null) return;
                      print('VALUE: $value');

                      setState(() {
                        tanggalLahir.text = value.toDateString();
                        print('tanggalLahir.text: 1 ${tanggalLahir.text}');
                      });
                    },
                    child: VTextForm(
                        label: 'Tanggal Lahir',
                        enabled: false,
                        value: tanggalLahir.text,
                        controller: tanggalLahir),
                  ),

                  const SizedBox(height: 20),
                  const Text('Jenis Kelamin',
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 5),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: jenisKelamin.text,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            jenisKelamin.text = newValue!;
                          });
                        },
                        items: <String>['Laki-laki', 'Perempuan']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                      'Changing email or password will require you to login again',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  VTextForm(
                      label: 'Email',
                      enabled: false,
                      value: user.email,
                      controller: email),
                  VTextForm(
                      label: 'New Email',
                      onChanged: (value) {
                        if (user.email == value && value != '') {
                          isemailPasswordChanged.first = false;
                        } else {
                          isemailPasswordChanged.first = true;
                        }
                        print('isemailPasswordChanged.state[0] is ' +
                            isemailPasswordChanged.first.toString());
                      },
                      value: 'Input New Email',
                      controller: emailNew),
                  VTextForm(
                      label: 'Password',
                      enabled: false,
                      value: user.password,
                      controller: password),
                  VTextForm(
                      label: 'New Password',
                      onChanged: (value) {
                        if (user.password == value && value != '') {
                          isemailPasswordChanged.last = false;
                        } else {
                          isemailPasswordChanged.last = true;
                        }

                        print('isemailPasswordChanged.last is ' +
                            isemailPasswordChanged.last.toString());
                      },
                      value: 'Input New Password',
                      controller: passwordNew),

                  Expanded(child: Container()),
                  // save button
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();

                          if (passwordNew.text == password.text ||
                              passwordNew.text == '') {
                            isemailPasswordChanged.last = false;
                          }

                          if (emailNew.text == email.text ||
                              emailNew.text == '') {
                            isemailPasswordChanged.first = false;
                          }

                          print('final values is ' +
                              isemailPasswordChanged.toString());

                          var user = UserModel(
                            namaDepan: namaDepan.text,
                            namaBelakang: namaBelakang.text,
                            email: email.text,
                            password: password.text,
                            tanggalLahir: tanggalLahir.text,
                            jenisKelamin: jenisKelamin.text,
                            fotoProfil: fotoUpload.text,
                          );

                          if (isemailPasswordChanged.last == true) {
                            await ref
                                .read(fireAuthProvider.notifier)
                                .reAuth(email.text, password.text)
                                .then((value) async {
                              await ref
                                  .read(fireAuthProvider.notifier)
                                  .changePassword(passwordNew.text);

                              user = user.copyWith(password: passwordNew.text);
                            });

                            makeSuccessSb(passwordNew.text, 'Your password');
                          }

                          if (isemailPasswordChanged.first == true) {
                            await ref
                                .read(fireAuthProvider.notifier)
                                .reAuth(email.text, password.text)
                                .then((value) async {
                              await ref
                                  .read(fireAuthProvider.notifier)
                                  .changeEmail(emailNew.text);
                            });

                            user = user.copyWith(email: emailNew.text);
                          }

                          print('user : $user');

                          await ref
                              .read(fireStoreProvider.notifier)
                              .updateData('users', userId, user.toJson());

                          if (isemailPasswordChanged.first ||
                              isemailPasswordChanged.last) {
                            await ref.read(fireAuthProvider.notifier).signOut();
                          }

                          ref.refresh(fileStorageProvider);
                          ref.refresh(getUserDataProvider);

                          Navigator.pop(context);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: kDarkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      )),

                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ));

    return userData;
  }
}
