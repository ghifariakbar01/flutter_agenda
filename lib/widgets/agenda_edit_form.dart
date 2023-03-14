// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/constant.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/provider/all_provider.dart';
import 'package:login/utils/extension.dart';
import 'package:login/utils/snackbar.dart';
import 'package:login/widgets/v_dialog.dart';
import 'package:login/widgets/v_image.dart';
import 'package:login/widgets/v_input.dart';

class AgendaForm extends ConsumerStatefulWidget {
  AgendaForm(this.isAdd, {Key? key, required this.agenda}) : super(key: key);

  @override
  ConsumerState<AgendaForm> createState() => _AgendaFormState();

  final AgendaModel agenda;
  final bool isAdd;
}

class _AgendaFormState extends ConsumerState<AgendaForm> {
  final _formKey = GlobalKey<FormState>();
  final judul = TextEditingController();
  final deskripsi = TextEditingController();
  final lampiran = TextEditingController();
  final pengingatController = TextEditingController();
  final date = TextEditingController();
  var agendaId = '';
  var isUpload = false;

  @override
  void initState() {
    ref.refresh(fileStorageProvider);
    super.initState();
    final agenda = widget.agenda;
    agendaId = widget.agenda.id;

    judul.text = agenda.title;
    deskripsi.text = agenda.description;
    date.text = agenda.date.toDateString();
    pengingatController.text = agenda.dateReminder.toDateString();
    lampiran.text = agenda.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final agendaDate = ref.watch(agendaDateNotifierProvider.notifier);

    final agendaDetail = ref.watch(getDetailAgendaById(agendaId));

    final body = agendaDetail.when(
        data: (agenda) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height + 200,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        VTextForm(
                          label: 'Judul',
                          value: judul.text,
                          controller: judul,
                        ),
                        VTextForm(
                            label: 'Deskripsi',
                            value: deskripsi.text,
                            controller: deskripsi),
                        VTextForm(
                          label: 'Tanggal dibuat',
                          value: agenda.date.toDateString(),
                          enabled: false,
                          controller: date,
                        ),
                        InkWell(
                          onTap: () async {
                            final value = await VDate.vShowDatePicker(context);
                            if (value == null) return;

                            setState(() {
                              pengingatController.text = value.toDateString();
                            });
                            agendaDate.setDate(value);
                          },
                          child: VTextForm(
                              label: 'Tanggal pengingat',
                              enabled: false,
                              value: agenda.dateReminder.toDateString(),
                              controller: pengingatController),
                        ),
                        const SizedBox(height: 20),
                        Text('Attached',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        InkWell(
                            onTap: () async {
                              await uploadImageDialog(
                                  onImgPick: ref
                                      .read(fileStorageProvider.notifier)
                                      .onImgPick,
                                  onDone: ref
                                      .read(fireStoreProvider.notifier)
                                      .updateData(
                                          'agenda',
                                          agendaId,
                                          AgendaModel(
                                                  id: agendaId,
                                                  title: judul.text,
                                                  description: deskripsi.text,
                                                  attached: lampiran.text,
                                                  date: agenda.date,
                                                  dateReminder:
                                                      agendaDate.picked,
                                                  backImage: '',
                                                  imageUrl: ref
                                                      .read(fileStorageProvider
                                                          .notifier)
                                                      .text)
                                              .toJson())
                                      .then((value) {
                                    setState(() {
                                      ref.refresh(
                                          getDetailAgendaById(agendaId));
                                      isUpload = true;
                                      Get.back();
                                    });
                                  }));
                            },
                            child: VNetworkImage(
                                url: isUpload
                                    ? ref
                                        .read(fileStorageProvider.notifier)
                                        .text
                                    : agenda.imageUrl,
                                height: 100,
                                width: 100)),
                        Expanded(child: Container()),
                        ElevatedButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            FocusScope.of(context).unfocus();

                            print('agendaId $agendaId');

                            await ref
                                .read(fireStoreProvider.notifier)
                                .updateData(
                                    'agenda',
                                    agendaId,
                                    AgendaModel(
                                      id: agendaId,
                                      title: judul.text,
                                      description: deskripsi.text,
                                      attached: lampiran.text,
                                      date: agenda.date,
                                      dateReminder: agendaDate.picked,
                                      backImage: '',
                                      imageUrl: isUpload
                                          ? ref
                                              .read(
                                                  fileStorageProvider.notifier)
                                              .text
                                          : agenda.imageUrl,
                                    ).toJson());

                            ref.refresh(fileStorageProvider);
                            ref.refresh(agendaNotifierProvider);

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
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ));
        },
        error: (e, s) => Text('$e $s'),
        loading: () => Center(child: CircularProgressIndicator()));

    return WillPopScope(
        onWillPop: () async {
          // alert dialog

          if (widget.isAdd) {
            await ref
                .read(fireStoreProvider.notifier)
                .deleteData('agenda', agendaId);

            makeSuccessSb('Canceled', 'canceled add');
            return true;
          }

          ref.refresh(agendaNotifierProvider);
          return true;
        },
        child: body);
  }
}
