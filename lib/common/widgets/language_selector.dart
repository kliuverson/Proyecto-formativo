import 'package:ferremateriales/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

void showLanguageSelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetCtx) => _LanguageSelectorSheet(rootContext: context),
  );
}

class _LanguageSelectorSheet extends StatelessWidget {
  final BuildContext rootContext;
  const _LanguageSelectorSheet({required this.rootContext});

  static const _languages = [
    {'code': 'es', 'label': 'Español', 'flag': '🇨🇴'},
    {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
  ];

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(rootContext)!;
    final currentCode = rootContext.read<LocaleCubit>().state.languageCode;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            tr.language,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._languages.map((lang) {
            final isSelected = currentCode == lang['code'];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                lang['flag']!,
                style: const TextStyle(fontSize: 28),
              ),
              title: Text(
                lang['label']!,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing:
                  isSelected
                      ? const Icon(Icons.check_circle, color: Colors.orange)
                      : const Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.grey,
                      ),
              onTap: () {
                rootContext.read<LocaleCubit>().setLocale(
                  Locale(lang['code']!),
                );
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }
}

