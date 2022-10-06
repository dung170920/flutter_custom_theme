import 'package:custom_theme/models/flow_list_model.dart';
import 'package:custom_theme/models/task_card_model.dart';
import 'package:custom_theme/widgets/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyle = theme.textTheme;

    List<TaskCardModel> tasks = [
      TaskCardModel('Add task', 'Creative for\nbranging'),
      TaskCardModel('Review', 'Verification\nprocess with team'),
      TaskCardModel('Flow list', 'Creative for\nbranging')
    ];

    List<FlowListModel> flowList = [
      FlowListModel('Document verification', '3 min ago'),
      FlowListModel('Newbie onboarding', '5 days ago'),
    ];

    return Scaffold(
      backgroundColor: scheme.surfaceVariant,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (v) {},
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/chart-pie.svg",
              color: scheme.outline,
            ),
            label: "Statistic",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(color: scheme.outline),
                        ),
                        Text(
                          'Carolina Terner',
                          style: textStyle.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      ),
                      Transform.translate(
                        offset: const Offset(-20, 20),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: scheme.surfaceVariant,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: scheme.onSurface,
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 12,
                                color: scheme.surface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: scheme.surface,
                        shadows: [
                          BoxShadow(
                            blurRadius: 16,
                            color: theme.shadowColor,
                          )
                        ]),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Try to find...',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: ListView(
                      children: [
                        const SizedBox(height: 16 + 28),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            'Task-based explanation process',
                            style: textStyle.headlineSmall,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: tasks
                                .map((e) => e.label == 'Add task'
                                    ? Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: DottedBorder(
                                          color: scheme.outline,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(16),
                                          dashPattern: const [4],
                                          child: TaskCard(e: e),
                                        ),
                                      )
                                    : TaskCard(e: e))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              child: Text(
                                'Flow list',
                                style: textStyle.headlineSmall,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See all',
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: flowList
                              .map(
                                (e) => Column(
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      title: Text(
                                        e.title,
                                      ),
                                      trailing: CircleAvatar(
                                        backgroundColor:
                                            scheme.primaryContainer,
                                        child: Icon(
                                          Icons.add,
                                          color: scheme.secondary,
                                        ),
                                      ),
                                      subtitle: Text(e.time),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      indent: 24,
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
