import 'package:flutter/material.dart';
import '../models/materi.dart';
import '../models/module.dart';

// MODULE 1: HARDWARE DASAR
final List<Materi> module1Materi = [
  const Materi(
    title: 'Central Processing Unit (CPU)',
    description: 'Otak komputer yang memproses semua instruksi.',
    homeImagePath: 'assets/images/cpu.png',
    detailImagePath: 'assets/images/CPU New.jpg',
  ),
  const Materi(
    title: 'Motherboard',
    description: 'Tulang punggung penghubung seluruh komponen.',
    homeImagePath: 'assets/images/motherboard.png',
    detailImagePath: 'assets/images/Mobo New.jpg',
  ),
  const Materi(
    title: 'Random Access Memory (RAM)',
    description: 'Memori kerja sementara untuk multitasking.',
    homeImagePath: 'assets/images/ram.png',
    detailImagePath: 'assets/images/RAM New.jpg',
  ),
  const Materi(
    title: 'Graphics Processing Unit (GPU)',
    description: 'Pengolah visual, rendering grafis dan video.',
    homeImagePath: 'assets/images/gpu.png',
    detailImagePath: 'assets/images/GPU New.jpg',
  ),
  const Materi(
    title: 'Storage (Media Penyimpanan)',
    description: 'Penyimpanan data permanen (HDD & SSD).',
    homeImagePath: 'assets/images/storage.png',
    detailImagePath: 'assets/images/Storage New.jpg',
  ),
  const Materi(
    title: 'Power Supply Unit (PSU)',
    description: 'Pemasok daya listrik stabil ke komponen.',
    homeImagePath: 'assets/images/psu.png',
    detailImagePath: 'assets/images/PSU New.jpg',
  ),
];


// MODULE 2: INPUT & OUTPUT
final List<Materi> module2Materi = [
  const Materi(
    title: 'Perangkat Input',
    description: 'Alat untuk memasukkan data (Keyboard, Mouse, dll).',
    homeImagePath: 'assets/Module 2/Input.png',
    detailImagePath: 'assets/Module 2/input1.png',
  ),
  const Materi(
    title: 'Perangkat Output',
    description: 'Alat untuk menampilkan hasil (Monitor, Printer, dll).',
    homeImagePath: 'assets/Module 2/Output.png',
    detailImagePath: 'assets/Module 2/Output.png',
  ),
];


// MODULE 3: STORAGE & MEMORY
final List<Materi> module3Materi = [
  const Materi(
    title: 'Pengertian Storage',
    description: 'Definisi, fungsi utama, dan contoh data.',
    homeImagePath: 'assets/Module 3/Pengertian Storage.png',
    detailImagePath: 'assets/Module 3/1.png',
  ),
  const Materi(
    title: 'Jenis Storage',
    description: 'Primary (Volatile) vs Secondary (Non-Volatile).',
    homeImagePath: 'assets/Module 3/Jenis Storage.png',
    detailImagePath: 'assets/Module 3/2.png',
  ),
  const Materi(
    title: 'Jenis Media Penyimpanan',
    description: 'Detail HDD, SSD, Flashdisk, dan Optical Disc.',
    homeImagePath: 'assets/Module 3/Jenis Media Penyimpanan.png',
    detailImagePath: 'assets/Module 3/3.png',
  ),
  const Materi(
    title: 'Satuan Kapasitas',
    description: 'Bit, Byte, KB, MB, GB, hingga Terabyte.',
    homeImagePath: 'assets/Module 3/Satuan Kapasitas.png',
    detailImagePath: 'assets/Module 3/4.png',
  ),
  const Materi(
    title: 'Tips Merawat Storage',
    description: 'Cara menjaga HDD dan SSD agar awet.',
    homeImagePath: 'assets/Module 3/Tips Merawat Storage.png',
    detailImagePath: 'assets/Module 3/5.png',
  ),
];


// MODULE 4: JARINGAN
final List<Materi> module4Materi = [
  const Materi(
    title: 'Pengertian Jaringan',
    description: 'Definisi, Node, Host, dan Media Transmisi.',
    homeImagePath: 'assets/Module 4/Pengertian Jaringan.png',
    detailImagePath: 'assets/Module 4/Pengertian Jaringan.png',
  ),
  const Materi(
    title: 'Manfaat Jaringan',
    description: 'Sharing resources, komunikasi, dan keamanan.',
    homeImagePath: 'assets/Module 4/Manfaat Jaringan.png',
    detailImagePath: 'assets/Module 4/Manfaat Jaringan.png',
  ),
  const Materi(
    title: 'Jenis Jaringan',
    description: 'Klasifikasi LAN, MAN, WAN.',
    homeImagePath: 'assets/Module 4/Jenis Jaringan.png',
    detailImagePath: 'assets/Module 4/Jenis Jaringan.png',
  ),
  const Materi(
    title: 'Komponen Utama',
    description: 'Server, Client, NIC, Switch, Router.',
    homeImagePath: 'assets/Module 4/Komponen Utama.png',
    detailImagePath: 'assets/Module 4/Komponen Utama.png',
  ),
  const Materi(
    title: 'Jenis Koneksi',
    description: 'Wired (Kabel) vs Wireless (Nirkabel).',
    homeImagePath: 'assets/Module 4/Jenis Koneksi.png',
    detailImagePath: 'assets/Module 4/Jenis Koneksi.png',
  ),
  const Materi(
    title: 'Istilah Dasar',
    description: 'IP Address, DNS, Bandwidth, Latency.',
    homeImagePath: 'assets/Module 4/Istilah Dasar.png',
    detailImagePath: 'assets/Module 4/Istilah Dasar.png',
  ),
  const Materi(
    title: 'Keamanan Jaringan',
    description: 'Ancaman Malware, Phishing, dan Tips Aman.',
    homeImagePath: 'assets/Module 4/Keamanan Jaringan.png',
    detailImagePath: 'assets/Module 4/Keamanan Jaringan.png',
  ),
];


final List<Materi> allMateri = [
  ...module1Materi,
  ...module2Materi,
  ...module3Materi,
  ...module4Materi,
];

final List<Module> allModules = [
  const Module(
    moduleNumber: 'Module 1',
    title: 'Pengenalan Dasar Perangkat Keras Komputer',
    description: 'Pelajari dasar-dasar perangkat keras komputer.',
    imagePath: 'assets/images/Module 1.jpg',
  ),
  const Module(
    moduleNumber: 'Module 2',
    title: 'Perangkat Input dan Output',
    description: 'Jelajahi perangkat masukan dan keluaran.',
    imagePath: 'assets/images/Module 2.jpg',
  ),
  const Module(
    moduleNumber: 'Module 3',
    title: 'Penyimpanan dan Memori',
    description: 'Memahami RAM, HDD, SSD, dan cara kerjanya.',
    imagePath: 'assets/images/Module 3.jpg',
  ),
  const Module(
    moduleNumber: 'Module 4',
    title: 'Dasar-Dasar Jaringan',
    description: 'Pelajari konsep jaringan, router, dan keamanan.',
    imagePath: 'assets/images/Module 4.jpg',
  ),
];

