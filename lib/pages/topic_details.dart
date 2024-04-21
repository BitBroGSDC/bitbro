import 'package:bitbro/components/appbar_go_back.dart';
import 'package:bitbro/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../classes/courses/topic.dart';
import '../utils/styles.dart';

class TopicDetails extends StatelessWidget {
  const TopicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      final Topic? topic = state.selectedTopic;

      return Scaffold(
        backgroundColor: bluScuro,
        appBar: AppBarGoBack(title: topic?.title ?? "Topic Details"),
        body: Builder(builder: (context) {
          if (topic == null) {
            return const Center(
              child: Text(
                'No Topic Selected',
                style: TextStyle(
                  fontSize: 18,
                  color: bianco,
                ),
              ),
            );
          }
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
                      child: Text(topic.description,
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
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: topic.paragraphs.length,
                        itemBuilder: (context, index) {
                          if (topic.paragraphs[index].text != null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Paragraph ${index + 1}",
                                    style: textBlue24Medium),
                                Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 24),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: griginoSfondo,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(topic.paragraphs[index].text!,
                                        textAlign: TextAlign.start)),
                              ],
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Image.network(
                              topic.paragraphs[index].image!,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        controller: scrollController,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AppBloc>()
                            .add(MarkTopicCompleted(topic.title));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 48,
                        decoration: const BoxDecoration(
                          color: bluScuro,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Mark as completed",
                                style: text16Bianco500),
                            Icon(Icons.check_circle,
                                color: topic.isCompleted
                                    ? verdeBrillante
                                    : bianco),
                          ],
                        ),
                      ),
                    )
                  ]),
                );
              },
            ),
          ]);
        }),
      );
    });
  }
}
