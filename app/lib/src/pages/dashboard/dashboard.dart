import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/stores/main_scaffold/dashboard_store.dart';
import 'package:app/src/widgets/dashboard/characters_composition_donut_chart.dart';
import 'package:app/src/widgets/dashboard/letters_digits_pie_chart.dart';
import 'package:app/src/widgets/dashboard/stat_tile.dart';
import 'package:app/src/widgets/global/empty_state.dart';
import 'package:app/src/widgets/global/header.dart';
import 'package:app/src/widgets/profile/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardStore dashboardStore = context.read<DashboardStore>();
    return Observer(
      builder: (_) {
        final noteStore = context.read<RootStore>().noteStore;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils.spacing(SpacingSize.large),
          ),
          child: NotificationListener<UserScrollNotification>(
            onNotification: dashboardStore.onScrollNotification(),
            child: CustomScrollView(
              controller: dashboardStore.scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height:
                        ResponsiveUtils.spacing(SpacingSize.medium) +
                        context.safeTop,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Header(
                    title: 'Estatísticas',
                    subtitle: 'Resumo estatístico das suas notas.',
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: ResponsiveUtils.spacing(SpacingSize.medium),
                  ),
                ),
                if (noteStore.notes.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyState(
                        icon: RemixIcons.sticky_note_fill,
                        message: 'Nenhuma nota para analisar',
                        ctaText: 'Criar uma nota',
                        onCtaPressed: () =>
                            noteStore.showNewNoteDialog(context, null),
                      ),
                    ),
                  )
                else ...[
                  SliverToBoxAdapter(
                    child: SectionCard(
                      title: 'Visão geral',
                      icon: Icons.note_alt_rounded,
                      iconColor: AppPalette.tertiary,
                      child: Wrap(
                        spacing: ResponsiveUtils.spacing(SpacingSize.small),
                        runSpacing: ResponsiveUtils.spacing(SpacingSize.small),
                        children: [
                          StatTile(
                            label: 'Total de notas',
                            value: noteStore.totalNotes.toString(),
                            icon: Icons.library_books_outlined,
                            accentColor: AppPalette.primary,
                          ),
                          StatTile(
                            label: 'Total de linhas',
                            value: noteStore.totalLines.toString(),
                            icon: Icons.format_line_spacing_rounded,
                            accentColor: AppPalette.primaryVariant,
                          ),
                          StatTile(
                            label: 'Caracteres totais',
                            value: noteStore.totalCharacters.toString(),
                            icon: Icons.text_fields_rounded,
                            accentColor: AppPalette.tertiary,
                          ),
                          StatTile(
                            label: 'Total de palavras',
                            value: noteStore.totalWords.toString(),
                            icon: Icons.short_text_rounded,
                            accentColor: AppPalette.secondary,
                          ),
                          StatTile(
                            label: 'Edições gerais',
                            value: noteStore.totalEdits.toString(),
                            icon: Icons.edit_outlined,
                            accentColor: AppPalette.secondary,
                          ),
                          StatTile(
                            label: 'Caracteres especiais',
                            value: noteStore.totalSpecialCharacters.toString(),
                            icon: Icons.alternate_email_rounded,
                            accentColor: AppPalette.blackShade,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.medium),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionCard(
                      title: 'Letras vs números',
                      icon: Icons.pie_chart_rounded,
                      iconColor: AppPalette.primary,
                      child: LettersDigitsPieChart(
                        letters: noteStore.totalLetters,
                        digits: noteStore.totalDigits,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: ResponsiveUtils.spacing(SpacingSize.medium),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionCard(
                      title: 'Composição de caracteres',
                      icon: Icons.donut_large_rounded,
                      iconColor: AppPalette.secondary,
                      child: CharactersCompositionDonutChart(
                        letters: noteStore.totalLetters,
                        digits: noteStore.totalDigits,
                        specialCharacters: noteStore.totalSpecialCharacters,
                        whitespaceCharacters:
                            noteStore.totalWhitespaceCharacters,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height:
                          context.safeBottom +
                          ResponsiveUtils.spacing(SpacingSize.large),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
