import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_07/bloc/data_bloc/data_event.dart';
import 'package:task_07/constants/string_resources.dart';
import 'package:task_07/data/data_model/data_model.dart';
import 'package:task_07/extensions/build_context_extension.dart';
import 'package:task_07/ui/add_new_screen.dart';
import 'package:task_07/ui/graph_screen.dart';
import 'package:task_07/utils/dialog_utils.dart';

import '../bloc/data_bloc/data_bloc.dart';
import '../bloc/data_bloc/data_state.dart';
import '../data/boxes..dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  List<DataModel>? updatedList;
@override
  void initState() {
    var box = Boxes.getData();
    updatedList = box.values.toList().cast<DataModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataBloc = context.read<DataBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                context.navigateTo(const AddNewScreen());
              },
              child: const Text(StringResources.ADD_NEW)),
        ],
        title: const Text(StringResources.MAIN_SCREEN_TITLE),
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          updatedList ??= [];
          if (state is DataDeletedState) {
            updatedList = state.updatedList;
          }
          if (state is DataAddedState) {
            final Set<DataModel> uniqueData = Set.from(updatedList ?? [])
              ..addAll(state.dataList);
            updatedList = uniqueData.toList();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: updatedList?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context
                            .navigateTo(GraphScreen(data: updatedList?[index]));
                      },
                      onLongPress: () {
                        DialogUtils.showAskDialog(context, () {
                          Navigator.pop(context);
                          DialogUtils.showEditDialog(context, controller, () {
                            Navigator.pop(context);
                            dataBloc.add(EditDataEvent(
                                name: controller.text, index: index));
                          });
                        }, () {
                          Navigator.pop(context);

                          DialogUtils.showDeleteDialog(context, () {
                            Navigator.pop(context);
                            dataBloc.add(DeleteDataEvent(index: index));
                          });
                        });
                      },
                      title: Text(updatedList?[index].name ??
                          StringResources.EMPTY_STRING),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
