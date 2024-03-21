import 'package:avatar_glow/avatar_glow.dart';
import 'package:ezapps/model/layanan_mobile.dart';
import 'package:ezapps/providers/firestore_service.dart';
import 'package:ezapps/service/color.dart';
import 'package:ezapps/service/component.dart';
import 'package:ezapps/service/state_manajement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailTransaksiMobileAdmin extends StatefulWidget {
  LayananMobile mobileService;
  String id;

  DetailTransaksiMobileAdmin({required this.mobileService, required this.id});

  @override
  State<DetailTransaksiMobileAdmin> createState() => _DetailTransaksiMobileAdminState(mobileService, id);
}

class _DetailTransaksiMobileAdminState extends State<DetailTransaksiMobileAdmin> {
  LayananMobile mobileService;

  String id;

  _DetailTransaksiMobileAdminState(this.mobileService, this.id);

  @override
  Widget build(BuildContext context) {
    String status = mobileService.cancel
        ? 'Cancel'
        : mobileService.finish
            ? 'Selesai'
            : mobileService.repayment
                ? 'Pelunasan'
                : mobileService.development
                    ? 'Dikerjakan'
                    : mobileService.dp
                        ? 'Down Payment'
                        : mobileService.meeting
                            ? 'Meeting'
                            : mobileService.konfirmasi
                                ? 'Konfirmasi'
                                : '';
    String imageStatus = mobileService.cancel
        ? 'assets/cancel.png'
        : mobileService.finish
            ? 'assets/finish.png'
            : mobileService.repayment
                ? 'assets/repayment.png'
                : mobileService.development
                    ? 'assets/development.png'
                    : mobileService.dp
                        ? 'assets/repayment.png'
                        : mobileService.meeting
                            ? 'assets/meeting.png'
                            : mobileService.konfirmasi
                                ? 'assets/konfirmasi.png'
                                : '';
    IconData iconStatus = mobileService.cancel
        ? Icons.cancel_rounded
        : mobileService.finish
            ? Icons.check_circle
            : mobileService.repayment
                ? Icons.payment
                : mobileService.development
                    ? Icons.developer_mode
                    : mobileService.dp
                        ? Icons.monetization_on
                        : mobileService.meeting
                            ? Icons.timer
                            : mobileService.konfirmasi
                                ? Icons.hourglass_bottom_rounded
                                : Icons.error;
//--------------------------------------------------------------------------------------------------------------------
    Widget baris(String head, dynamic value) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(head)),
            SizedBox(
              width: lebar(context) * .55,
              child: Text(': $value'),
            ),
          ],
        );
    Widget onProgress() => Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: mobileService.cancel ? Colors.red.withOpacity(.3) : primary.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: mobileService.cancel ? Colors.red : primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        );
    Widget onWaiting() => Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 20,
              width: 20,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.3), borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 10,
              width: 10,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        );
    Widget timeLine(String time, bool status, String ket) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text(status ? time : '', textAlign: TextAlign.end, maxLines: 2)),
            status ? onProgress() : onWaiting(),
            Expanded(child: Text(ket, style: const TextStyle(fontWeight: FontWeight.bold))),
          ],
        );

