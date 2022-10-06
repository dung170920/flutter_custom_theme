import 'package:animations/animations.dart';
import 'package:custom_theme/models/task_card_model.dart';
import 'package:custom_theme/pages/pages.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.e});

  final TaskCardModel e;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding:
          e.label == 'Add Task' ? EdgeInsets.zero : const EdgeInsets.all(8),
      child: OpenContainer(
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          closedColor:
              e.label == 'Add task' ? scheme.surfaceVariant : scheme.surface,
          openColor:
              e.label == 'Add task' ? scheme.surfaceVariant : scheme.surface,
          closedBuilder: (context, action) => Padding(
                padding: EdgeInsets.all(e.label == 'Add task' ? 14 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: e.label == 'Add task'
                          ? scheme.primaryContainer
                          : scheme.surfaceVariant,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          e.label,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(e.content)
                  ],
                ),
              ),
          openBuilder: (context, action) => const OverviewPage()),
    );
  }
}
