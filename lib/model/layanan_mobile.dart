import 'package:cloud_firestore/cloud_firestore.dart';

class LayananMobile {
  String nameApp;
  List<String> kategori;
  List<String> fitur;
  String voucher;
  DateTime? mulaikerja;
  DateTime? selesaikerja;
  DateTime? tglPengajuan;
  int minPrice;
  int maxPrice;
  int lamaKerja;
  String deskripsi;
  bool konfirmasi;
  bool meeting;
  bool dp;
  bool repayment;
  bool development;
  bool finish;
  bool cancel;
  DateTime? timeKonfirmasi;
  DateTime? timeMeeting;
  DateTime? timeDp;
  DateTime? timeRepayment;
  DateTime? timeDevelopment;
  DateTime? timeFinish;
  DateTime? timeCancel;

  LayananMobile({
    required this.nameApp,
    required this.kategori,
    required this.fitur,
    required this.voucher,
    required this.mulaikerja,
    required this.selesaikerja,
    required this.tglPengajuan,
    required this.minPrice,
    required this.maxPrice,
    required this.lamaKerja,
    required this.deskripsi,
    required this.konfirmasi,
    required this.meeting,
    required this.dp,
    required this.repayment,
    required this.development,
    required this.finish,
    required this.cancel,
    required this.timeKonfirmasi,
    required this.timeMeeting,
    required this.timeDp,
    required this.timeRepayment,
    required this.timeDevelopment,
    required this.timeFinish,
    required this.timeCancel,
  });

  Map<String, dynamic> toJson() => {
        'nameApp': nameApp,
        'kategori': kategori,
        'fitur': fitur,
        'voucher': voucher,
        'mulaikerja': mulaikerja?.toIso8601String(),
        'selesaikerja': selesaikerja?.toIso8601String(),
        'tglPengajuan': tglPengajuan?.toIso8601String(),
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'lamaKerja': lamaKerja,
        'deskripsi': deskripsi,
        'konfirmasi': konfirmasi,
        'meeting': meeting,
        'dp': dp,
        'repayment': repayment,
        'development': development,
        'finish': finish,
        'cancel': cancel,
        'timeKonfirmasi': timeKonfirmasi?.toIso8601String(),
        'timeMeeting': timeMeeting?.toIso8601String(),
        'timeDp': timeDp?.toIso8601String(),
        'timeRepayment': timeRepayment?.toIso8601String(),
        'timeDevelopment': timeDevelopment?.toIso8601String(),
        'timeFinish': timeFinish?.toIso8601String(),
        'timeCancel': timeCancel?.toIso8601String(),
      };

  factory LayananMobile.fromJson(Map<String, dynamic> json) => LayananMobile(
        nameApp: json['nameApp'] as String,
        kategori: (json['kategori'] as List).map((e) => e as String).toList(),
        fitur: (json['fitur'] as List).map((e) => e as String).toList(),
        voucher: json['voucher'] as String,
        mulaikerja: json['mulaikerja'] != null ? DateTime.parse(json['mulaikerja']) : null,
        selesaikerja: json['selesaikerja'] != null ? DateTime.parse(json['selesaikerja']) : null,
        tglPengajuan: DateTime.parse(json['tglPengajuan']),
        minPrice: json['minPrice'] as int,
        maxPrice: json['maxPrice'] as int,
        lamaKerja: json['lamaKerja'] as int,
        deskripsi: json['deskripsi'] as String,
        konfirmasi: json['konfirmasi'] as bool,
        meeting: json['meeting'] as bool,
        dp: json['dp'] as bool,
        repayment: json['repayment'] as bool,
        development: json['development'] as bool,
        finish: json['finish'] as bool,
        cancel: json['cancel'] as bool,
        timeKonfirmasi: json['timeKonfirmasi'] != null ? DateTime.parse(json['timeKonfirmasi']) : null,
        timeMeeting: json['timeMeeting'] != null ? DateTime.parse(json['timeMeeting']) : null,
        timeDp: json['timeDp'] != null ? DateTime.parse(json['timeDp']) : null,
        timeRepayment: json['timeRepayment'] != null ? DateTime.parse(json['timeRepayment']) : null,
        timeDevelopment: json['timeDevelopment'] != null ? DateTime.parse(json['timeDevelopment']) : null,
        timeFinish: json['timeFinish'] != null ? DateTime.parse(json['timeFinish']) : null,
        timeCancel: json['timeCancel'] != null ? DateTime.parse(json['timeCancel']) : null,
      );

  factory LayananMobile.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return LayananMobile.fromJson(snapshot.data()!);
  }
}
