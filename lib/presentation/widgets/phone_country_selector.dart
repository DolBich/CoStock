import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class PhoneCountrySelector extends StatefulWidget {
  final LocaleData currentLocale;
  final ValueChanged<AppLocale> onChanged;

  const PhoneCountrySelector({
    Key? key,
    required this.currentLocale,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneCountrySelector> createState() => _PhoneCountrySelectorState();
}

class _PhoneCountrySelectorState extends State<PhoneCountrySelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showCountryPicker,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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

class CountryPickerSheet extends StatefulWidget {
  final ValueChanged<LocaleData> onSelected;

  const CountryPickerSheet({Key? key, required this.onSelected})
    : super(key: key);

  @override
  State<CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  late List<LocaleData> _allCountries;
  List<LocaleData> _filteredCountries = [];
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

  void _filterCountries() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = _allCountries;
      } else {
        _filteredCountries = _allCountries.where((c) {
          return c.name.toLowerCase().contains(query) ||
              c.nativeName.toLowerCase().contains(query) ||
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
