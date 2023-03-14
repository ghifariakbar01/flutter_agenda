import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/widgets/agenda_edit_form.dart';

class AgendaEditPage extends StatefulWidget {
  const AgendaEditPage(this.isAdd, {Key? key}) : super(key: key);
  static String tag = 'agenda-edit-page';

  final bool? isAdd;

  @override
  State<AgendaEditPage> createState() => _AgendaEditPageState();
}

class _AgendaEditPageState extends State<AgendaEditPage> {
  @override
  Widget build(BuildContext context) {
    final agenda =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final data = agenda['data'] as AgendaModel;
    final isAdd = agenda['is_add'] as bool;

    final body = Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]),
        ),
        child: AgendaForm(agenda: data, isAdd));

    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: body,
      ),
    );
  }
}
