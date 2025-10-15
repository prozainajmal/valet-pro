import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'xkz4xjo6': {
      'en': 'Use the form below to access your account.',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'k9u5spqi': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'f4xxyrqv': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'lfzvgi5q': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'id': 'Masukkan kata sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
    },
    's8bicxzh': {
      'en': 'Forgot Password?',
      'id': 'Tidak ingat kata sandi?',
      'ms': 'Lupa kata laluan?',
    },
    'm9klj9ah': {
      'en': 'Login',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'zy328lg7': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'tcu0c8bu': {
      'en': 'Don\'t have an account?',
      'id': 'Tidak punya akun?',
      'ms': 'Tiada akaun?',
    },
    'kk2rdqi2': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // createAccount
  {
    'l2xxy1gf': {
      'en': 'Get Started',
      'id': 'Memulai',
      'ms': 'Mulakan',
    },
    '59g0bt96': {
      'en': 'Use the form below to get started.',
      'id': 'Gunakan formulir di bawah ini untuk memulai.',
      'ms': 'Gunakan borang di bawah untuk bermula.',
    },
    'seheok8a': {
      'en': 'Company Name',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '0uknk55c': {
      'en': 'Enter your company name',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'oh9uhyzh': {
      'en': 'Company Type',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'u1wd86pp': {
      'en': 'Enter your company type',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'p9cyvpkf': {
      'en': 'Work Phone Number',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '2df4k41h': {
      'en': 'Enter your work phone number',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'i6hhohju': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'w09ermz5': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'wwxuev1r': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'eextb60x': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'kx2trk1o': {
      'en': 'Confirm Password',
      'id': 'konfirmasi sandi',
      'ms': 'Sahkan Kata Laluan',
    },
    'k8c3y3u7': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    '29ut49wi': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
    '07gxzzhq': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'ysqhbhpe': {
      'en': 'Already have an account?',
      'id': 'Sudah memiliki akun?',
      'ms': 'Sudah mempunyai akaun?',
    },
    'ud92zl8z': {
      'en': 'Log In',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'zuuuklky': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // forgotPassword
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'id': 'Tidak ingat kata sandi',
      'ms': 'Lupa kata laluan',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
    },
    'tzm5opaa': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'uvsotzng': {
      'en': 'Please enter a valid email...',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'id': 'Kirim Setel Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Below is a summary of your teams activity.',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    'jqevo63s': {
      'en': 'Active Agents',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    '8vot9bzj': {
      'en': 'Total Earnings',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    'kphqz3hi': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'xlzf8qqx': {
      'en': 'UI Design Team',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'zt3s5l2s': {
      'en': '24 Members',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'puy8obok': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    '2csheipb': {
      'en': '200/500',
      'id': '',
      'ms': '',
    },
    'oed6i1e4': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'pdl4u0y8': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'dfxzgqx5': {
      'en': '200/500',
      'id': '',
      'ms': '',
    },
    'oft71mtd': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    '6uzfie80': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'md7kn51c': {
      'en': '200/500',
      'id': '',
      'ms': '',
    },
    '3jlf1kbm': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'fmo4vuat': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'jvy8hidm': {
      'en': '200/500',
      'id': '',
      'ms': '',
    },
    'tz5y7knr': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'cpqptb0u': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'o7k2oclc': {
      'en': '200/500',
      'id': '',
      'ms': '',
    },
    'g1uaaovn': {
      'en': '[Agent_Name]',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'zngdvfev': {
      'en': '20/500',
      'id': '',
      'ms': '',
    },
    'uj7jsxmo': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'hkk2zmjw': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'jkgae0vc': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'g4os7kcp': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Payout
  {
    'n99lg1qh': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'lvnskphp': {
      'en': 'All',
      'id': 'Semua',
      'ms': 'Semua',
    },
    'a258xeav': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'wduyui67': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'riw99ssl': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'u0su8kte': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'nyfsg4hw': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'gzwu4cjr': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'v1ffzm93': {
      'en': 'Ignacious Rodriguez',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    '8jo402mn': {
      'en': 'Sales Manager',
      'id': 'Manajer penjualan',
      'ms': 'Pengurus jualan',
    },
    'r658c9dm': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'l5cpbw6i': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '9ico69uv': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'i1898004': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    's8kuamom': {
      'en': 'Greg Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'uu60i528': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    '6nuzim8s': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'lwflemu4': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rxejb1ds': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'k5yutyp7': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'z6bqikmn': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rm4hba82': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'id05iiyh': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'qh2ock0d': {
      'en': 'Active',
      'id': 'Aktif',
      'ms': 'Aktif',
    },
    'evmi1fjb': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    '7t7dfs7b': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'rv0grt5f': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    '1c1n7s8k': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    '13p4ybb4': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'y7tux8cs': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    's7xebw09': {
      'en': 'Cold Calls',
      'id': 'Panggilan Dingin',
      'ms': 'Panggilan Dingin',
    },
    'xaq75cfo': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    '3hsvv2b4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '8df6l0nu': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '1azw03n0': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '4i0nlpng': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'k60lznjm': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'fcyoodds': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Reviews
  {
    '4h88trkp': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'smh1o93d': {
      'en': 'Reviews',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'dlt46loo': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'sqmgdsam': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '8t72ssfn': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'kdx9eh83': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'g9ysuohn': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'x9ba3017': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'h9kiq8rj': {
      'en': 'Time',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    '7mjz03wi': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    '8e820p1r': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'j08eiorc': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // ValetAgents
  {
    '8jlklje5': {
      'en': 'Valet Agents',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'd1deaf9v': {
      'en': 'Add Agent',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    '9iuss6gl': {
      'en': 'Search for your customers...',
      'id': 'Cari pelanggan Anda...',
      'ms': 'Cari pelanggan anda...',
    },
    '5mtplc2u': {
      'en': 'Member Name',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'xsqhz5g4': {
      'en': 'Email',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'xkijgi68': {
      'en': 'Last Active',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'dtsi2m5j': {
      'en': 'Date Created',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'gip25udk': {
      'en': 'Link',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    '30pvspoq': {
      'en': 'Phone Number',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'qriboqj2': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'hbvgee7f': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cg7vidix': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    '975lfxpw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'zflmitqs': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    'l96eacgw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'a3dpvtwo': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    'a34fke7r': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '74smq5al': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    'xhwmudov': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '4674pelt': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    '5zdg3l5v': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '8bb60kt2': {
      'en': '[Link]',
      'id': '',
      'ms': '',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'smtxdnbn': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Settings
  {
    'qrxn5crt': {
      'en': 'Settings',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'v1hh7jlp': {
      'en': 'Switch to Dark Mode',
      'id': 'Beralih ke Mode Gelap',
      'ms': 'Tukar kepada Mod Gelap',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': 'Change Password',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    'b1lw0hfu': {
      'en': 'Edit Profile',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'abqf147c': {
      'en': 'Log Out',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // userDetails
  {
    'obyrn1rb': {
      'en': 'Customer Name',
      'id': 'Nama Pelanggan',
      'ms': 'Nama Pelanggan',
    },
    '00sam6zz': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'nxuoeukv': {
      'en': 'High Profile',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'ecbeopja': {
      'en': 'Title',
      'id': 'Judul',
      'ms': 'Tajuk',
    },
    'xf6clrz6': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'kl55bl1c': {
      'en': 'Company',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'nh9bkr5i': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'dkyygm1d': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'p82rjlf3': {
      'en': 'Alexandria Smith',
      'id': 'Alexandria Smith',
      'ms': 'Alexandria Smith',
    },
    '2s53b50t': {
      'en': '1m ago',
      'id': '1 menit yang lalu',
      'ms': '1m lalu',
    },
    'rnaiavvh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'bujmmf46': {
      'en': '8',
      'id': '8',
      'ms': '8',
    },
    'ntlrz0gk': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'rw21s3dk': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'mj096u71': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'id':
          'Saya tidak begitu yakin tentang bagian ini di sini saya pikir Anda harus melakukan sesuatu yang keren!',
      'ms':
          'Saya tidak begitu pasti tentang bahagian ini di sini kerana saya fikir anda perlu melakukan sesuatu yang menarik!',
    },
    '1n2y2xin': {
      'en': 'a min ago',
      'id': 'beberapa menit yang lalu',
      'ms': 'min yang lalu',
    },
    'ojneuoau': {
      'en': 'Generate Quote',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    'suvzdvvk': {
      'en': 'View Company',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    '4no7ue4a': {
      'en': 'Your Name',
      'id': '',
      'ms': '',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': '',
      'ms': '',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'id': '',
      'ms': '',
    },
  },
  // projectDetailsHealthAi
  {
    'mxf4vrjw': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'wsgonkz2': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'ynyuwhqo': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'zk7z07v0': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'lux9j0yp': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'ry6jvd0g': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'hu32scl5': {
      'en': '\$125,000',
      'id': '\$125.000',
      'ms': '\$125,000',
    },
    'sfu6o269': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    '5sv9a4ka': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rrgcwkj1': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    '8bwk4oui': {
      'en': '\$67,000',
      'id': '\$67.000',
      'ms': '\$67,000',
    },
    'p2hoxaq9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'ww95wm3k': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    '54l7ivhw': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // projectDetails
  {
    'olng4jgs': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'auzixtnu': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'b5izv7nf': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'vhaascws': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'u5if4r56': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'xmoxp4eg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'nftjvt9b': {
      'en': '\$210,000',
      'id': '\$210.000',
      'ms': '\$210,000',
    },
    'gpz3q8k6': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'yltv0mu8': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rqfytlxg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'dlykg4gm': {
      'en': '\$120,000',
      'id': '\$120,000',
      'ms': '\$120,000',
    },
    'hsx3k6c4': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'okb12i1r': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'c0s3jdsy': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // CheckoutManagement
  {
    '6jxmzhrr': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'ayjev5y5': {
      'en': 'Checkout Management',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'leij06ze': {
      'en': 'Preview Checkout Page',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'auc5wk5w': {
      'en': 'Save',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    '7bgf3am8': {
      'en': 'Customize Valet Checkout',
      'id': '',
      'ms': '',
    },
    't32uvncq': {
      'en': 'Service name',
      'id': '',
      'ms': '',
    },
    'j77f2vhb': {
      'en': 'Enter service Name',
      'id': '',
      'ms': '',
    },
    'xbdmf2zx': {
      'en': 'Price (JD)',
      'id': '',
      'ms': '',
    },
    'crldctkq': {
      'en': '0.00 JD',
      'id': '',
      'ms': '',
    },
    'wf0rko0i': {
      'en': 'Service description',
      'id': '',
      'ms': '',
    },
    'ixu18i6b': {
      'en': 'Enter short sentence',
      'id': '',
      'ms': '',
    },
    'f5govnr5': {
      'en': 'Active',
      'id': '',
      'ms': '',
    },
    'guym2l0z': {
      'en': 'Add New Service',
      'id': '',
      'ms': '',
    },
    '2eh5gjxz': {
      'en': 'Existing Upselling Services',
      'id': '',
      'ms': '',
    },
    '83rcf67a': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
    's2yky1yn': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
    'p0ygknhr': {
      'en': 'Promotional Banners',
      'id': '',
      'ms': '',
    },
    '3z7dj9g9': {
      'en': 'Upload New Banner',
      'id': '',
      'ms': '',
    },
    'zxjqlgm8': {
      'en': 'Custom Checkout Messages',
      'id': '',
      'ms': '',
    },
    'lksy5kj6': {
      'en': 'Checkout Message',
      'id': '',
      'ms': '',
    },
    '2jc6364e': {
      'en': 'Enter custom message for checkout',
      'id': '',
      'ms': '',
    },
    '6jscz3vv': {
      'en': 'Save Message',
      'id': '',
      'ms': '',
    },
    'jq99jqwv': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // modal_success
  {
    'kred63vb': {
      'en': 'Send Contract Confirmation',
      'id': 'Kirim Konfirmasi Kontrak',
      'ms': 'Hantar Pengesahan Kontrak',
    },
    'hywgg8eu': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'kmp2gbpy': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'a7nc1dt4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '2f2nxucv': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'vcm4fijj': {
      'en': 'Next Steps',
      'id': 'Langkah selanjutnya',
      'ms': 'Langkah seterusnya',
    },
    '60n0fqw5': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'id':
          'Kirim informasi di bawah ini. Dan kami akan mengirimkan email dengan detail kepada pelanggan dan memungkinkan Anda untuk mengelolanya di dasbor Anda.',
      'ms':
          'Hantar maklumat di bawah. Dan kami akan menghantar e-mel dengan butiran kepada pelanggan dan membenarkan anda mengurusnya dalam papan pemuka anda.',
    },
    'e408bhw6': {
      'en': 'Send Information',
      'id': 'Kirim Informasi',
      'ms': 'Hantar Maklumat',
    },
    'wo1onxhi': {
      'en': 'Never Mind',
      'id': 'Sudahlah',
      'ms': 'Tidak mengapa',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'id': 'Ricky Rodriguez',
      'ms': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'farrki57': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'eg79coc6': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '5s0d776i': {
      'en': 'Valet Agents',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'lbojdpxg': {
      'en': 'Payouts',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '9pjba90p': {
      'en': 'Reviews',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    '01nu9cy0': {
      'en': 'Checkout Management',
      'id': 'Profil',
      'ms': 'Profil',
    },
    'xwzdatnq': {
      'en': 'Settings',
      'id': 'Profil',
      'ms': 'Profil',
    },
    'pswgyvdk': {
      'en': 'Log Out',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
  },
  // commandPalette
  {
    'jt9g5o8v': {
      'en': 'Search platform...',
      'id': 'Cari platform...',
      'ms': 'Platform carian...',
    },
    'b3bd9y8w': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'pw6kvl1f': {
      'en': 'Quick Links',
      'id': 'tautan langsung',
      'ms': 'Pautan Pantas',
    },
    'gckukxjv': {
      'en': 'Find Contract',
      'id': 'Temukan Kontrak',
      'ms': 'Cari Kontrak',
    },
    'zsq8vj02': {
      'en': 'Find Customer',
      'id': 'Temukan Pelanggan',
      'ms': 'Cari Pelanggan',
    },
    'iqxwv326': {
      'en': 'New Contract',
      'id': 'Kontrak baru',
      'ms': 'Kontrak Baru',
    },
    's60yfg0g': {
      'en': 'New Customer',
      'id': 'Pelanggan baru',
      'ms': 'Pelanggan baru',
    },
    'lwrh59bb': {
      'en': 'Recent Searches',
      'id': 'pencarian terkini',
      'ms': 'Carian Terkini',
    },
    'o6lqlfr1': {
      'en': 'Newport Financ',
      'id': 'Keuangan Newport',
      'ms': 'Kewangan Newport',
    },
    '6zpaywwg': {
      'en': 'Harry Styles',
      'id': 'Harry Styles',
      'ms': 'gaya Harry',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
  },
  // add_Company
  {
    'of4ijlba': {
      'en': 'Add New Valet Agent',
      'id': 'Memulai',
      'ms': 'Mulakan',
    },
    'xhn6qlcd': {
      'en': 'Use the form below to get started.',
      'id': 'Gunakan formulir di bawah ini untuk memulai.',
      'ms': 'Gunakan borang di bawah untuk bermula.',
    },
    'jcmlk1i6': {
      'en': 'Full Name',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'jrte781q': {
      'en': 'Enter your full name',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'ttd8loza': {
      'en': 'Mobile Number',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'r6fdrmut': {
      'en': 'Enter your mobile number',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'fz5n8fk3': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'zrqs5kgm': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    's5n2sc4f': {
      'en': 'Add Valet Agent',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
  },
  // add_agent
  {
    'h2b0403v': {
      'en': 'Add New Valet Agent',
      'id': 'Memulai',
      'ms': 'Mulakan',
    },
    '8jmut6ns': {
      'en': 'Use the form below to get started.',
      'id': 'Gunakan formulir di bawah ini untuk memulai.',
      'ms': 'Gunakan borang di bawah untuk bermula.',
    },
    'v6gg362d': {
      'en': 'Full Name',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'p5e93qvh': {
      'en': 'Enter your full name',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'ykijcc6e': {
      'en': 'Mobile Number',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'wfjxch16': {
      'en': 'Enter your mobile number',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    '18kuldks': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '6c9z76b1': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    '4f9zttlb': {
      'en': 'Add Valet Agent',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
  },
  // CheckoutPage1
  {
    'lbvrusbc': {
      'en': 'Customize Valet Checkout',
      'id': '',
      'ms': '',
    },
    'uwinh9eg': {
      'en': 'Service Name',
      'id': '',
      'ms': '',
    },
    'k2xz3bmw': {
      'en': 'Enter service name',
      'id': '',
      'ms': '',
    },
    'fumw4q9i': {
      'en': 'Price JD',
      'id': '',
      'ms': '',
    },
    '46q1ieqb': {
      'en': '0.00',
      'id': '',
      'ms': '',
    },
    '8rz0jkoz': {
      'en': 'Description',
      'id': '',
      'ms': '',
    },
    'gwuqmfx4': {
      'en': 'Service description',
      'id': '',
      'ms': '',
    },
    'asdvn65n': {
      'en': 'Active',
      'id': '',
      'ms': '',
    },
    't4dyzq3d': {
      'en': 'Add New Service',
      'id': '',
      'ms': '',
    },
    '8dytyrfz': {
      'en': 'Existing Upselling Services',
      'id': '',
      'ms': '',
    },
    '2v4phj2e': {
      'en': 'Car Wash',
      'id': '',
      'ms': '',
    },
    'd2szfzin': {
      'en': 'JD 5.00',
      'id': '',
      'ms': '',
    },
    'ziriogqs': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
    '4e23cett': {
      'en': 'Interior Cleaning',
      'id': '',
      'ms': '',
    },
    'f7gn1s0f': {
      'en': 'JD 3.00',
      'id': '',
      'ms': '',
    },
    'q58fa4pl': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
    'mwe46smn': {
      'en': 'Promotional Banners',
      'id': '',
      'ms': '',
    },
    'naj58k8m': {
      'en': 'Special Offer: 20% Off All Services This Week!',
      'id': '',
      'ms': '',
    },
    'qrb2lner': {
      'en': 'Edit Banner',
      'id': '',
      'ms': '',
    },
    'gjfyfg3s': {
      'en': 'Upload New Banner',
      'id': '',
      'ms': '',
    },
    'ks1mlmjd': {
      'en': 'Custom Checkout Messages',
      'id': '',
      'ms': '',
    },
    '1vq1057w': {
      'en': 'Checkout Message',
      'id': '',
      'ms': '',
    },
    's1ajc2ef': {
      'en': 'Enter custom message for checkout',
      'id': '',
      'ms': '',
    },
    'yt74kxeo': {
      'en': 'Save Message',
      'id': '',
      'ms': '',
    },
  },
  // CheckoutPreview
  {
    'qycww73z': {
      'en': '[Checkout Message]',
      'id': '',
      'ms': '',
    },
    'n6s5jqjj': {
      'en': 'Customer Information',
      'id': '',
      'ms': '',
    },
    'slteslge': {
      'en': 'Enter your name',
      'id': '',
      'ms': '',
    },
    '2t74m7gn': {
      'en': 'Enter your phone number',
      'id': '',
      'ms': '',
    },
    'ity23ayh': {
      'en': 'Enter your email address',
      'id': '',
      'ms': '',
    },
    'jewqs6u7': {
      'en': 'Flash offer',
      'id': '',
      'ms': '',
    },
    '9axlqw9j': {
      'en': 'Tip for Valet',
      'id': '',
      'ms': '',
    },
    '2gnir2lc': {
      'en': '2.5 JD',
      'id': '',
      'ms': '',
    },
    'ozby6qe3': {
      'en': '2.5 JD',
      'id': '',
      'ms': '',
    },
    't1bo07c0': {
      'en': 'Custom Amount',
      'id': '',
      'ms': '',
    },
    'a57lcew6': {
      'en': 'Enter custom tip amount',
      'id': '',
      'ms': '',
    },
    'xity3slr': {
      'en': 'Extra Services',
      'id': '',
      'ms': '',
    },
    '4dlayj23': {
      'en': 'Total Amount',
      'id': '',
      'ms': '',
    },
    '9i343iv5': {
      'en': 'Continue to Payment',
      'id': '',
      'ms': '',
    },
    '1fj50twh': {
      'en': 'Valet Pro',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    'fa99k5ps': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0iu1fs3l': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ki7gz3d4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wiu05fcx': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3s01x0v8': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xe70gmql': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0o5loq5f': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
