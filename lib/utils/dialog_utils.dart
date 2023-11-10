import 'package:flutter/material.dart';
import 'package:task_07/constants/dimentions_resources.dart';

import '../constants/string_resources.dart';

class DialogUtils {
  static Future<bool> showEditDialog(
      BuildContext context,
      TextEditingController editingController,
      VoidCallback yesButtonFunction) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(StringResources.EDIT),
              content: TextFormField(
                decoration: const InputDecoration(
                    labelText: StringResources.EDIT_FIELD_LABEL),
                controller: editingController,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(StringResources.NO),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  onPressed: yesButtonFunction,
                  child: const Text(StringResources.YES),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static Future<bool> showDeleteDialog(
      BuildContext context, VoidCallback yesButtonFunction) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(StringResources.CONFIRMATION),
              content: const Text(StringResources.DO_YOU_WANT_TO_DELETE),
              actions: <Widget>[
                TextButton(
                  child: const Text(StringResources.NO),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  onPressed: yesButtonFunction,
                  child: const Text(StringResources.YES),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static Future<bool> showAskDialog(
      BuildContext context,
      VoidCallback deleteButtonFunction,
      VoidCallback editButtonFunction) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(StringResources.CONFIRMATION),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: editButtonFunction,
                    child: const Text(StringResources.DELETE)),
                const SizedBox(
                  width: DimensionResources.D_10,
                ),
                ElevatedButton(
                  onPressed: deleteButtonFunction,
                  child: const Text(StringResources.EDIT),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
