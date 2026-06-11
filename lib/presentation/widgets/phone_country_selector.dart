import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

/// Виджет для выбора страны номера телефона
class PhoneCountrySelector extends StatefulWidget {
  /// Страна номера телефона
  final LocaleData currentLocale;
  final ValueChanged<AppLocale> onChanged;

  const PhoneCountrySelector({
    super.key,
    required this.currentLocale,
    required this.onChanged,
  });

  @override
  State<PhoneCountrySelector> createState() => _PhoneCountrySelectorState();
}

class _PhoneCountrySelectorState extends State<PhoneCountrySelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showCountryPicker,
      borderRadius: .circular(8),
      child: Container(
        padding: const .symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: .all(color: Colors.grey.shade300),
          borderRadius: .circular(8),
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            CountryFlag.fromCountryCode(
              widget.currentLocale.countryCode,
              theme: const ImageTheme(shape: RoundedRectangle(6)),
            ),
            const SizedBox(width: 8),
            Text(widget.currentLocale.phonePrefix),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }

  /// Показать форму выбора страны теелфона
  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(20)),
      ),
      builder: (context) => CountryPickerSheet(
        onSelected: (locale) {
          Navigator.pop(context);
          widget.onChanged(
            AppLocale.values.firstWhere(
              (e) => e.localeData.code == locale.code,
            ),
          );
        },
      ),
    );
  }
}

/// Форма выбора страны номера телефона
class CountryPickerSheet extends StatefulWidget {
  final ValueChanged<LocaleData> onSelected;

  const CountryPickerSheet({super.key, required this.onSelected});

  @override
  State<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  /// Страны доступные для выбора номера телефона
  late List<LocaleData> _allCountries;
  /// Отфильтрованные страны
  List<LocaleData> _filteredCountries = [];
  /// Текст поиска страны
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allCountries = AppLocale.supportedLocalesData;
    _filteredCountries = _allCountries;
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Фильтрация стран для выбора по тексту в поисковике
  /// Ищем по [name], [nativeName], [countryCode], [phonePrefix]
  /// Ищем по английскому навзанию, по нативному названию, по коду страны ...
  /// TODO[325y03727532616]: тут надо переделать логику, её надо вынести в LocaleData + enum AppLocale
  /// сделать список для фильтрации по поиску
  /// А также изменить сам виджет для отображения/выделения текста в тайлах, что находится
  /// в тайлах страны, также заменять название [nativeName] на [name], если поиск идёт
  /// на английском языке. Если после этого пользователь стирает полностью поле -
  /// снова отображаем на [nativeName]
  /// А также в целом надо отформатировать этот виджет и сделать его хоть сколько
  /// то адекватно выглядящим
  void _filterCountries() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = _allCountries;
      } else {
        _filteredCountries = _allCountries.where((c) {
          return c.name.toLowerCase().contains(query) ||
              c.nativeName.toLowerCase().contains(query) ||
              c.code.toLowerCase().contains(query) ||
              c.countryCode.toLowerCase().contains(query) ||
              c.phonePrefix.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search country...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                final country = _filteredCountries[index];
                return ListTile(
                  leading: CountryFlag.fromCountryCode(
                    country.countryCode,
                    theme: const ImageTheme(shape: RoundedRectangle(6)),
                  ),
                  title: Text(country.nativeName),
                  subtitle: Text('${country.name} · ${country.phonePrefix}'),
                  onTap: () => widget.onSelected(country),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
