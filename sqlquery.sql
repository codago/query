--1. Tampilkan seluruh data mahasiswa beserta nama jurusannya
SELECT mahasiswa.mahasiswaid, mahasiswa.nama_mahasiswa, mahasiswa.NIM, mahasiswa.UMUR, jurusan.nama_jurusan, mahasiswa.alamat FROM mahasiswa
INNER JOIN jurusan on mahasiswa.JURUSANID=jurusan.JURUSANID;

--2. Tampilkan mahasiswa yang memiliki umur dibawah 20 tahun
SELECT * FROM mahasiswa WHERE(UMUR<20);

--3. Tampilkan mahasiswa yang memiliki nilai 'B' keatas
SELECT mahasiswa.nama_mahasiswa, jurusan.nama_jurusan, matakuliah.nama_matkul, matakuliah.sks, dosen.nama_dosen, kontrakkuliah.nilai, kontrakkuliah.grade FROM kontrakkuliah
INNER JOIN mahasiswa ON kontrakkuliah.MAHASISWAID=mahasiswa.MAHASISWAID
INNER JOIN jurusan on mahasiswa.jurusanid=jurusan.jurusanid
INNER JOIN dosen ON kontrakkuliah.DOSENID=dosen.DOSENID
INNER JOIN matakuliah ON kontrakkuliah.MATAKULIAHID=matakuliah.MATAKULIAHID WHERE(nilai > 79)

--4. Tampilkan mahasiswa yang memiliki jumlah SKS lebih dari 10
SELECT  mahasiswa.NAMA_MAHASISWA, sum(matakuliah.sks) AS summatakuliah FROM kontrakkuliah
INNER JOIN mahasiswa ON kontrakkuliah.MAHASISWAID=mahasiswa.MAHASISWAID
INNER JOIN jurusan on mahasiswa.jurusanid=jurusan.jurusanid
INNER JOIN dosen ON kontrakkuliah.DOSENID=dosen.DOSENID
INNER JOIN matakuliah ON kontrakkuliah.MATAKULIAHID=matakuliah.MATAKULIAHID
GROUP BY mahasiswa.nama_mahasiswa HAVING summatakuliah > 10


--5. Tampilkan mahasiswa yang mengkontrak mata kuliah data Mining
SELECT mahasiswa.nama_mahasiswa, matakuliah.nama_matkul FROM kontrakkuliah
INNER JOIN mahasiswa ON kontrakkuliah.MAHASISWAID=mahasiswa.MAHASISWAID
INNER JOIN matakuliah ON kontrakkuliah.MATAKULIAHID=matakuliah.MATAKULIAHID WHERE(matakuliah.NAMA_MATKUL = "Data Mining")

--6. Tampilkan jumlah mahasiswa untuk setiap dosennya
SELECT  dosen.nama_dosen, matakuliah.nama_matkul, count(mahasiswa.nama_mahasiswa)as jumlahmahasiswa FROM kontrakkuliah
INNER JOIN mahasiswa ON kontrakkuliah.MAHASISWAID=mahasiswa.MAHASISWAID
INNER JOIN jurusan on mahasiswa.jurusanid=jurusan.jurusanid
INNER JOIN dosen ON kontrakkuliah.DOSENID=dosen.DOSENID
INNER JOIN matakuliah ON kontrakkuliah.MATAKULIAHID=matakuliah.MATAKULIAHID
GROUP BY dosen.nama_dosen, matakuliah.nama_matkul

--7. Tampilkan kontrak matakuliah yang harus diulang (nilai D dan E), serta tampilkan data mahasiwa jurusan
--dan dosen secara lengkap. Gunakan mode JOIN dan WHERE clause (solusi terdiri dari 2 syntax SQL)
SELECT mahasiswa.nama_mahasiswa, matakuliah.NAMA_MATKUL, kontrakkuliah.nilai, kontrakkuliah.grade FROM kontrakkuliah
INNER JOIN mahasiswa ON kontrakkuliah.MAHASISWAID=mahasiswa.MAHASISWAID
INNER JOIN matakuliah ON kontrakkuliah.MATAKULIAHID=matakuliah.MATAKULIAHID
WHERE(kontrakkuliah.grade = "D" OR kontrakkuliah.grade  ="E");
