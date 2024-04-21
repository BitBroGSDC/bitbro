import 'package:bitbro/components/appbar_go_back.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:bitbro/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../classes/question.dart';
import '../utils/styles.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluScuro,
      appBar: const AppBarGoBack(title: "Summary"),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final Question? question = state.questionOfLastDay;

          return Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  height: 180,
                  child: Center(
                      child: Text(question?.question ?? "",
                          style: text16Bianco500, textAlign: TextAlign.center)),
                )),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
                  decoration: const BoxDecoration(
                    color: bianco,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      const Text(
                        "Your Answer",
                        style: textBlue24Medium,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: griginoSfondo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(question?.answer ?? "",
                            textAlign: TextAlign.start),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Game Master Opinion",
                        style: textBlue24Medium,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: griginoSfondo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(question?.summary ?? "",
                            style: text16Blue300, textAlign: TextAlign.start),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Updates",
                        style: textBlue24Medium,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: griginoSfondo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: question?.updates?.length ?? 0,
                          itemBuilder: (context, index) {
                            String? person =
                                question?.updates?.keys.elementAt(index);

                            if (person == null) {
                              return const SizedBox.shrink();
                            }
                            String? balance = parseFloatAndReturnString(
                                question?.updates?[person]);

                            TextStyle? style = balance?.startsWith("+") ?? false
                                ? text14Green500
                                : text14Red500;

                            if (balance == null) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(person),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: bluScuro,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 4, bottom: 4),
                                      child: Text(
                                        balance,
                                        style: style,
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]);
        },
      ),
    );
  }
}
