# Tugas 7 PBP

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget    : Widget yang tidak dapat diubah<br>
Contoh              : Icon, IconButton, dan text

Stateful widget     : Widget yang sifatnya dinamis atau dapat diubah<br>
Contoh              : Checkbox, Radio, Slider, InkWell, Form, dan TextField

<hr>

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya

Material App : root dari aplikasi<br>
Scaffold : menyediakan struktur dasar dan styling dalam aplikasi<br>
Center : menempatkan widgets di tengah<br>
Column : display children dalam format kolom vertikal<br>
Row : display children dalam format baris horizontal<br>
Text : display string<br>
AppBar : display toolbar dan widgets<br>

<hr>

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() berfungsi untuk memberi tahu Flutter bahwa terdapat Widget yang berubah dan berpengaruh pada interface sehingga Flutter akan melakukan build ulang pada Widget tersebut.

Variabel yang terdampak adalah variabel yang berubah saat pemanggilan fungsi tersebut.

<hr>

## Jelaskan perbedaan antara const dengan final.

Final digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan atau dengan kata lain nilai final akan diketahui pada saat **runtime**, tetapi hanya disetel sekali.

Const digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi atau **compile time**, dengan kata lain variabel tersebut harus diberikan value secara langsung.

<hr>

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat fungsi decrementCounter yang mirip dengan incrementCounter tapi kegunaannya untuk mengurangi counter sebagai berikut:
    ```
    void _decrementCounter() {
        setState(() {
            _counter--;
        });
    }
    ```

2. Menambahkan conditional di bawah untuk kondisi ganjil dan genap:
    ```
    _counter % 2 == 0 ?
    const Text('GENAP', style: TextStyle(fontSize:24, color: Colors.blue)) :
    const Text('GANJIL', style: TextStyle(fontSize:24, color: Colors.red)),
    ```

3. Menambahkan floatingActionButton sebagai berikut:
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