final List<Question> quizModule1Questions = [
  const Question(
    questionText: 'Dalam siklus pengolahan data (Information Pro...ang benar saat Anda mengetik dokumen lalu menyimpannya adalah:',
    options: [
      'Process → Input → Output → Storage',
      'Input → Process → Output → Storage',
      'Input → Storage → Process → Output',
      'Storage → Input → Process → Output',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Mengapa Central Processing Unit (CPU) sering disebut sebagai "otak" komputer?',
    options: [
      'Karena CPU menyimpan semua data secara permanen seperti ingatan manusia',
      'Karena CPU mengatur pasokan listrik ke seluruh komponen motherboard',
      'Karena CPU menerjemahkan dan mengeksekusi instruksi dari perangkat lunak dan keras',
      'Karena CPU adalah komponen paling besar secara fisik di dalam casing',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Sebuah komputer mengalami "bottleneck" saat bermain game karena frame rate sangat rendah, padahal GPU sudah cukup kuat. Komponen hardware mana yang paling mungkin menjadi penyebab lambatnya performa grafis?',
    options: [
      'Keyboard',
      'CPU (Prosesor) yang terlalu lemah',
      'Power Supply Unit yang terlalu besar',
      'Monitor dengan refresh rate tinggi',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Istilah "Overheating" pada komputer biasanya merujuk pada kondisi di mana:',
    options: [
      'Komputer terlalu lama menyala dan harus dimatikan secara manual',
      'Suhu komponen seperti CPU atau GPU melebihi batas aman sehingga performa menurun atau sistem mati mendadak',
      'Monitor menampilkan warna yang terlalu terang',
      'Keyboard tidak merespon saat digunakan',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Dalam konteks rakitan komputer, urutan langkah yang paling logis saat merakit PC dari awal adalah:',
    options: [
      'Memasang OS dulu, lalu merakit komponen hardware',
      'Memasang semua komponen hardware terlebih dahulu, baru menginstal sistem operasi',
      'Menginstal aplikasi game dulu sebelum memasang CPU',
      'Memasang GPU terlebih dahulu sebelum memasang motherboard di casing',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Motherboard dengan form factor "Micro ATX" memiliki karakteristik utama:',
    options: [
      'Ukuran paling besar dan hanya cocok untuk server',
      'Ukuran lebih kecil dari ATX standar, dengan slot ekspansi lebih sedikit',
      'Tidak mendukung prosesor modern',
      'Hanya bisa dipasang di casing berukuran Full Tower',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Jika sebuah komputer memiliki spesifikasi: CPU 4-Core, RAM 4GB, dan menggunakan Integrated Graphics, maka batasan utama untuk tugas berat seperti editing video 4K adalah:',
    options: [
      'Jumlah core CPU yang terlalu banyak',
      'Kapasitas RAM yang terbatas dan performa GPU yang lemah',
      'Ukuran casing yang terlalu kecil',
      'Kecepatan kipas processor',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Istilah "Clock Speed" 3.5 GHz pada spesifikasi prosesor menunjukkan bahwa:',
    options: [
      'Prosesor memiliki 3.5 juta transistor',
      'Prosesor dapat mentransfer data sebesar 3.5 Gigabytes per detik',
      'Prosesor dapat menjalankan 3.5 miliar siklus instruksi per detik',
      'Prosesor mengkonsumsi daya listrik 3.5 Gigawatt',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Apa fungsi utama dari Motherboard dalam arsitektur komputer?',
    options: [
      'Mengubah arus AC menjadi DC untuk komponen internal',
      'Menyediakan sirkuit penghubung agar semua komponen dapat saling berkomunikasi',
      'Menyimpan data sementara saat komputer dimatikan',
      'Mendinginkan suhu prosesor saat bekerja berat',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Ketika sebuah aplikasi "crash" atau komputer "hang" karena penggunaan memori sangat tinggi, komponen hardware mana yang kemungkinan besar kapasitasnya telah penuh terpakai sebelum data dipindah ke storage?',
    options: [
      'VRAM pada GPU',
      'Cache L3 pada CPU',
      'RAM (Random Access Memory)',
      'ROM pada Motherboard',
    ],
    correctAnswerIndex: 2,
  ),
];

final List<Question> quizModule2Questions = [
  const Question(
    questionText: 'Touchscreen pada smartphone atau tablet dikategorikan sebagai perangkat apa?',
    options: [
      'Murni Input Device',
      'Murni Output Device',
      'I/O Device (Input dan Output sekaligus)',
      'Processing Device',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Scanner bekerja dengan mengubah dokumen fisik...enjadi data digital. Proses konversi data yang terjadi adalah:',
    options: [
      'Digital to Analog (DAC)',
      'Analog to Digital (ADC)',
      'Binary to Decimal',
      'Text to Speech',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Perangkat berikut yang termasuk "perangkat input" TETAPI juga sering dianggap sebagai perangkat pointing device adalah:',
    options: [
      'Keyboard',
      'Mouse',
      'Printer',
      'Speaker',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Manakah dari berikut ini yang merupakan contoh perangkat output yang menghasilkan "hard copy"?',
    options: [
      'Monitor',
      'Speaker',
      'Printer',
      'Scanner',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Dalam konteks presentasi di kelas, perangkat manakah yang PALING tepat digunakan untuk menampilkan materi dari laptop ke layar besar agar bisa dilihat semua siswa?',
    options: [
      'Printer',
      'Projector',
      'Scanner',
      'Plotter',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Perbedaan utama antara Monitor dan Projector dalam konteks perangkat output visual adalah:',
    options: [
      'Monitor hanya bisa digunakan untuk komputer, sedangkan Projector hanya untuk HP',
      'Monitor menampilkan gambar pada panel sendiri, sedangkan Projector memproyeksikan gambar ke permukaan lain',
      'Monitor menggunakan sinar laser, Projector tidak',
      'Projector selalu memiliki kualitas gambar lebih tajam daripada monitor',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Headphone memiliki fungsi yang mirip dengan speaker, tetapi keunggulan utamanya adalah:',
    options: [
      'Tidak membutuhkan listrik sama sekali',
      'Hanya bisa digunakan di komputer, tidak bisa di HP',
      'Memberikan output audio secara personal tanpa mengganggu orang sekitar',
      'Mengubah suara menjadi teks otomatis',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Perangkat berikut yang termasuk "Hybrid I/O Device" karena bisa sekaligus menjadi input dan output adalah:',
    options: [
      'Touchscreen',
      'Printer Inkjet',
      'Speaker aktif',
      'Microphone',
    ],
    correctAnswerIndex: 0,
  ),
  const Question(
    questionText: 'Dalam sistem audio komputer, Speaker berfungsi mengubah sinyal elektrik dari Sound Card menjadi:',
    options: [
      'Data digital biner',
      'Getaran fisik yang menghasilkan gelombang suara',
      'Sinyal radio FM',
      'Arus listrik DC',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Mengapa refresh rate (Hz) yang tinggi pada monitor dianggap penting bagi desainer grafis atau gamer?',
    options: [
      'Agar warna yang dihasilkan lebih kontras',
      'Agar resolusi layar menjadi 4K',
      'Agar perpindahan gambar terlihat lebih halus dan mengurangi motion blur',
      'Agar monitor tidak cepat panas',
    ],
    correctAnswerIndex: 2,
  ),
];

final List<Question> quizModule3Questions = [
  const Question(
    questionText: 'Perbedaan paling fundamental antara RAM (Random Access Memory) dan Storage (seperti SSD/HDD) adalah:',
    options: [
      'RAM lebih murah per gigabyte dibandingkan Storage',
      'RAM bersifat Volatile (data hilang saat listrik mati), Storage bersifat Non-Volatile',
      'Kapasitas RAM selalu lebih besar daripada Storage',
      'RAM digunakan untuk menyimpan foto dan video, Storage untuk menjalankan aplikasi',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Mengapa SSD (Solid State Drive) jauh lebih cepat daripada HDD (Hard Disk Drive) konvensional?',
    options: [
      'SSD menggunakan piringan magnetik yang berputar lebih cepat',
      'SSD terhubung langsung ke prosesor tanpa melalui motherboard',
      'SSD menggunakan chip flash memory tanpa komponen bergerak, menghilangkan latensi pencarian mekanis',
      'SSD memiliki kapasitas yang lebih kecil sehingga lebih mudah dicari datanya',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Teknologi "NVMe" pada media penyimpanan modern merujuk pada:',
    options: [
      'Jenis file sistem khusus untuk sistem operasi Linux',
      'Protokol penyimpanan yang menggunakan jalur PCIe untuk kecepatan transfer data tinggi',
      'Metode kompresi data pada harddisk eksternal',
      'Fitur keamanan untuk mengenkripsi seluruh isi harddisk',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Jika sebuah laptop memiliki RAM 8GB dan Storage SSD 256GB, pernyataan mana yang PALING tepat?',
    options: [
      'RAM menyimpan data permanen, SSD hanya menyimpan data sementara',
      'SSD digunakan untuk menyimpan sistem operasi dan file, sedangkan RAM menyimpan data sementara saat program berjalan',
      'Keduanya menyimpan data permanen dengan cara yang sama',
      'RAM hanya digunakan saat proses booting, setelah itu tidak terpakai',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Istilah "Fragmentasi" pada HDD berkaitan dengan:',
    options: [
      'Pecahnya file menjadi beberapa bagian yang tersimpan di lokasi berbeda pada piringan',
      'Rusaknya kabel SATA yang menghubungkan HDD ke motherboard',
      'Hilangnya data karena terkena virus',
      'Proses penghapusan file secara permanen',
    ],
    correctAnswerIndex: 0,
  ),
  const Question(
    questionText: 'Mengapa penggunaan SSD sangat disarankan untuk sistem operasi dibandingkan HDD?',
    options: [
      'Karena SSD tidak membutuhkan driver',
      'Karena SSD dapat menjalankan sistem operasi tanpa prosesor',
      'Karena SSD memberikan waktu booting dan loading aplikasi yang jauh lebih cepat',
      'Karena SSD tidak membutuhkan daya listrik sama sekali',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Konsep "Backup" data paling tepat dijelaskan sebagai:',
    options: [
      'Memindahkan semua data ke Recycle Bin',
      'Menyimpan salinan data penting ke lokasi lain (drive lain, harddisk eksternal, atau cloud)',
      'Menghapus data lama lalu menulis data baru',
      'Memperbesar kapasitas RAM agar data tidak hilang',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Istilah "Read/Write Speed" pada media penyimpanan mengacu pada:',
    options: [
      'Kecepatan CPU dalam memproses data grafik',
      'Kecepatan monitor menampilkan gambar',
      'Kecepatan perangkat penyimpanan dalam membaca dan menulis data',
      'Kecepatan RAM melakukan refresh',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'Perbedaan utama antara "Primary Storage" dan "Secondary Storage" adalah:',
    options: [
      'Primary Storage selalu berupa HDD, Secondary Storage selalu berupa SSD',
      'Primary Storage merujuk pada RAM yang diakses langsung oleh CPU, Secondary Storage adalah media penyimpanan jangka panjang seperti HDD/SSD',
      'Primary Storage hanya digunakan di server, Secondary Storage hanya di laptop',
      'Primary Storage adalah media eksternal, Secondary Storage adalah media internal',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Apa keunggulan HDD (Hard Disk Drive) dibandin...membuatnya masih relevan digunakan di server atau data center?',
    options: [
      'Kecepatannya lebih tinggi',
      'Tahan guncangan dan bantingan',
      'Harga per Gigabyte lebih murah untuk kapasitas penyimpanan massal yang sangat besar',
      'Tidak menghasilkan panas sama sekali',
    ],
    correctAnswerIndex: 2,
  ),
];

final List<Question> quizModule4Questions = [
  const Question(
    questionText: 'Perangkat jaringan yang bekerja "cerdas" dengan menggunakan MAC Address untuk mengirimkan paket data hanya ke port tujuan yang spesifik adalah:',
    options: [
      'Hub',
      'Switch',
      'Repeater',
      'Amplifier',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Fungsi utama dari Router dalam jaringan komputer adalah:',
    options: [
      'Menghubungkan satu komputer ke komputer lain dalam satu ruangan',
      'Menghubungkan dua atau lebih jaringan yang berbeda (misal LAN ke Internet) dan menentukan rute terbaik',
      'Mengubah sinyal digital menjadi sinyal analog',
      'Menguatkan sinyal WiFi di dalam ruangan',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Dalam topologi jaringan "Star", perangkat yang biasanya berada di tengah sebagai penghubung semua komputer (node) adalah:',
    options: [
      'Modem',
      'Switch atau Hub',
      'Printer',
      'Access Point',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Istilah "Bandwidth" dalam jaringan komputer mengacu pada:',
    options: [
      'Jumlah perangkat yang terhubung dalam satu jaringan',
      'Kapasitas maksimum jalur komunikasi untuk mengirim data dalam satuan waktu tertentu',
      'Kecepatan putaran harddisk',
      'Banyaknya tab yang dibuka di browser',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Jika sebuah jaringan sekolah menggunakan IP Address kelas C (contoh: 192.168.1.x), maka hal ini biasanya menunjukkan:',
    options: [
      'Jaringan berskala internasional',
      'Jaringan lokal dengan jumlah host yang relatif kecil',
      'Jaringan yang hanya bisa diakses di malam hari',
      'Jaringan yang tidak memerlukan router',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Fungsi utama dari "Access Point" dalam jaringan nirkabel (WiFi) adalah:',
    options: [
      'Mengubah sinyal listrik menjadi suara',
      'Menghubungkan perangkat wireless ke jaringan kabel (LAN) dan menyediakan layanan WiFi',
      'Menyimpan file secara online',
      'Mengatur alamat IP untuk setiap komputer',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Perbedaan utama antara "LAN" (Local Area Network) dan "WAN" (Wide Area Network) adalah:',
    options: [
      'LAN menggunakan kabel, WAN tidak pernah menggunakan kabel',
      'LAN mencakup area kecil (seperti gedung atau sekolah), sedangkan WAN mencakup area luas antar kota/negara',
      'WAN hanya digunakan untuk game online',
      'LAN tidak memerlukan perangkat jaringan',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Apa yang dimaksud dengan "Firewall" dalam konteks keamanan jaringan?',
    options: [
      'Perangkat keras untuk mempercepat koneksi internet',
      'Sistem (perangkat lunak atau perangkat keras) yang memantau dan menyaring lalu lintas jaringan berdasarkan aturan keamanan',
      'Jenis kabel jaringan yang tahan api',
      'Program untuk memperbesar bandwidth',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Apa yang dimaksud dengan "Latency" atau "Ping" dalam jaringan?',
    options: [
      'Jumlah data yang bisa dikirim dalam satu detik',
      'Waktu jeda yang dibutuhkan data untuk bergerak dari sumber ke tujuan',
      'Kekuatan sinyal WiFi dalam satuan dBm',
      'Kapasitas maksimum kabel fiber optik',
    ],
    correctAnswerIndex: 1,
  ),
  const Question(
    questionText: 'Jika Anda menggunakan kabel LAN (UTP) dengan susunan warna tipe "Cross-over", kabel tersebut biasanya digunakan untuk menghubungkan:',
    options: [
      'Komputer ke Switch',
      'Komputer ke Router',
      'Dua perangkat yang sama (misal Komputer ke Komputer secara langsung)',
      'Switch ke Router',
    ],
    correctAnswerIndex: 2,
  ),
  const Question(
    questionText: 'DNS (Domain Name System) berfungsi untuk:',
    options: [
      'Mengenkripsi data agar tidak dicuri hacker',
      'Menerjemahkan nama domain yang mudah diingat manusia (mis.../www.google.com/search?q=google.com) menjadi alamat IP numerik',
      'Mengatur kecepatan download dan upload',
      'Menghapus virus dari jaringan',
    ],
    correctAnswerIndex: 1,
  ),
];

final Map<String, List<Question>> moduleQuizMap = {
  'Pengenalan Dasar Perangkat Keras Komputer': quizModule1Questions,
  'Perangkat Input dan Output': quizModule2Questions,
  'Penyimpanan dan Memori': quizModule3Questions,
  'Dasar-Dasar Jaringan': quizModule4Questions,
};

class ContentHelpers {
  static Widget paragraph(BuildContext context, List<TextSpan> spans) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 16, height: 1.6),
            children: spans,
          ),
        ),
      );

  static Widget subTitle(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );

  static Widget header(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 24.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // helper bullet list
  static Widget bulletList(BuildContext context, List<String> items) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      height: 1.5,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((text) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Module1Content {
  // 1. CPU
  static List<Widget> cpuContent(BuildContext context) => [
    // --- HEADER IMAGE ---
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/cpu.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Central Processing Unit (CPU)"),
    ContentHelpers.subTitle(context, "Pengertian CPU"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Central Processing Unit (CPU) adalah komponen perangkat keras yang sering disebut sebagai ',
      ),
      TextSpan(
        text: '"otak" dari komputer',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text:
        '. Secara fisik, CPU berbentuk chip sirkuit terintegrasi (Integrated Circuit) yang menjadi pusat pengolahan data. '
            'CPU bertugas menerima instruksi, memprosesnya, dan menghasilkan output yang diinginkan. Tanpa CPU, komputer tidak dapat menjalankan program apa pun.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Bagian-Bagian CPU"),
    ContentHelpers.bulletList(context, [
      'Control Unit (CU): Mengatur lalu lintas data, mengambil instruksi dari memori, menerjemahkan, lalu mengirim sinyal kontrol ke bagian lain.',
      'Arithmetic Logic Unit (ALU): Bagian "kalkulator" yang menangani operasi aritmatika (tambah, kurang, kali) dan logika (perbandingan nilai).',
      'Register: Memori sangat kecil dan super cepat yang menyimpan data atau instruksi yang sedang diproses langsung oleh CPU.',
      'Cache Memory (L1, L2, L3): Memori perantara berkecepatan tinggi yang menyimpan data yang sering digunakan agar akses CPU lebih cepat dibanding langsung ke RAM.',
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'CPU memegang peran paling fundamental sebagai pusat pengendali dan pemrosesan informasi. '
            'Kinerja komputer sangat bergantung pada kualitas komponen di dalam CPU (seperti kecepatan CU, jumlah core, dan kapasitas cache). ',
      ),
      TextSpan(
        text:
        'Memahami bagian-bagian CPU membantu kita mengerti bagaimana komputer "berpikir" dan mengapa spesifikasi tertentu membuat komputer bekerja lebih cepat.',
      ),
    ]),
  ];

  // 2. MOTHERBOARD
  static List<Widget> motherboardContent(BuildContext context) => [
    // --- HEADER IMAGE ---
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/motherboard.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Motherboard (Mainboard)"),
    ContentHelpers.subTitle(context, "Pengertian Motherboard"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Motherboard adalah papan sirkuit utama yang menghubungkan dan mengatur seluruh komponen komputer agar dapat bekerja secara terkoordinasi. '
            'Tanpa motherboard, CPU, RAM, GPU, storage, dan perangkat input-output tidak dapat saling berkomunikasi.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Fungsi Umum Motherboard"),
    ContentHelpers.bulletList(context, [
      "Menyediakan slot dan konektor untuk semua komponen.",
      "Mengatur jalur komunikasi data antar perangkat.",
      "Mendistribusikan daya listrik dari PSU ke seluruh komponen.",
      "Menentukan kompatibilitas perangkat (CPU, RAM, penyimpanan, dan slot ekspansi).",
      "Mengatur kecepatan, konfigurasi, dan fitur melalui BIOS/UEFI.",
    ]),
    ContentHelpers.subTitle(context, "Bagian-Bagian Motherboard"),
    ContentHelpers.bulletList(context, [
      "CPU Socket — Tempat memasang prosesor. Jenis socket menentukan prosesor yang kompatibel (Intel: LGA, AMD: AM4/AM5).",
      "RAM Slots (Memory Slots) — Slot untuk memasang RAM (DDR3, DDR4, DDR5).",
      "PCI Express (PCIe) Slots — Slot ekspansi untuk GPU, Wi-Fi Card, Sound Card, Capture Card, dll.",
      "SATA Ports — Konektor untuk HDD, SSD SATA, atau DVD Drive.",
      "M.2 Slot — Slot untuk SSD NVMe berkecepatan tinggi.",
      "Chipset (PCH) — Pusat kontrol yang mengatur komunikasi antara CPU, RAM, storage, dan I/O.",
      "24-pin ATX Power Connector — Sumber daya utama motherboard dari PSU.",
      "8-pin / 4-pin CPU Power Connector — Daya khusus untuk prosesor.",
      "Back Panel I/O Ports — Port USB, LAN, HDMI, DisplayPort, Audio, PS/2, dan lainnya.",
      "USB Headers — Konektor untuk port USB depan casing (USB 2.0, 3.0, 3.2, USB-C).",
      "Fan Headers (3-pin / 4-pin) — Konektor kipas CPU & kipas casing.",
      "CMOS Battery — Baterai kecil yang menjaga pengaturan BIOS/UEFI.",
      "BIOS / UEFI Chip — Firmware untuk proses booting dan konfigurasi dasar komputer.",
      "System Panel Connector — Konektor tombol Power, Reset, LED Power, dan LED HDD.",
      "Audio Headers / SPDIF — Konektor audio untuk panel depan casing atau perangkat audio eksternal.",
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Motherboard adalah komponen inti yang menentukan jenis prosesor, jumlah dan jenis RAM, dukungan storage, slot ekspansi, serta fitur tambahan. '
            'Semua komponen komputer berkomunikasi melalui motherboard, sehingga kualitas motherboard sangat berpengaruh pada performa keseluruhan, stabilitas, dan kemampuan upgrade komputer.',
      ),
    ]),
  ];

  // 3. RAM
  static List<Widget> ramContent(BuildContext context) => [
    // --- HEADER IMAGE ---
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/ram.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Random Access Memory (RAM)"),
    ContentHelpers.subTitle(context, "Pengertian RAM"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'RAM adalah memori sementara yang digunakan komputer untuk menyimpan data yang sedang diproses. '
            'Data di RAM akan hilang ketika komputer dimatikan. Semakin besar kapasitas RAM, semakin banyak aplikasi yang dapat berjalan bersamaan tanpa membuat komputer menjadi lambat.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Fungsi Utama RAM"),
    ContentHelpers.bulletList(context, [
      'Menyimpan data sementara dari program yang sedang berjalan.',
      'Membantu komputer melakukan multitasking dengan lancar.',
      'Mempercepat akses data dibandingkan storage seperti HDD atau SSD.',
    ]),
    ContentHelpers.subTitle(context, "Jenis & Bentuk RAM"),
    ContentHelpers.bulletList(context, [
      'DIMM / LONGDIMM (Desktop RAM): RAM ukuran panjang untuk PC desktop. Panjang ±13,3 cm, 240–288 pin, performa stabil, tegangan lebih besar.',
      'SODIMM (Laptop RAM): RAM berukuran kecil untuk Laptop dan Mini PC. Panjang ±6,7 cm, 200–260 pin, hemat daya, cocok untuk laptop/mini PC/AIO.',
      'Kapasitas RAM umum: 4GB, 8GB, 16GB, 32GB. Kapasitas laptop dan desktop sama, hanya bentuk fisik berbeda.',
      'Generasi RAM: DDR2, DDR3, DDR4, DDR5 (paling baru dan paling cepat).',
    ]),
    ContentHelpers.subTitle(context, "Catatan Penting"),
    ContentHelpers.bulletList(context, [
      'Semakin besar kapasitas RAM → multitasking lebih lancar.',
      'Jenis fisik tidak bisa ditukar (SODIMM ≠ DIMM).',
      'Generasi RAM tidak kompatibel silang (DDR3 tidak bisa dipasang di motherboard DDR4).',
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'RAM adalah komponen penting yang membuat komputer terasa cepat dan responsif. '
            'Kapasitas dan generasi RAM berpengaruh besar pada kelancaran multitasking, performa aplikasi, dan pengalaman penggunaan komputer. '
            'Saat memilih RAM, perhatikan bentuk (DIMM/SODIMM), generasi, dan kecocokan dengan motherboard.',
      ),
    ]),
  ];

  // 4. GPU (pakai versi teks lama kamu, tanpa banyak perubahan)
  static List<Widget> gpuContent(BuildContext context) => [
    // --- HEADER IMAGE ---
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/gpu.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Graphics Processing Unit (GPU)"),
    ContentHelpers.subTitle(context, "A. Pengertian"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'GPU adalah sirkuit elektronik khusus yang dirancang untuk mempercepat pembuatan gambar dan grafis yang dikirim ke layar. '
            'Sering disebut VGA Card, meskipun istilah teknisnya adalah Graphics Card atau Kartu Grafis.',
      ),
    ]),
    ContentHelpers.subTitle(context, "B. Fungsi Utama"),
    ContentHelpers.bulletList(context, [
      'Rendering grafis 2D dan 3D.',
      'Membantu proses komputasi paralel (contoh: AI, rendering, video editing).',
      'Meringankan beban kerja CPU pada tugas yang berat secara visual.',
    ]),
    ContentHelpers.subTitle(context, "C. Jenis GPU"),
    ContentHelpers.bulletList(context, [
      'Integrated GPU (iGPU): Menyatu dengan CPU, meminjam RAM sistem, cocok untuk penggunaan ringan.',
      'Dedicated / Discrete GPU: Kartu terpisah di slot PCIe, memiliki VRAM sendiri, untuk gaming dan pekerjaan berat.',
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'GPU sangat penting untuk pekerjaan yang berhubungan dengan grafis dan komputasi berat. '
            'Semakin kompleks visual atau pekerjaan yang dilakukan, semakin dibutuhkan GPU dengan performa tinggi.',
      ),
    ]),
  ];

  // 5. STORAGE
  static List<Widget> storageContent(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/storage.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Storage (Media Penyimpanan)"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Storage adalah tempat penyimpanan data permanen seperti sistem operasi, aplikasi, dokumen, foto, video, dan game. '
            'Berbeda dengan RAM, data di storage tidak hilang ketika komputer dimatikan.',
      ),
    ]),
    ContentHelpers.subTitle(context, "A. HDD (Hard Disk Drive)"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'HDD adalah media penyimpanan tradisional yang menggunakan piringan berputar. Umumnya dipilih karena kapasitas besar dengan harga relatif murah.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Karakteristik HDD"),
    ContentHelpers.bulletList(context, [
      'Menggunakan piringan magnetik yang berputar.',
      'Kecepatan baca/tulis bergantung pada RPM (putaran per menit).',
      'Lebih lambat dibanding SSD dan lebih berisik.',
    ]),
    ContentHelpers.subTitle(context, "Seri HDD Western Digital (WD)"),
    ContentHelpers.bulletList(context, [
      'WD Green: Hemat daya, dingin, performa rendah. Cocok untuk arsip/backup.',
      'WD Blue: Seimbang antara performa dan harga, cocok untuk penggunaan harian.',
      'WD Black: Performa tinggi, cocok untuk gaming dan editing.',
      'WD Purple: Dioptimalkan untuk perekaman CCTV 24/7.',
      'WD Gold: Untuk server dan data center.',
      'WD Red: Untuk NAS dan penggunaan RAID.',
    ]),
    ContentHelpers.subTitle(context, "B. SSD (Solid State Drive)"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'SSD menggunakan chip flash tanpa komponen bergerak. Lebih cepat, lebih tahan guncangan, dan lebih hemat listrik dibanding HDD.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Karakteristik SSD"),
    ContentHelpers.bulletList(context, [
      'Tidak memiliki piringan atau bagian mekanis.',
      'Waktu boot dan loading aplikasi jauh lebih cepat.',
      'Lebih tahan terhadap guncangan fisik.',
    ]),
    ContentHelpers.subTitle(context, "Jenis SSD"),
    ContentHelpers.bulletList(context, [
      'SATA SSD: Menggunakan koneksi SATA, kecepatan sekitar 500–550 MB/s. Cocok untuk upgrade dari HDD.',
      'NVMe SSD: Menggunakan slot M.2, kecepatan bisa 2000–7000+ MB/s. Cocok untuk gaming berat dan pekerjaan profesional.',
    ]),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Kombinasi yang umum digunakan adalah: SSD untuk sistem operasi dan aplikasi utama, sementara HDD digunakan untuk penyimpanan data berkapasitas besar.',
      ),
    ]),
  ];

  // 6. PSU
  static List<Widget> psuContent(BuildContext context) => [
    // --- HEADER IMAGE ---
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/psu.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Power Supply Unit (PSU)"),
    ContentHelpers.subTitle(context, "Pengertian"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'PSU adalah perangkat yang memasok daya listrik ke seluruh komponen komputer. '
            'PSU berperan sebagai "jantung" yang memompa aliran listrik. '
            'Kualitas PSU sangat mempengaruhi stabilitas dan umur panjang komponen lainnya.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Fungsi Utama"),
    ContentHelpers.bulletList(context, [
      'Mengubah arus listrik bolak-balik (AC) dari PLN menjadi arus searah (DC) yang digunakan komputer.',
      'Mendistribusikan daya listrik yang stabil ke motherboard, CPU, GPU, dan storage.',
      'Melindungi komponen dari lonjakan tegangan listrik (surge) dan korsleting.',
    ]),
    ContentHelpers.subTitle(context, "Jenis–Jenis PSU"),
    ContentHelpers.bulletList(context, [
      'Non-Modular — Semua kabel terpasang permanen. Harga murah tapi kabel lebih berantakan.',
      'Semi-Modular — Beberapa kabel bisa dilepas, lebih rapi dan fleksibel.',
      'Full Modular — Semua kabel bisa dilepas, mudah diatur, airflow casing lebih baik.',
    ]),
    ContentHelpers.subTitle(context, "Sertifikasi Efisiensi (80 PLUS)"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        '80 PLUS adalah sertifikasi efisiensi PSU. Semakin tinggi levelnya, semakin efisien dan hemat listrik PSU tersebut.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      '80 PLUS White — Efisiensi sekitar 80% (kantor / sekolah).',
      '80 PLUS Bronze — Efisiensi 82–85% (pilihan ideal untuk gaming menengah).',
      '80 PLUS Silver — Efisiensi 85–88% (lebih jarang ditemui).',
      '80 PLUS Gold — Efisiensi 87–90% (sangat direkomendasikan untuk gaming & workstation).',
      '80 PLUS Platinum — Efisiensi 90–92%.',
      '80 PLUS Titanium — Efisiensi 94%+ (untuk server / high-end system).',
    ]),
    ContentHelpers.subTitle(context, "Cara Kerja"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'PSU mengambil listrik tegangan tinggi dari stop kontak (AC), lalu mengonversinya menjadi '
            'tegangan rendah dan stabil seperti 12V, 5V, dan 3.3V yang aman untuk komponen elektronik sensitif.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Contoh Produk di Dunia Nyata"),
    ContentHelpers.bulletList(context, [
      'Corsair RM750x (80+ Gold)',
      'Cooler Master MWE 550 Bronze',
      'Seasonic Focus GX-650',
    ]),
    ContentHelpers.subTitle(context, "Tips Memilih PSU"),
    ContentHelpers.bulletList(context, [
      'Hindari membeli PSU murahan tanpa merek jelas — berisiko merusak komponen lain.',
      'Pastikan daya (Watt) cukup untuk spesifikasi PC (contoh: 550W untuk PC menengah).',
      'Pilih minimal sertifikasi 80 PLUS Bronze untuk keamanan dan efisiensi.',
      'Periksa konektor PSU sesuai kebutuhan GPU dan motherboard.',
      'Gunakan PSU full modular jika ingin manajemen kabel yang rapi.',
    ]),
  ];
}

// --- MODULE 2: INPUT & OUTPUT (CLEAN VERSION) ---
class Module2Content {
  static List<Widget> perangkatInput(BuildContext context) => [

    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 2/Input.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Perangkat Input"),
    ContentHelpers.subTitle(context, "Pengertian"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Perangkat input adalah perangkat keras yang digunakan untuk memasukkan data dan instruksi ke dalam komputer. '
            'Data dapat berupa teks, gambar, suara, video, atau gerakan mekanis. '
            'Tanpa perangkat input, komputer tidak memiliki data untuk diproses.',
      ),
    ]),
    ContentHelpers.subTitle(context, "Contoh Perangkat Input"),
    ContentHelpers.bulletList(context, [
      "Keyboard — Memasukkan data teks dan perintah shortcut.",
      "Mouse — Menggerakkan kursor dan navigasi GUI.",
      "Scanner — Memindai dokumen fisik menjadi file digital.",
      "Webcam — Menangkap gambar/video secara real-time.",
      "Microphone — Menangkap suara dan mengubahnya menjadi sinyal digital.",
      "Touchscreen — Layar sentuh yang memungkinkan interaksi langsung.",
    ]),
    ContentHelpers.subTitle(context, "Cara Kerja Perangkat Input"),
    ContentHelpers.bulletList(context, [
      "Transduksi: Perangkat menangkap aksi fisik (tekanan tombol, gerakan, suara).",
      "Pengodean: Aksi fisik diubah menjadi data digital berupa kode biner (0 dan 1).",
      "Pengiriman: Data digital dikirim melalui bus ke CPU untuk diproses.",
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Perangkat input merupakan gerbang pertama masuknya informasi. '
            'Kondisinya sangat menentukan kelancaran interaksi antara pengguna dan komputer.',
      ),
    ]),
  ];

  static List<Widget> perangkatOutput(BuildContext context) => [

    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 2/Output.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Perangkat Output"),
    ContentHelpers.subTitle(context, "Pengertian"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Perangkat output adalah perangkat keras yang menyajikan hasil pengolahan data dari CPU dalam bentuk visual, audio, atau cetakan fisik (hard copy).',
      ),
    ]),
    ContentHelpers.subTitle(context, "Contoh Perangkat Output"),
    ContentHelpers.bulletList(context, [
      "Monitor — Menampilkan tampilan visual seperti aplikasi, gambar, dan video.",
      "Speaker — Mengubah sinyal listrik menjadi suara.",
      "Printer — Mencetak dokumen atau gambar ke kertas (hard copy).",
      "Projector — Memproyeksikan gambar/video ke layar besar untuk presentasi.",
      "Plotter — Printer khusus untuk gambar vektor berukuran besar (arsitektur, peta teknik).",
      "Headphone — Output audio personal untuk mendengarkan suara tanpa mengganggu orang lain.",
    ]),
    ContentHelpers.subTitle(context, "Cara Kerja Perangkat Output"),
    ContentHelpers.bulletList(context, [
      "Penerimaan Data: CPU mengirimkan data ke perangkat output.",
      "Konversi: Perangkat mengubah data biner menjadi sinyal analog atau mekanis.",
      "Penyajian: Monitor menampilkan piksel, speaker menghasilkan suara, printer mencetak tinta.",
    ]),
    ContentHelpers.subTitle(context, "Kesimpulan"),
    ContentHelpers.paragraph(context, const [
      TextSpan(
        text:
        'Perangkat output berperan menerjemahkan data digital menjadi informasi yang dapat dilihat, didengar, atau digunakan oleh pengguna. '
            'Tanpa perangkat output, hasil pemrosesan komputer tidak dapat dirasakan oleh manusia.',
      ),
    ]),
  ];
}

// --- MODULE 3: STORAGE & MEMORY (UPDATED) ---
class Module3Content {
  // 1. PENGERTIAN STORAGE
  static List<Widget> pengertianStorage(BuildContext context) => [

    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 3/Pengertian Storage.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Pengertian Storage"),
    ContentHelpers.subTitle(context, "Apa itu Storage?"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Storage atau media penyimpanan adalah komponen perangkat keras dalam sistem komputer '
            'yang berfungsi untuk menyimpan data, file, program, dan sistem operasi. '
            'Berbeda dengan prosesor yang bertugas mengolah data, storage bertugas “mengingat” data tersebut.',
      ),
    ]),

    ContentHelpers.subTitle(context, "Fungsi Utama"),
    ContentHelpers.bulletList(context, [
      "Penyimpanan Permanen: Menyimpan data agar tidak hilang meskipun komputer dimatikan atau kehilangan daya listrik.",
      "Tempat Sistem Operasi: Menjadi rumah bagi Windows, Linux, atau macOS agar komputer bisa menyala (booting).",
      "Arsip Data Pengguna: Menyimpan berbagai file pribadi seperti dokumen tugas, foto kenangan, video, dan instalasi game.",
    ]),

    ContentHelpers.subTitle(context, "Contoh Data yang Disimpan"),
    ContentHelpers.bulletList(context, [
      "Dokumen digital seperti laporan magang (.docx) atau presentasi (.pptx).",
      "File multimedia seperti foto resolusi tinggi (.jpg) dan video editing (.mp4).",
      "File sistem dan aplikasi yang diperlukan agar program seperti Office atau Photoshop bisa berjalan.",
    ]),
  ];

  // 2. JENIS STORAGE (PRIMARY VS SECONDARY)
  static List<Widget> jenisStorage(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 3/Jenis Storage.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Jenis Storage (Primary vs Secondary)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Dalam arsitektur komputer, memori dibagi menjadi dua tingkatan berdasarkan kecepatan dan sifat penyimpanannya:',
      ),
    ]),

    ContentHelpers.subTitle(context, "A. Primary Storage (Memori Utama)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Sering disebut sebagai Main Memory. Ini adalah memori yang berinteraksi langsung dengan prosesor (CPU).',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Contoh perangkat: RAM (Random Access Memory) dan ROM (Read Only Memory).",
      "Sifat – Volatile: Data hanya bertahan selama ada aliran listrik. Saat komputer dimatikan atau di-restart, data di RAM akan hilang.",
      "Fungsi: Menyediakan ruang kerja sementara bagi prosesor. Semakin besar RAM, semakin banyak aplikasi yang bisa dibuka bersamaan tanpa membuat komputer lambat (multitasking).",
      "Analogi: RAM seperti meja kerja. Buku yang sedang dipakai diletakkan di atas meja agar mudah dijangkau, dan akan dibereskan ketika selesai.",
    ]),

    ContentHelpers.subTitle(context, "B. Secondary Storage (Penyimpanan Sekunder)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Ini adalah tempat penyimpanan jangka panjang yang sering kita sebut sebagai “storage”.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Contoh perangkat: Hard Disk (HDD), SSD, Flashdisk, Kartu Memori.",
      "Sifat – Non-Volatile: Data bersifat permanen dan tidak hilang meskipun tidak ada aliran listrik.",
      "Fungsi: Gudang penyimpanan utama untuk semua file dan aplikasi yang terinstal.",
      "Analogi: Storage seperti lemari arsip. Mencari berkas di lemari butuh waktu lebih lama daripada di meja, tetapi kapasitasnya jauh lebih besar dan aman untuk jangka panjang.",
    ]),
  ];

  // 3. JENIS MEDIA PENYIMPANAN
  static List<Widget> jenisMediaPenyimpanan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 3/Jenis Media Penyimpanan.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Jenis Media Penyimpanan"),

    // HDD
    ContentHelpers.subTitle(context, "Hard Disk Drive (HDD)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'HDD adalah teknologi penyimpanan konvensional yang masih populer karena harganya terjangkau.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Cara kerja: Menggunakan piringan magnetik (platter) yang berputar dengan kecepatan tinggi (5400 / 7200 RPM) dan jarum mekanik (head) yang membaca/menulis data.",
      "Kelebihan: Kapasitas besar dengan harga per GB murah. Cocok untuk arsip data seperti film, foto, atau backup CCTV.",
      "Kekurangan: Kecepatan baca/tulis lebih lambat dari SSD, menimbulkan suara dan getaran, serta rentan rusak jika terjatuh saat menyala.",
    ]),

    // SSD
    ContentHelpers.subTitle(context, "Solid State Drive (SSD)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'SSD adalah teknologi penyimpanan modern yang menjadi standar baru pada laptop dan PC.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Cara kerja: Tidak memiliki komponen bergerak. Menggunakan rangkaian chip memori (NAND Flash) yang menyimpan data dengan arus listrik.",
      "Jenis SSD – SATA: Bentuk 2.5 inci, menggunakan kabel SATA, kecepatan sekitar 500–550 MB/s.",
      "Jenis SSD – NVMe (M.2): Bentuk kecil seperti stik RAM dan dipasang langsung ke motherboard, kecepatan bisa 3.000–7.000 MB/s.",
      "Kelebihan: Booting Windows sangat cepat, aplikasi terbuka dalam hitungan detik, tahan guncangan, dan hening.",
      "Kekurangan: Harga per GB lebih mahal dibanding HDD.",
    ]),

    // Flashdisk
    ContentHelpers.subTitle(context, "USB Flash Drive"),
    ContentHelpers.bulletList(context, [
      "Fungsi: Media penyimpanan portabel yang praktis untuk memindahkan data antar komputer.",
      "Koneksi: Menggunakan antarmuka USB (Type-A atau Type-C).",
    ]),

    // Optical
    ContentHelpers.subTitle(context, "Optical Disc"),
    ContentHelpers.bulletList(context, [
      "Contoh: CD, DVD, Blu-Ray.",
      "Cara kerja: Menggunakan sinar laser untuk menulis dan membaca titik-titik kecil pada permukaan piringan.",
      "Status: Mulai ditinggalkan karena kapasitas kecil (DVD ≈ 4,7 GB) dan media fisik besar, tetapi masih dipakai untuk distribusi game konsol atau film original.",
    ]),
  ];

  // 4. SATUAN KAPASITAS PENYIMPANAN
  static List<Widget> satuanKapasitas(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 3/Satuan Kapasitas.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),

    ContentHelpers.header(context, "Satuan Kapasitas Penyimpanan"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Komputer memproses data dalam bentuk digital menggunakan sistem bilangan biner. Berikut urutan satuan kapasitas dari yang terkecil:',
      ),
    ]),

    ContentHelpers.bulletList(context, [
      "Bit (b): Satuan terkecil, bernilai 0 atau 1 (sinyal mati/hidup).",
      "Byte (B): 8 bit; umumnya mewakili satu karakter huruf atau angka.",
    ]),

    ContentHelpers.subTitle(context, "Konversi dan Contoh Penggunaan"),
    ContentHelpers.bulletList(context, [
      "Kilobyte (KB): 1 KB = 1.024 Byte. Contoh: file teks sederhana atau ikon kecil.",
      "Megabyte (MB): 1 MB = 1.024 KB. Contoh: 1 foto dari kamera HP (3–5 MB) atau 1 lagu MP3.",
      "Gigabyte (GB): 1 GB = 1.024 MB. Contoh: 1–2 film HD, file instalasi game mobile, atau kuota internet bulanan.",
      "Terabyte (TB): 1 TB = 1.024 GB. Contoh: kapasitas harddisk eksternal modern, mampu menyimpan ratusan game PC atau ratusan jam video HD.",
    ]),
  ];

  // 5. TIPS MERAWAT STORAGE
  static List<Widget> tipsMerawat(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 3/Tips Merawat Storage.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Tips Merawat Storage"),

    ContentHelpers.subTitle(context, "Tips untuk HDD (Hard Disk)"),
    ContentHelpers.bulletList(context, [
      "Hindari guncangan: Jangan memindahkan atau menghentak laptop/PC saat masih menyala karena jarum pembaca bisa menggores piringan (bad sector).",
      "Lakukan defrag: Jalankan fitur Defragment secara berkala untuk merapikan susunan file sehingga head tidak bekerja terlalu keras.",
    ]),

    ContentHelpers.subTitle(context, "Tips untuk SSD"),
    ContentHelpers.bulletList(context, [
      "Jangan defrag: SSD tidak memerlukan defragmentasi, justru mempercepat ausnya sel memori (write cycle).",
      "Jaga sirkulasi listrik: Gunakan power supply yang baik atau stabilizer karena SSD sensitif terhadap lonjakan listrik.",
    ]),

    ContentHelpers.subTitle(context, "Tips untuk Flashdisk & Harddisk Eksternal"),
    ContentHelpers.bulletList(context, [
      "Selalu gunakan perintah “Safely Remove” atau “Eject” sebelum mencabut perangkat agar data tidak korup.",
      "Scan virus secara berkala karena media ini sering berpindah komputer dan sangat rentan terinfeksi malware.",
    ]),
  ];
}

// --- MODULE 4: JARINGAN KOMPUTER (UPDATED) ---
class Module4Content {
  // 1. PENGERTIAN JARINGAN KOMPUTER
  static List<Widget> pengertianJaringan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Pengertian Jaringan.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Pengertian Jaringan Komputer"),

    ContentHelpers.subTitle(context, "Apa Itu Jaringan Komputer?"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Secara sederhana, jaringan komputer adalah kumpulan dari dua atau lebih komputer '
            'yang saling terhubung satu sama lain untuk berbagi data dan sumber daya. '
            'Hubungan ini bisa menggunakan kabel maupun gelombang radio (nirkabel) agar komputer-komputer tersebut bisa “mengobrol” alias bertukar data.',
      ),
    ]),

    ContentHelpers.subTitle(context, "Istilah Penting dalam Jaringan"),
    ContentHelpers.bulletList(context, [
      "Node: Sebutan untuk setiap perangkat fisik yang terhubung ke jaringan (komputer, printer, CCTV, smartphone, dan lain-lain).",
      "Host: Komputer yang terhubung ke jaringan dan memiliki alamat unik (IP Address) sebagai identitas.",
      "Media Transmisi: “Jalan raya” tempat data bepergian, bisa berupa kabel tembaga, serat optik, atau udara (gelombang radio).",
    ]),

    ContentHelpers.subTitle(context, "Contoh Jaringan di Sekitar Kita"),
    ContentHelpers.bulletList(context, [
      "Lab Komputer Sekolah: Semua komputer siswa terhubung ke komputer guru dan bisa mencetak ke satu printer bersama.",
      "Warnet (Warung Internet): Banyak komputer yang disewakan dan semuanya berbagi satu sumber internet.",
      "Wi-Fi Rumah: HP, laptop, dan Smart TV terhubung ke satu router tanpa kabel.",
    ]),
  ];

  // 2. MANFAAT JARINGAN KOMPUTER
  static List<Widget> manfaatJaringan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Manfaat Jaringan.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Manfaat Jaringan Komputer"),

    ContentHelpers.subTitle(context, "a. Resource Sharing (Berbagi Sumber Daya)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Jaringan memungkinkan banyak pengguna memakai perangkat keras atau file secara bersama-sama tanpa harus memindahkan media fisik seperti flashdisk.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Satu kantor cukup membeli satu printer mahal, dan semua karyawan bisa mencetak dari komputer masing-masing.",
      "File dapat dibagikan melalui folder bersama (shared folder) tanpa harus copy ke flashdisk.",
    ]),

    ContentHelpers.subTitle(context, "b. Komunikasi yang Lebih Efektif"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Jaringan mendukung komunikasi teks, suara, dan video secara real-time sehingga informasi bisa diterima lebih cepat dan praktis.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Mengirim email tugas ke guru.",
      "Chatting dengan teman sekelas lewat aplikasi pesan instan.",
      "Video call menggunakan Zoom atau Google Meet saat pembelajaran jarak jauh.",
    ]),

    ContentHelpers.subTitle(context, "c. Keamanan dan Sentralisasi Data"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Dengan jaringan, data penting dapat disimpan terpusat di sebuah server, bukan tersebar di banyak laptop atau komputer pribadi.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Nilai rapor siswa disimpan di server sekolah, bukan di laptop masing-masing guru.",
      "Jika satu komputer rusak, data tetap aman karena tersimpan di server dan bisa diakses dari perangkat lain.",
    ]),
  ];

  // 3. JENIS JARINGAN (BERDASARKAN JANGKAUAN)
  static List<Widget> jenisJaringan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Jenis Jaringan.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Jenis Jaringan (Berdasarkan Jangkauan)"),

    ContentHelpers.subTitle(context, "A. LAN (Local Area Network)"),
    ContentHelpers.bulletList(context, [
      "Jaringan dengan cakupan area kecil dan terbatas (satu ruangan atau satu gedung).",
      "Kecepatan transfer data tinggi dan biaya pemasangan relatif murah.",
      "Contoh: Jaringan lab komputer, jaringan di dalam rumah, atau satu lantai gedung kantor.",
    ]),

    ContentHelpers.subTitle(context, "B. MAN (Metropolitan Area Network)"),
    ContentHelpers.bulletList(context, [
      "Jaringan yang lebih luas dari LAN dan mencakup area satu kota.",
      "Biasanya merupakan gabungan beberapa LAN yang saling terhubung.",
      "Contoh: Jaringan antar kampus satu universitas di kota yang sama, atau jaringan antar kantor cabang bank dalam satu kota.",
    ]),

    ContentHelpers.subTitle(context, "C. WAN (Wide Area Network)"),
    ContentHelpers.bulletList(context, [
      "Jaringan dengan jangkauan paling luas, dapat mencakup antar negara bahkan antar benua.",
      "Menggunakan kabel serat optik bawah laut atau satelit untuk menghubungkan benua.",
      "Contoh: Internet adalah WAN terbesar di dunia.",
    ]),
  ];

  // 4. KOMPONEN UTAMA JARINGAN
  static List<Widget> komponenJaringan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Komponen Utama.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Komponen Utama Jaringan"),
    ContentHelpers.subTitle(context, "A. Server"),
    ContentHelpers.bulletList(context, [
      "Komputer dengan spesifikasi tinggi yang bertugas melayani komputer lain.",
      "Menyediakan sumber daya seperti file, database, atau website dan mengatur lalu lintas data.",
      "Contoh: Server perpustakaan sekolah yang menyimpan data peminjaman buku.",
    ]),

    ContentHelpers.subTitle(context, "B. Client (Klien)"),
    ContentHelpers.bulletList(context, [
      "Komputer pengguna biasa yang meminta layanan ke server.",
      "Digunakan untuk mengakses file, aplikasi, ataupun website yang disimpan di server.",
      "Contoh: Laptop siswa yang membuka website perpustakaan sekolah.",
    ]),

    ContentHelpers.subTitle(context, "C. NIC (Network Interface Card)"),
    ContentHelpers.bulletList(context, [
      "Sering disebut kartu jaringan atau LAN Card.",
      "Perangkat yang membuat komputer/laptop bisa terhubung ke kabel jaringan atau Wi-Fi.",
      "Tanpa NIC, komputer tidak dapat berkomunikasi dengan jaringan.",
    ]),

    ContentHelpers.subTitle(context, "D. Switch"),
    ContentHelpers.bulletList(context, [
      "Perangkat pembagi sinyal dalam jaringan lokal (LAN).",
      "Menghubungkan banyak komputer dan mengirim data hanya ke perangkat tujuan, bukan ke semua perangkat.",
      "Contoh: Kotak dengan banyak port LAN di lab komputer.",
    ]),

    ContentHelpers.subTitle(context, "E. Router"),
    ContentHelpers.bulletList(context, [
      "Perangkat yang mengatur rute data antar jaringan yang berbeda.",
      "Menghubungkan LAN rumah atau kantor dengan jaringan internet global.",
      "Contoh: Perangkat Wi-Fi dari penyedia internet (misalnya Indihome/Biznet) yang merupakan gabungan modem dan router.",
    ]),
  ];

  // 5. JENIS KONEKSI JARINGAN
  static List<Widget> jenisKoneksi(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Jenis Koneksi.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Jenis Koneksi Jaringan"),
    ContentHelpers.subTitle(context, "A. Wired Network (Jaringan Berkabel)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Menggunakan kabel fisik sebagai media penghantar data antar perangkat.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Media: Kabel UTP (kabel LAN) dan kabel Fiber Optic (serat kaca berkecepatan sangat tinggi).",
      "Kelebihan: Koneksi stabil, tidak mudah terganggu cuaca atau tembok, dan kecepatan transfer tinggi.",
      "Kekurangan: Instalasi rumit karena banyak kabel dan perangkat tidak fleksibel untuk dipindah-pindah.",
    ]),

    ContentHelpers.subTitle(context, "B. Wireless Network (Jaringan Nirkabel)"),
    ContentHelpers.paragraph(context, [
      const TextSpan(
        text:
        'Menggunakan gelombang elektromagnetik (radio) untuk mengirim data melalui udara.',
      ),
    ]),
    ContentHelpers.bulletList(context, [
      "Media: Wi-Fi, Bluetooth, serta jaringan seluler seperti 4G dan 5G.",
      "Kelebihan: Sangat praktis, perangkat bisa bergerak bebas (mobile), dan instalasi rapi tanpa kabel.",
      "Kekurangan: Sinyal bisa terganggu tembok tebal atau jarak yang jauh, kecepatan umumnya di bawah kabel, dan keamanan lebih rentan jika tidak diproteksi dengan baik.",
    ]),
  ];

  // 6. ISTILAH DASAR JARINGAN
  static List<Widget> istilahDasar(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Istilah Dasar.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Istilah Dasar Jaringan"),
    ContentHelpers.subTitle(context, "A. IP Address (Internet Protocol Address)"),
    ContentHelpers.bulletList(context, [
      "Alamat identitas setiap perangkat di jaringan, mirip nomor rumah pada alamat surat.",
      "Contoh: 192.168.1.10 pada jaringan lokal (IPv4).",
    ]),

    ContentHelpers.subTitle(context, "B. DNS (Domain Name System)"),
    ContentHelpers.bulletList(context, [
      "Berperan sebagai “buku telepon internet” yang menerjemahkan nama domain menjadi IP Address.",
      "Contoh: Saat mengetik google.com, DNS mengubahnya menjadi alamat IP server Google.",
    ]),

    ContentHelpers.subTitle(context, "C. Bandwidth"),
    ContentHelpers.bulletList(context, [
      "Kapasitas maksimum “jalan raya data” yang menunjukkan seberapa banyak data bisa lewat dalam satu waktu.",
      "Semakin besar bandwidth, semakin cepat proses download atau upload file besar.",
    ]),

    ContentHelpers.subTitle(context, "D. Latency (Ping)"),
    ContentHelpers.bulletList(context, [
      "Waktu jeda atau keterlambatan data dari pengirim ke penerima.",
      "Ping kecil (bagus): Respons cepat, cocok untuk gaming online atau video call.",
      "Ping besar (buruk/lag): Suara atau gerakan pada video call terasa terlambat.",
    ]),
  ];

  // 7. KEAMANAN JARINGAN
  static List<Widget> keamananJaringan(BuildContext context) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/Module 4/Keamanan Jaringan.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    ),
    ContentHelpers.header(context, "Keamanan Jaringan"),
    ContentHelpers.subTitle(context, "Ancaman Umum"),
    ContentHelpers.bulletList(context, [
      "Malware/Virus: Program jahat yang dapat merusak data atau sistem komputer.",
      "Phishing: Penipuan melalui website atau link palsu untuk mencuri data login atau informasi penting.",
      "Hacker: Orang yang mencoba menerobos masuk ke sistem jaringan tanpa izin.",
    ]),

    ContentHelpers.subTitle(context, "Tips Keamanan Sederhana"),
    ContentHelpers.bulletList(context, [
      "Gunakan password kuat dengan kombinasi huruf besar, huruf kecil, angka, dan simbol. Hindari tanggal lahir.",
      "Jangan klik link sembarangan, terutama jika datang dari email atau pesan yang mencurigakan.",
      "Berhati-hatilah menggunakan Wi-Fi gratis; hindari membuka layanan sensitif seperti M-Banking di jaringan publik tanpa pengamanan.",
      "Selalu update sistem operasi dan aplikasi untuk menutup celah keamanan yang baru ditemukan.",
    ]),
  ];
}