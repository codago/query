
1. SELECT mhs.nama, jur.nama_jurusan FROM table_mahasiswa AS mhs, table_jurusan AS jur WHERE mhs.id_jurusan=jur.id_jurusan;

2. SELECT nama FROM table_mahasiswa where umur<20;

3. SELECT DISTINCT mhs.nama FROM table_mahasiswa AS mhs JOIN table_nilai AS nilai on mhs.nim = nilai.nim WHERE nilai>=80

4. SELECT mhs.nama, SUM(matkul.sks) FROM table_mahasiswa AS mhs, table_nilai AS nilai, table_matakuliah AS matkul WHERE mhs.nim = nilai.nim AND nilai.id_matakuliah = matkul.id_matakuliah GROUP BY mhs.nama HAVING SUM(matkul.sks)>10

5. SELECT mhs.nama FROM table_mahasiswa AS mhs JOIN table_nilai AS nilai on mhs.nim = nilai.nim WHERE nilai.id_matakuliah=2

6. SELECT dosen.nama_dosen AS DOSEN, COUNT(nilai.id_matakuliah) AS JUMLAH_MAHASISWA FROM table_nilai AS nilai, table_dosen AS dosen, table_matakuliah AS matkul WHERE dosen.id_dosen = matkul.id_dosen AND nilai.id_matakuliah = matkul.id_matakuliah GROUP BY dosen.nama_dosen

7. SELECT nama FROM table_mahasiswa ORDER BY umur ASC;

8. SELECT matkul.nama_matakuliah AS MATAKULIAH, mhs.nim AS NIM, nilai.nilai AS NILAI, mhs.nama AS MAHASISWA, dosen.nama_dosen AS DOSEN, dosen.id_dosen AS NID, jur.nama_jurusan AS JURUSAN FROM table_matakuliah AS matkul, table_nilai AS nilai, table_mahasiswa AS mhs, table_dosen AS dosen, table_jurusan AS jur WHERE nilai.id_matakuliah = matkul.id_matakuliah AND mhs.id_jurusan = jur.id_jurusan AND nilai.nilai < 70 AND nilai.nim = mhs.nim AND dosen.id_dosen=matkul.id_dosen
