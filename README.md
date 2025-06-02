# TSP Path Finder

**Oleh Ranashahira Reztaputri - 13523007**

---

## Deskripsi

Program ini menyelesaikan masalah Traveling Salesman Problem (TSP) menggunakan pemrograman dinamis dengan rekursi yang dioptimasi dengan memoisasi.  
Input berupa matriks ketetanggaan, outputnya adalah jalur terpendek (tur) yang melewati semua vertex tepat satu kali dan kembali ke vertex awal.

---

## Spesifikasi Program

- **Bahasa:** Ruby  
- **Input:** File teks dengan format:
  - Baris pertama: integer `N` (jumlah vertex)  
  - Baris berikutnya: matriks bobot `N x N`, setiap elemen angka integer atau string `"infinity"` (menandakan tidak ada jalur)  
- **Output:**  
  - Jalur terpendek dari vertex 1 melewati semua vertex dan kembali ke 1  
  - Total bobot minimum  

---

## Cara Kerja Program

1. Program menampilkan judul dan meminta input nama file.  
2. Membaca file dari folder `../test/` dengan nama sesuai input.  
3. Memvalidasi format dan ukuran matriks sesuai `N`.    
4. Menggunakan fungsi rekursif dengan memoization untuk mencari jalur terpendek:  
   - Fungsi mencari vertex berikutnya dengan biaya terendah dari vertex saat ini.  
5. Menyimpan jalur terbaik dalam struktur data `next_path`.  
6. Menampilkan jalur terpendek dan total bobot dengan warna dan formatting.  
7. Menampilkan pesan terima kasih.

---

## Cara Menggunakan

1. Install Ruby
2. Clone repository ini
3. Masuk ke directory src
  ```bash
  cd src
  ```
4. Jalankan file main.rb
  ```bash
  ruby main.rb
  ```

---

## Screenshot Input dan Output Program
Berikut merupakan contoh input dan output pada test case 1 (test1.txt)
   ### Input
   ![image](https://github.com/user-attachments/assets/c3420056-d057-430a-8f68-29bc70e29448)

  ### Output
  ![image](https://github.com/user-attachments/assets/37b7260d-8e78-44a6-ac5a-2b1a03a863fe)

