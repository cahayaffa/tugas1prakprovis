A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Ini adalah program library dimana user dapat menyimpan buku, melihat buku yang telah disimpan, dan jika ada peminjam maka user bisa meminjamkan buku. Dan user dapat mengembalikan buku. 

Terdapat 2 class.
1. library yang memiliki 5 method yaitu addBook untuk menambah buku, displayBook untuk menambah buku, borrowBook untuk meminjam buku, returnBook untuk mengembalikan buku dan checkIfIdExist untuk mengecek id buku ada dalam Id yang diberikan atau tidak. 
2. Book terdapat 4 method yaitu display untuk mendisplay buku apakah itu. Borrow untuk meminjam buku dan return untuk mengembalikan buku. checkAvailability untuk mengecek buku itu ada atau tidak. 

Asinchronous ada pada method checkIfIdExist kemudian method borrowBook dan addBook. dimana checkIfIdExist kita gunakan asinchronous karena mengecek buku pada kasus real-nya membutuhkan waktu. borrowBook dibuat asinchronous karena kita ingin menunggu method book.borrow untuk selesai terlebih dahulu sebelum programnya selesai. addBook dibuat asinchronous karena kita harus menunggu checkIfIdExist dahulu sebelum melakukan tindakan lebih lanjut yaitu menambah buku, kalau tidak Id yang sama atau memperingati user jika ada Id yang sama dan menggagalkan upaya penambahan buku

pada class book checkAvailibility dibuat asinchronous karena pada kasus realnya mengecek buku membutuhkan waktu dan method borrow dibuat asinchronous karena kita harus menunggu checkAvailability dahulu sebelum menentukan apakah buku itu bisa dipinjam  apa tidak. 

<img width="707" alt="Screenshot 2024-03-09 at 23 26 30" src="https://github.com/cahayaffa/tugas1prakprovis/assets/136771895/27c14453-53a7-4f82-932f-c51d34b1d74f">