//--------------------------------------------------------------------------------------------------------------------
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0),
            toolbarHeight: 60,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.navigate_before_rounded, size: 40, color: Colors.white),
            ),
            centerTitle: true,
            title: Text(mobileService.nameApp, style: const TextStyle(color: Colors.white)),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [primary, secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          //
          body: Stack(
            children: [
              SizedBox(
                height: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top) + 330,
                width: lebar(context),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        child: Stack(
                          children: [
                            Center(
                              child: AvatarGlow(
                                glowColor: mobileService.cancel ? Colors.red : primary,
                                glowRadiusFactor: 90,
                                duration: const Duration(milliseconds: 1500),
                                repeat: true,
                                animate: true,
                                curve: Curves.bounceIn,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    iconStatus,
                                    color: mobileService.cancel ? Colors.red : primary,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.only(top: 100),
                                child: Text(
                                  status,
                                  style: TextStyle(
                                    color: mobileService.cancel ? Colors.red : primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(imageStatus, height: 250, width: 250, fit: BoxFit.cover)
                  ],
                ),
              ),
              SizedBox(
                height: tinggi(context),
                width: lebar(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: (AppBar().preferredSize.height + MediaQuery.of(context).padding.top) + 230),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff95D9F3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 4,
                              width: 100,
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Container(
                              // margin: const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  timeLine(
                                    '${mobileService.timeKonfirmasi?.day}-'
                                        '${mobileService.timeKonfirmasi?.month}-'
                                        '${mobileService.timeKonfirmasi?.year} '
                                        '${mobileService.timeKonfirmasi?.timeZoneName}',
                                    mobileService.konfirmasi,
                                    'Menunggu Konfirmasi',
                                  ),
                                  Container(
                                    height: 40,
                                    width: 3,
                                    color: mobileService.cancel
                                        ? Colors.red
                                        : (mobileService.meeting)
                                            ? primary
                                            : Colors.grey,
                                  ),
                                  timeLine(
                                    '${mobileService.timeMeeting?.day}-'
                                        '${mobileService.timeMeeting?.month}-'
                                        '${mobileService.timeMeeting?.year} '
                                        '${mobileService.timeMeeting?.timeZoneName}',
                                    mobileService.meeting,
                                    'Meeting',
                                  ),
                                  Container(
                                    height: 40,
                                    width: 3,
                                    color: mobileService.cancel
                                        ? Colors.red
                                        : (mobileService.dp)
                                            ? primary
                                            : Colors.grey,
                                  ),
                                  timeLine(
                                    '${mobileService.timeDp?.day}-'
                                        '${mobileService.timeDp?.month}-'
                                        '${mobileService.timeDp?.year} '
                                        '${mobileService.timeDp?.timeZoneName}',
                                    mobileService.dp,
                                    'Down Payment',
                                  ),
                                  Container(
                                    height: 40,
                                    width: 3,
                                    color: mobileService.cancel
                                        ? Colors.red
                                        : (mobileService.development)
                                            ? primary
                                            : Colors.grey,
                                  ),
                                  timeLine(
                                    '${mobileService.timeDevelopment?.day}-'
                                        '${mobileService.timeDevelopment?.month}-'
                                        '${mobileService.timeDevelopment?.year} '
                                        '${mobileService.timeDevelopment?.timeZoneName}',
                                    mobileService.development,
                                    'Development',
                                  ),
                                  Container(
                                    height: 40,
                                    width: 3,
                                    color: mobileService.cancel
                                        ? Colors.red
                                        : (mobileService.repayment)
                                            ? primary
                                            : Colors.grey,
                                  ),
                                  timeLine(
                                    '${mobileService.timeRepayment?.day}-'
                                        '${mobileService.timeRepayment?.month}-'
                                        '${mobileService.timeRepayment?.year} '
                                        '${mobileService.timeRepayment?.timeZoneName}',
                                    mobileService.repayment,
                                    'Pelunasan',
                                  ),
                                  Container(
                                    height: 40,
                                    width: 3,
                                    color: mobileService.cancel
                                        ? Colors.red
                                        : (mobileService.finish)
                                            ? primary
                                            : Colors.grey,
                                  ),
                                  timeLine(
                                    '${mobileService.timeFinish?.day}-'
                                        '${mobileService.timeFinish?.month}-'
                                        '${mobileService.timeFinish?.year} '
                                        '${mobileService.timeFinish?.timeZoneName}',
                                    mobileService.finish,
                                    'Selesai',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 10,
                              width: lebar(context),
                              color: const Color(0xffEBEBEB),
                            ),
                            Container(
                              decoration: const BoxDecoration(color: Colors.white),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(child: Text('Nama Aplikasi')),
                                      SizedBox(
                                        width: lebar(context) * .55,
                                        child: Text(
                                          ': ${mobileService.nameApp}',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(child: Text('Kategori Aplikasi')),
                                      SizedBox(
                                        width: lebar(context) * .55,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(': '),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: List.generate(
                                                mobileService.kategori.length,
                                                (index) => Text('- ${mobileService.kategori[index]}'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(child: Text('Fitur Aplikasi')),
                                      SizedBox(
                                        width: lebar(context) * .55,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(': '),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: List.generate(
                                                mobileService.fitur.length,
                                                (index) => Text('- ${mobileService.fitur[index]}'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  baris('Voucher', mobileService.voucher),
                                  const SizedBox(height: 10),
                                  baris('Waktu Pengerjaan', '${mobileService.lamaKerja} bulan'),
                                  const SizedBox(height: 10),
                                  baris(
                                    'Minimal Harga',
                                    NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp ').format(mobileService.minPrice),
                                  ),
                                  const SizedBox(height: 10),
                                  baris(
                                    'Maksimal Harga',
                                    NumberFormat.currency(locale: 'id', decimalDigits: 0, name: 'Rp ').format(mobileService.maxPrice),
                                  ),
                                  const SizedBox(height: 10),
                                  baris('Deskripsi', mobileService.deskripsi),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: (mobileService.cancel)
              ? null
              : (mobileService.finish)
                  ? null
                  : (mobileService.repayment)
                      ? Container(
                          height: 60,
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          child: Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                context.read<Counter>().setLoading(true);

                                await FirestoreService.editInventory(
                                  id,
                                  mobileService.nameApp,
                                  mobileService.kategori,
                                  mobileService.fitur,
                                  mobileService.voucher,
                                  mobileService.mulaikerja,
                                  mobileService.selesaikerja,
                                  mobileService.tglPengajuan,
                                  mobileService.minPrice,
                                  mobileService.maxPrice,
                                  mobileService.lamaKerja,
                                  mobileService.deskripsi,
                                  mobileService.konfirmasi,
                                  mobileService.meeting,
                                  mobileService.dp,
                                  mobileService.development,
                                  mobileService.repayment,
                                  mobileService.finish = true,
                                  mobileService.cancel,
                                  mobileService.timeKonfirmasi,
                                  mobileService.timeMeeting,
                                  mobileService.timeDp,
                                  mobileService.timeDevelopment,
                                  mobileService.timeRepayment,
                                  mobileService.timeFinish = DateTime.now(),
                                  mobileService.timeCancel,
                                );
                                await Future.delayed(const Duration(seconds: 1));
                                setState(() => context.read<Counter>().setLoading(false));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                ),
                                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              ),
                              child: Text(
                                'Pelunasan Selesai',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : (mobileService.development)
                          ? Container(
                              height: 60,
                              color: Colors.white,
                              padding: const EdgeInsets.all(10),
                              child: Expanded(
                                child: OutlinedButton(
                                  onPressed: () async {
                                    context.read<Counter>().setLoading(true);

                                    await FirestoreService.editInventory(
                                      id,
                                      mobileService.nameApp,
                                      mobileService.kategori,
                                      mobileService.fitur,
                                      mobileService.voucher,
                                      mobileService.mulaikerja,
                                      mobileService.selesaikerja,
                                      mobileService.tglPengajuan,
                                      mobileService.minPrice,
                                      mobileService.maxPrice,
                                      mobileService.lamaKerja,
                                      mobileService.deskripsi,
                                      mobileService.konfirmasi,
                                      mobileService.meeting,
                                      mobileService.dp,
                                      mobileService.development,
                                      mobileService.repayment = true,
                                      mobileService.finish,
                                      mobileService.cancel,
                                      mobileService.timeKonfirmasi,
                                      mobileService.timeMeeting,
                                      mobileService.timeDp,
                                      mobileService.timeRepayment = DateTime.now(),
                                      mobileService.timeDevelopment,
                                      mobileService.timeFinish,
                                      mobileService.timeCancel,
                                    );
                                    await Future.delayed(const Duration(seconds: 1));
                                    setState(() => context.read<Counter>().setLoading(false));
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                    ),
                                    side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                  ),
                                  child: Text(
                                    'Development Selesai',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          : (mobileService.dp)
                              ? Container(
                                  height: 60,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () async {
                                            context.read<Counter>().setLoading(true);

                                            await FirestoreService.editInventory(
                                              id,
                                              mobileService.nameApp,
                                              mobileService.kategori,
                                              mobileService.fitur,
                                              mobileService.voucher,
                                              mobileService.mulaikerja,
                                              mobileService.selesaikerja,
                                              mobileService.tglPengajuan,
                                              mobileService.minPrice,
                                              mobileService.maxPrice,
                                              mobileService.lamaKerja,
                                              mobileService.deskripsi,
                                              mobileService.konfirmasi,
                                              mobileService.meeting,
                                              mobileService.dp,
                                              mobileService.development,
                                              mobileService.repayment,
                                              mobileService.finish,
                                              mobileService.cancel = true,
                                              mobileService.timeKonfirmasi,
                                              mobileService.timeMeeting,
                                              mobileService.timeDp,
                                              mobileService.timeDevelopment,
                                              mobileService.timeRepayment,
                                              mobileService.timeFinish,
                                              mobileService.timeCancel = DateTime.now(),
                                            );
                                            await Future.delayed(const Duration(seconds: 1));
                                            setState(() => context.read<Counter>().setLoading(false));
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                            ),
                                            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                          ),
                                          child: const Text(
                                            'Batalkan',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () async {
                                            context.read<Counter>().setLoading(true);

                                            await FirestoreService.editInventory(
                                              id,
                                              mobileService.nameApp,
                                              mobileService.kategori,
                                              mobileService.fitur,
                                              mobileService.voucher,
                                              mobileService.mulaikerja,
                                              mobileService.selesaikerja,
                                              mobileService.tglPengajuan,
                                              mobileService.minPrice,
                                              mobileService.maxPrice,
                                              mobileService.lamaKerja,
                                              mobileService.deskripsi,
                                              mobileService.konfirmasi,
                                              mobileService.meeting,
                                              mobileService.dp,
                                              mobileService.repayment,
                                              mobileService.development = true,
                                              mobileService.finish,
                                              mobileService.cancel,
                                              mobileService.timeKonfirmasi,
                                              mobileService.timeMeeting,
                                              mobileService.timeDp,
                                              mobileService.timeDevelopment = DateTime.now(),
                                              mobileService.timeRepayment,
                                              mobileService.timeFinish,
                                              mobileService.timeCancel,
                                            );
                                            await Future.delayed(const Duration(seconds: 1));
                                            setState(() => context.read<Counter>().setLoading(false));
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                            ),
                                            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                          ),
                                          child: Text(
                                            'DP Selesai',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (mobileService.meeting)
                                  ? Container(
                                      height: 60,
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () async {
                                                context.read<Counter>().setLoading(true);

                                                await FirestoreService.editInventory(
                                                  id,
                                                  mobileService.nameApp,
                                                  mobileService.kategori,
                                                  mobileService.fitur,
                                                  mobileService.voucher,
                                                  mobileService.mulaikerja,
                                                  mobileService.selesaikerja,
                                                  mobileService.tglPengajuan,
                                                  mobileService.minPrice,
                                                  mobileService.maxPrice,
                                                  mobileService.lamaKerja,
                                                  mobileService.deskripsi,
                                                  mobileService.konfirmasi,
                                                  mobileService.meeting,
                                                  mobileService.dp,
                                                  mobileService.development,
                                                  mobileService.repayment,
                                                  mobileService.finish,
                                                  mobileService.cancel = true,
                                                  mobileService.timeKonfirmasi,
                                                  mobileService.timeMeeting,
                                                  mobileService.timeDp,
                                                  mobileService.timeDevelopment,
                                                  mobileService.timeRepayment,
                                                  mobileService.timeFinish,
                                                  mobileService.timeCancel = DateTime.now(),
                                                );
                                                await Future.delayed(const Duration(seconds: 1));
                                                setState(() => context.read<Counter>().setLoading(false));
                                              },
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                ),
                                                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                              ),
                                              child: const Text(
                                                'Batalkan',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () async {
                                                context.read<Counter>().setLoading(true);

                                                await FirestoreService.editInventory(
                                                  id,
                                                  mobileService.nameApp,
                                                  mobileService.kategori,
                                                  mobileService.fitur,
                                                  mobileService.voucher,
                                                  mobileService.mulaikerja,
                                                  mobileService.selesaikerja,
                                                  mobileService.tglPengajuan,
                                                  mobileService.minPrice,
                                                  mobileService.maxPrice,
                                                  mobileService.lamaKerja,
                                                  mobileService.deskripsi,
                                                  mobileService.konfirmasi,
                                                  mobileService.meeting,
                                                  mobileService.dp = true,
                                                  mobileService.development,
                                                  mobileService.repayment,
                                                  mobileService.finish,
                                                  mobileService.cancel,
                                                  mobileService.timeKonfirmasi,
                                                  mobileService.timeMeeting,
                                                  mobileService.timeDp = DateTime.now(),
                                                  mobileService.timeDevelopment,
                                                  mobileService.timeRepayment,
                                                  mobileService.timeFinish,
                                                  mobileService.timeCancel,
                                                );
                                                await Future.delayed(const Duration(seconds: 1));
                                                setState(() => context.read<Counter>().setLoading(false));
                                              },
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                ),
                                                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                              ),
                                              child: Text(
                                                'Meeting Selesai',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : (mobileService.konfirmasi)
                                      ? Container(
                                          height: 60,
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: OutlinedButton(
                                                  onPressed: () async {
                                                    context.read<Counter>().setLoading(true);

                                                    await FirestoreService.editInventory(
                                                      id,
                                                      mobileService.nameApp,
                                                      mobileService.kategori,
                                                      mobileService.fitur,
                                                      mobileService.voucher,
                                                      mobileService.mulaikerja,
                                                      mobileService.selesaikerja,
                                                      mobileService.tglPengajuan,
                                                      mobileService.minPrice,
                                                      mobileService.maxPrice,
                                                      mobileService.lamaKerja,
                                                      mobileService.deskripsi,
                                                      mobileService.konfirmasi,
                                                      mobileService.meeting,
                                                      mobileService.dp,
                                                      mobileService.development,
                                                      mobileService.repayment,
                                                      mobileService.finish,
                                                      mobileService.cancel = true,
                                                      mobileService.timeKonfirmasi,
                                                      mobileService.timeMeeting,
                                                      mobileService.timeDp,
                                                      mobileService.timeDevelopment,
                                                      mobileService.timeRepayment,
                                                      mobileService.timeFinish,
                                                      mobileService.timeCancel = DateTime.now(),
                                                    );
                                                    await Future.delayed(const Duration(seconds: 1));
                                                    setState(() => context.read<Counter>().setLoading(false));
                                                  },
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                    ),
                                                    side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                                  ),
                                                  child: const Text(
                                                    'Batalkan',
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: OutlinedButton(
                                                  onPressed: () async {
                                                    context.read<Counter>().setLoading(true);

                                                    await FirestoreService.editInventory(
                                                      id,
                                                      mobileService.nameApp,
                                                      mobileService.kategori,
                                                      mobileService.fitur,
                                                      mobileService.voucher,
                                                      mobileService.mulaikerja,
                                                      mobileService.selesaikerja,
                                                      mobileService.tglPengajuan,
                                                      mobileService.minPrice,
                                                      mobileService.maxPrice,
                                                      mobileService.lamaKerja,
                                                      mobileService.deskripsi,
                                                      mobileService.konfirmasi,
                                                      mobileService.meeting = true,
                                                      mobileService.dp,
                                                      mobileService.development,
                                                      mobileService.repayment,
                                                      mobileService.finish,
                                                      mobileService.cancel,
                                                      mobileService.timeKonfirmasi,
                                                      mobileService.timeMeeting = DateTime.now(),
                                                      mobileService.timeDp,
                                                      mobileService.timeDevelopment,
                                                      mobileService.timeRepayment,
                                                      mobileService.timeFinish,
                                                      mobileService.timeCancel,
                                                    );
                                                    await Future.delayed(const Duration(seconds: 1));
                                                    setState(() => context.read<Counter>().setLoading(false));
                                                  },
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                    ),
                                                    side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                                  ),
                                                  child: Text(
                                                    'Konfirmasi',
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : null,
        ),
        (context.watch<Counter>().loading)
            ? Container(
                height: tinggi(context),
                width: lebar(context),
                color: Colors.black.withOpacity(.5),
                child: Center(child: CircularProgressIndicator(color: primary)),
              )
            : Container(),
      ],
    );
  }
}
