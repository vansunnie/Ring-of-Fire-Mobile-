class Language {
  final int id;
  final String name;
  final String flag;
  final String code;

  Language(this.id, this.name, this.flag, this.code);

  static List<Language> languageList() {
    return <Language>[
      Language(0, "English", "🇺🇸", "en"),
      Language(1, "Polish", "🇵🇱", "pl"),
      Language(2, "Portuguese", "🇵🇹", "pt"),
    ];
  }
}
