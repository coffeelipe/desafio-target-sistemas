import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CharactersCompositionDonutChart extends StatelessWidget {
  final int letters;
  final int digits;
  final int specialCharacters;
  final int whitespaceCharacters;

  const CharactersCompositionDonutChart({
    super.key,
    required this.letters,
    required this.digits,
    required this.specialCharacters,
    required this.whitespaceCharacters,
  });

  @override
  Widget build(BuildContext context) {
    final total = letters + digits + specialCharacters + whitespaceCharacters;

    if (total <= 0) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveUtils.spacing(SpacingSize.small),
        ),
        child: Text(
          'Sem dados para gráfico.',
          style: AppTypography.bodyText.copyWith(
            color: AppPalette.caption.withValues(alpha: 0.8),
          ),
        ),
      );
    }

    final sections = <_SectionSpec>[
      _SectionSpec(
        label: 'Letras',
        value: letters,
        color: AppPalette.primary,
      ),
      _SectionSpec(
        label: 'Números',
        value: digits,
        color: AppPalette.tertiary,
      ),
      _SectionSpec(
        label: 'Especiais',
        value: specialCharacters,
        color: AppPalette.secondary,
      ),
      _SectionSpec(
        label: 'Espaços',
        value: whitespaceCharacters,
        color: AppPalette.blackShade.withValues(alpha: 0.7),
      ),
    ].where((s) => s.value > 0).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 520;

        final chart = SizedBox(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 2,
              centerSpaceRadius: 62,
              borderData: FlBorderData(show: false),
              pieTouchData: PieTouchData(enabled: false),
              sections: sections.map((s) {
                final percent = (s.value / total) * 100;
                return PieChartSectionData(
                  value: s.value.toDouble(),
                  color: s.color,
                  radius: 26,
                  title: percent >= 12 ? '${percent.round()}%' : '',
                  titleStyle: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  titlePositionPercentageOffset: 0.68,
                );
              }).toList(),
            ),
          ),
        );

        final legend = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...sections.expand(
              (s) => [
                _LegendItem(color: s.color, label: s.label, value: s.value),
                const SizedBox(height: 10),
              ],
            ),
            SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
            Text(
              'Total: $total',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppPalette.caption.withValues(alpha: 0.85),
              ),
            ),
          ],
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              chart,
              SizedBox(width: ResponsiveUtils.spacing(SpacingSize.medium)),
              Expanded(child: legend),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.center, child: chart),
            SizedBox(height: ResponsiveUtils.spacing(SpacingSize.small)),
            legend,
          ],
        );
      },
    );
  }
}

class _SectionSpec {
  final String label;
  final int value;
  final Color color;

  const _SectionSpec({
    required this.label,
    required this.value,
    required this.color,
  });
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final int value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppPalette.blackShade,
            ),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppPalette.caption.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }
}
