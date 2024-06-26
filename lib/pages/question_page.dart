import 'package:bitbro/bloc/app_bloc.dart';
import 'package:bitbro/classes/question.dart';
import 'package:bitbro/components/appbar_go_back.dart';
import 'package:bitbro/components/container_2_elements.dart';
import 'package:bitbro/components/user_text_field.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:bitbro/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bluScuro,
        appBar: const AppBarGoBack(title: "Question"),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final Question? q = state.selectedQuestion;

            final double? currentBalance =
                state.currGame?.scoreboard[state.currGame?.userName]?.last;

            if (q == null) {
              return const Center(
                  child: Text(
                'No Question for today',
                style: text18Bianco500,
              ));
            }

            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(q.question,
                          style: text16Bianco500, textAlign: TextAlign.justify),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: bianco,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Game Master has posed you a question.",
                          style: text20Blue500,
                        ),
                        const Text("Ponder your response well!",
                            style: text16Blue300),
                        const SizedBox(height: 20),
                        const Text("Your Response", style: text20Blue500),
                        const UserTextField(
                          hintText: "Type your response here",
                          backgroundColor: griginoSfondo,
                        ),
                        const SizedBox(height: 40),
                        currentBalance != null
                            ? Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Builder(builder: (context) {
                                    bool isPositive;

                                    String parsedGain;

                                    if (currentBalance > 0) {
                                      isPositive = true;
                                      parsedGain = "+";
                                    } else {
                                      isPositive = false;
                                      parsedGain = "";
                                    }

                                    TextStyle style = isPositive
                                        ? text14Green500
                                        : text14Red500;

                                    parsedGain +=
                                        currentBalance.toStringAsFixed(2);
                                    return Container2Elements(
                                        text: parsedGain,
                                        firstText: "Current Balance",
                                        style: style);
                                  }),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
