# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget    : Widget yang tidak dapat diubah<br>
Contoh              : Icon, IconButton, dan text

Stateful widget     : Widget yang sifatnya dinamis atau dapat diubah<br>
Contoh              : Checkbox, Radio, Slider, InkWell, Form, dan TextField

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya

Material App : root dari aplikasi<br>
Scaffold : menyediakan struktur dasar dan styling dalam aplikasi<br>
Center : menempatkan widgets di tengah<br>
Column : display children dalam format kolom vertikal<br>
Row : display children dalam format baris horizontal<br>
Text : display string<br>
AppBar : display toolbar dan widgets<br>


## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() berfungsi untuk memberi tahu Flutter bahwa terdapat Widget yang berubah dan berpengaruh pada interface sehingga Flutter akan melakukan build ulang pada Widget tersebut.

Variabel yang terdampak adalah variabel yang berubah saat pemanggilan fungsi tersebut.

## Jelaskan perbedaan antara const dengan final.

Final digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan atau dengan kata lain nilai final akan diketahui pada saat **runtime**, tetapi hanya disetel sekali.

Const digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi atau **compile time**, dengan kata lain variabel tersebut harus diberikan value secara langsung.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Menjalankan perintah ```flutter create counter_7``` pada terminal

2. Membuat fungsi decrementCounter yang mirip dengan incrementCounter tapi kegunaannya untuk mengurangi counter sebagai berikut:
    ```
    void _decrementCounter() {
        setState(() {
            _counter--;
        });
    }
    ```

3. Menambahkan conditional di bawah untuk kondisi ganjil dan genap:
    ```
    _counter % 2 == 0 ?
    const Text('GENAP', style: TextStyle(fontSize:24, color: Colors.blue)) :
    const Text('GANJIL', style: TextStyle(fontSize:24, color: Colors.red)),
    ```

4. Menambahkan floatingActionButton sebagai berikut:
    ```
    floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        if(_counter != 0)FloatingActionButton(
            onPressed: (){
            _decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
            onPressed: (){
            _incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
        ),
        ],
    ),
    ```

# Tugas 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push menambahkan rute ke atas halaman yang sedang dibuka sekarang pada stack dan menampilkan halaman yang baru saja ditambahkan.

Navigator.pushReplacement menggantikan halaman yang sedang dibuka sekarang dengan rute yang ingin ditambahkan.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi<br>
- AppBar : widget yang menampilkan toolbar dan widgets lain<br>
- Center : menempatkan widgets di tengah<br>
- Column : widget yang menampilkan widgets children dalam format kolom vertikal<br>
- Row : widget yang menampilkan widgets children dalam format baris horizontal<br>
- Text : widget untuk menampilkan string<br>
- Icon : widget untuk menampilkan icon<br>
- Form : wadah untuk widgets yang berbasis form<br>
- TextFormField : FormField (widget untuk menampilkan pembaruan dan error terkait input pada form) untuk tipe data Text<br>
- Drawer : widget untuk menampilkan tautan navigasi<br>
- Padding : widget untuk memberikan padding<br>
- Container : widget multifungsi yang bisa digunakan untuk mengatur ukuran serta posisi dari widgets lainnya<br>
- DropdownButton : widget untuk membuat dropdown<br>
- DropdownMenuItem : widget yang merepresentasikan sebuah menu yang dibuat oleh DropDownButton<br>
- ListTile : widget yang mengandung title, leading, dan trailing icons, serta akan memformatnya<bn>

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

- onPressed: akan dipanggil ketika user menekan suatu object
- onChanged: akan dipanggil ketika user melakukan perubahan pada suatu field
- onSaved : akan dipanggil ketika user menyimpan sesuatu

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator pada Flutter menggunakan implementasi stack. Metode Navigator.push akan menambahkan halaman baru pada stack dan menavigasi ke halaman yang baru tersebut, sedangkan Navigator.pop akan mengeluarkan halaman saat ini dari stack sehingga yang ditampilkan adalah halaman sebelumnya.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat ```drawer.dart``` yang berisi DrawerApp untuk menavigasi ke MyHomePage (halaman utama), AddBudgetPage (halaman form), dan DataBudgetPage (halaman data). Pada ketiga halaman di atas, tambahkan kode di bawah untuk menambahkan drawer pada tiap halaman.
    ```
    drawer: const DrawerApp(),
    ```

2. Membuat ```form.dart``` yang berisi form yang menerima input judul, nominal, jenis, serta tanggal.

3. Menambahkan TextButton pada ```form.dart``` agar ketika button tersebut ditekan, input user akan disimpan ke suatu list.

4. Membuat ```data.dart``` untuk menampilkan data dari list pada poin 3 menggunakan ListView.builder.