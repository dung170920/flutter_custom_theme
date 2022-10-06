import 'package:custom_theme/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyle = theme.textTheme;

    return Scaffold(
      backgroundColor: scheme.primaryContainer,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: scheme.surface,
            child: Icon(
              Icons.grid_view_rounded,
              color: scheme.onPrimaryContainer,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/menu.svg',
              color: scheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Market',
                  style: textStyle.displayMedium!.copyWith(
                    color: scheme.onPrimaryContainer,
                  ),
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: CircleAvatar(
                          backgroundColor: scheme.onPrimaryContainer,
                          child: SvgPicture.asset(
                            'assets/images/heart-monitor.svg',
                            color: scheme.surface,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: '\nyour growth\nstrategy')
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: scheme.surface),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(left: 20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Get started',
                      style: TextStyle(color: scheme.surface),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8).copyWith(left: 20),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: scheme.surface,
                        child: Icon(
                          Icons.arrow_forward,
                          color: scheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
