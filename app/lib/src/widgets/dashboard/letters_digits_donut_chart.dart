import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LettersDigitsDonutChart extends StatelessWidget {
  final int letters;
  final int digits;

  const LettersDigitsDonutChart({
    super.key,
    required this.letters,
    required this.digits,
  });

  @override
  Widget build(BuildContext context) {
    final total = letters + digits;

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

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 420;

        final lettersPercent = (letters / total) * 100;
        final digitsPercent = (digits / total) * 100;

        final chart = SizedBox(
          height: 180,
          width: 180,
          child: PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 4,
              centerSpaceRadius: 0,
              borderData: FlBorderData(show: false),
              pieTouchData: PieTouchData(enabled: false),
              sections: [
                PieChartSectionData(
                  value: letters.toDouble(),
                  color: AppPalette.primary,
                  radius: 64,
                  title: '${lettersPercent.round()}%',
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  titlePositionPercentageOffset: 0.62,
                ),
                PieChartSectionData(
                  value: digits.toDouble(),
                  color: AppPalette.tertiary,
                  radius: 54,
                  title: '${digitsPercent.round()}%',
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  titlePositionPercentageOffset: 0.62,
                ),
              ],
            ),
          ),
        );

        final legend = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LegendItem(
              color: AppPalette.primary,
              label: 'Letras',
              value: letters,
            ),
            const SizedBox(height: 10),
            _LegendItem(
              color: AppPalette.tertiary,
              label: 'Números',
              value: digits,
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
