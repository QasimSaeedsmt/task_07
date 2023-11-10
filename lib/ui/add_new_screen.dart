// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_07/bloc/data_bloc/data_event.dart';
import 'package:task_07/constants/constants_resources.dart';
import 'package:task_07/constants/dimentions_resources.dart';
import 'package:task_07/constants/responsive_constants.dart';
import 'package:task_07/constants/string_resources.dart';
import 'package:task_07/extensions/build_context_extension.dart';
import 'package:task_07/utils/widgets/custom_textfield.dart';

import '../bloc/data_bloc/data_bloc.dart';
import '../bloc/data_bloc/data_state.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final valueOneController = TextEditingController();
  final valueTwoController = TextEditingController();
  final valueThreeController = TextEditingController();
  final valueFourController = TextEditingController();
  final valueFiveController = TextEditingController();
  final nameController = TextEditingController();
  final focusNodeOne = FocusNode();
  final focusNodeTwo = FocusNode();
  final focusNodeThree = FocusNode();
  final focusNodeFour = FocusNode();
  final focusNodeFive = FocusNode();

  @override
  void initState() {
    context.read<DataBloc>().add(ShowFirstTextFieldEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataBloc = context.read<DataBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringResources.ADD_NEW_SCREEN_TITLE),
        actions: [
          ElevatedButton(
              onPressed: () {
                dataBloc.add(ShowFirstTextFieldEvent());
              },
              child: const Text(StringResources.ADD_NEW)),
        ],
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(DimensionResources.D_16),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringResources.NAME_VALIDATION_TEXT;
                                }
                                return null;
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                  labelText: StringResources.NAME_FIELD_LABEL),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    ResponsiveConstants.S_2),
                            const Text(StringResources.INSTRUCTION_TEXT),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    ResponsiveConstants.S_2),
                            dataBloc.state is ShowFirstTextFieldState
                                ? CustomTextField(
                                    focusNode: focusNodeOne,
                                    labelNo: ConstantsResources.LABEL_NO_ONE,
                                    controller: valueOneController)
                                : dataBloc.state is ShowSecondTextFieldState
                                    ? CustomTextField(
                                        focusNode: focusNodeTwo,
                                        labelNo:
                                            ConstantsResources.LABEL_NO_TWO,
                                        controller: valueTwoController)
                                    : state is ShowThirdTextFieldState
                                        ? CustomTextField(
                                            focusNode: focusNodeThree,
                                            labelNo: ConstantsResources
                                                .LABEL_NO_THREE,
                                            controller: valueThreeController)
                                        : state is ShowFourthTextFieldState
                                            ? CustomTextField(
                                                focusNode: focusNodeFour,
                                                labelNo: ConstantsResources
                                                    .LABEL_NO_FOUR,
                                                controller: valueFourController)
                                            : CustomTextField(
                                                focusNode: focusNodeFive,
                                                labelNo: ConstantsResources
                                                    .LABEL_NO_FIVE,
                                                controller: valueFiveController)
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (dataBloc.state is ShowFirstTextFieldState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  focusNodeTwo.requestFocus();
                                  dataBloc.add(ShowSecondTextFieldEvent());
                                }
                              } else if (dataBloc.state
                                  is ShowSecondTextFieldState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  focusNodeThree.requestFocus();

                                  dataBloc.add(ShowThirdTextFieldEvent());
                                }
                              } else if (dataBloc.state
                                  is ShowThirdTextFieldState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  focusNodeFour.requestFocus();

                                  dataBloc.add(ShowFourthTextFieldEvent());
                                }
                              } else if (dataBloc.state
                                  is ShowFourthTextFieldState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  focusNodeFive.requestFocus();
                                }
                                dataBloc.add(ShowFifthTextFieldEvent());
                              } else if (dataBloc.state
                                  is ShowFifthTextFieldState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  dataBloc.add(DataAddedToAllFieldsEvent());
                                }
                              } else if (state is DataAddedToAllFieldsState) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  dataBloc.add(AddDataEvent(
                                    value1: int.parse(valueOneController.text),
                                    name: nameController.text,
                                    value5: int.parse(valueFiveController.text),
                                    value4: int.parse(valueFourController.text),
                                    value3:
                                        int.parse(valueThreeController.text),
                                    value2: int.parse(valueTwoController.text),
                                  ));
                                  context.showSnackbar(
                                      StringResources.DATA_ADDED_SUCCESSFULLY,
                                      backgroundColor: Colors.green);
                                  nameController.clear();
                                  valueOneController.clear();
                                  valueTwoController.clear();
                                  valueThreeController.clear();
                                  valueFourController.clear();
                                  valueFiveController.clear();
                                  dataBloc.add(ShowFirstTextFieldEvent());
                                }
                              }
                            },
                            child: const Text(StringResources.DONE)),
                      ],
                    )),
              ));
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    valueOneController.dispose();
    valueTwoController.dispose();
    valueThreeController.dispose();
    valueFourController.dispose();
    valueFiveController.dispose();
    super.dispose();
  }
}
