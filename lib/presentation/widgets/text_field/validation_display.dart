part of 'bloc_text_field.dart';

class _ValidationDisplay extends StatelessWidget {
  final ValidationResult validationResult;
  final bool? errorPersisted;

  const _ValidationDisplay({
    required this.validationResult,
    required this.errorPersisted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle =
        theme.textTheme.bodySmall ?? const TextStyle(fontSize: 12);

    return Padding(
      padding: const .only(top: 8, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Требования (если есть)
          if (validationResult.requirements.isNotEmpty) ...[
            if (validationResult.requirementText.isNotEmpty)
              Text(
                validationResult.requirementText,
                style: textStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            const SizedBox(height: 4),
            ...validationResult.requirements.map(
              (rs) => _buildRequirementText(rs, textStyle),
            ),
            const SizedBox(height: 12),
          ],

          // Советы (если есть)
          if (validationResult.suggestions.isNotEmpty) ...[
            if (validationResult.suggestionsText.isNotEmpty)
              Text(
                validationResult.suggestionsText,
                style: textStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            const SizedBox(height: 4),
            ...validationResult.suggestions.map(
              (rs) => _buildSuggestionText(rs, textStyle),
            ),
            const SizedBox(height: 12),
            // Прогресс-бар и подпись
            LinearProgressIndicator(
              value: validationResult.suggestionsProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                _getProgressColor(validationResult.suggestionsProgress),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              validationResult.strengthLabel,
              style: textStyle.copyWith(
                color: _getStrengthTextColor(
                  validationResult.suggestionsProgress,
                ),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRequirementText(RuleStatus rs, TextStyle baseStyle) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 2),
      child: Text(
        '• ${rs.rule.description}',
        style: baseStyle.copyWith(color: _getRequirementColor(rs)),
      ),
    );
  }

  Widget _buildSuggestionText(RuleStatus rs, TextStyle baseStyle) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 2),
      child: Text(
        '• ${rs.rule.description}',
        style: baseStyle.copyWith(color: _getSuggestionColor(rs)),
      ),
    );
  }

  Color? _getRequirementColor(RuleStatus rs) {
    if (rs.isValid && !(errorPersisted ?? true)) {
      return Colors.green;
    } else if (!rs.isValid && (errorPersisted ?? false)) {
      return Colors.red;
    }
    return null; // обычный цвет текста
  }

  Color? _getSuggestionColor(RuleStatus rs) {
    if (rs.isValid && !(errorPersisted ?? true)) {
      return Colors.green;
    }
    return null;
  }

  Color _getProgressColor(double progress) {
    if (progress < 0.3) return Colors.red;
    if (progress < 0.7) return Colors.orange;
    return Colors.green;
  }

  Color _getStrengthTextColor(double progress) {
    if (progress < 0.3) return Colors.red;
    if (progress < 0.7) return Colors.orange;
    return Colors.green;
  }
}
