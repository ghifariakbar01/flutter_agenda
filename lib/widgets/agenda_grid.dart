// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/provider/all_provider.dart';

import 'package:login/screens/agenda_edit_page.dart';
import 'package:login/utils/extension.dart';
import 'package:login/utils/snackbar.dart';
import 'package:login/widgets/v_image.dart';

class AgendaGrid extends ConsumerWidget {
  const AgendaGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agendas = ref.watch(agendaNotifierProvider);

    return agendas.when(data: (agenda) {
      return GridView.builder(
          itemCount: agenda.length + 1,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 12 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return index != agenda.length
                ? Slidable(
                    key: Key(agenda[index].id),
                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),

                      // A pane can dismiss the Slidable.
                      dismissible: DismissiblePane(onDismissed: () {
                        ref
                            .read(fireStoreProvider.notifier)
                            .deleteData('agenda', agenda[index].id);

                        ref.refresh(agendaNotifierProvider);

                        makeSuccessSb('Success', 'Agenda delete');
                      }),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (_) async {
                            await ref
                                .read(fireStoreProvider.notifier)
                                .deleteData('agenda', agenda[index].id);

                            ref.refresh(agendaNotifierProvider);

                            makeSuccessSb('Success', 'Agenda delete');
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),

                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AgendaEditPage.tag,
                          arguments: {'data': agenda[index], 'is_add': false},
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(agenda[index].backImage),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Judul agenda: ${agenda[index].title}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Deskripsi agenda: ${agenda[index].description}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Tanggal dibuat:  ${agenda[index].date.toDateString()}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Tanggal pengingat: ${agenda[index].dateReminder.toDateString()}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                flex: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lampiran',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    VNetworkImage(url: agenda[index].imageUrl)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      final data = AgendaModel(
                        id: '',
                        title: '',
                        description: '',
                        date: DateTime.now(),
                        dateReminder: DateTime.now(),
                        backImage: 'assets/alucard.jpg',
                        imageUrl: '',
                        attached: '',
                      );

                      final id = await ref
                          .read(fireStoreProvider.notifier)
                          .addData('agenda', data.toJson());

                      print('id is $id');

                      await ref.read(fireStoreProvider.notifier).updateData(
                          'agenda', id, data.copyWith(id: id).toJson());

                      Navigator.pushNamed(context, AgendaEditPage.tag,
                          arguments: {
                            'data': data.copyWith(id: id),
                            'is_add': true
                          });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  );
          });
    }, error: (e, s) {
      return Center(child: Text(e.toString()));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    });
  }
}
