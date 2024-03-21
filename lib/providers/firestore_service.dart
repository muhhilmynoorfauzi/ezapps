import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezapps/model/layanan_mobile.dart';

class FirestoreService {
  static Future<void> addInventory(LayananMobile mobile) async {
    await FirebaseFirestore.instance.collection('layananMobile').add(mobile.toJson());
  }

  static Future<void> deleteInventory(String id) async {
    await FirebaseFirestore.instance.collection('layananMobile').doc(id).delete();
  }

  static Future<void> editInventory(
    String id,
    String nameApp,
    List<String> kategori,
    List<String> fitur,
    String voucher,
    DateTime? mulaikerja,
    DateTime? selesaikerja,
    DateTime? tglPengajuan,
    int minPrice,
    int maxPrice,
    int lamaKerja,
    String deskripsi,
    bool konfirmasi,
    bool meeting,
    bool dp,
    bool repayment,
    bool development,
    bool finish,
    bool cancel,
    DateTime? timeKonfirmasi,
    DateTime? timeMeeting,
    DateTime? timeDp,
    DateTime? timeDevelopment,
    DateTime? timeRepayment,
    DateTime? timeFinish,
    DateTime? timeCancel,
  ) async {
    final docRef = FirebaseFirestore.instance.collection('layananMobile').doc(id);

    final updates = <String, dynamic>{
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
      'timeDevelopment': timeDevelopment?.toIso8601String(),
      'timeRepayment': timeRepayment?.toIso8601String(),
      'timeFinish': timeFinish?.toIso8601String(),
      'timeCancel': timeCancel?.toIso8601String(),
    };

    await docRef.update(updates);
  }
}
