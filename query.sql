--adding umur column
ALTER TABLE mahasiswa ADD umur INTEGER;

-- Jawaban #1
SELECT mahasiswa.*, jurusan.namajurusan
FROM mahasiswa, jurusan
WHERE mahasiswa.idjurusan = jurusan.idjurusan;

--Jawaban #2
SELECT *
FROM mahasiswa
where umur < 20;

--Jawaban #3
SELECT mahasiswa.*, kontrakmk.nilai
FROM mahasiswa, kontrakmk
WHERE mahasiswa.nim = kontrakmk.nim AND kontrakmk.nilai <= 'B';


--Jawaban #4
SELECT mahasiswa.nim, mahasiswa.nama,SUM(matakuliah.sks) AS total_sks
FROM kontrakmk, mahasiswa, matakuliah
WHERE kontrakmk.nim = mahasiswa.nim AND kontrakmk.idmk = matakuliah.idmk
GROUP BY mahasiswa.nim HAVING total_sks > 10;

-- Jawaban #5
SELECT mahasiswa.nama, matakuliah.namamk
FROM mahasiswa, kontrakmk, matakuliah
WHERE mahasiswa.nim = kontrakmk.nim AND kontrakmk.idmk = matakuliah.idmk AND matakuliah.namamk = 'datamining';

--Jawaban # 6
SELECT namadosen, count(nim) as jumlah_mahasiswa
FROM (SELECT DISTINCT dosen.namadosen, kontrakmk.nim
FROM kontrakmk, dosen
WHERE kontrakmk.iddosen = dosen.iddosen)
GROUP BY namadosen

--Jawaban #7
SELECT mahasiswa.nama, mahasiswa.umur
FROM mahasiswa
ORDER BY  umur asc;

--Jawaban #8
--clause where
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, mahasiswa.umur, jurusan.namajurusan, matakuliah.namamk, matakuliah.sks, dosen.namadosen, kontrakmk.nilai
FROM mahasiswa, kontrakmk, matakuliah, dosen, jurusan
WHERE mahasiswa.idjurusan = jurusan.idjurusan AND mahasiswa.nim = kontrakmk.nim AND kontrakmk.idmk = matakuliah.idmk AND kontrakmk.iddosen = dosen.iddosen AND kontrakmk.nilai > 'C';

--clause JOIN
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, mahasiswa.umur, jurusan.namajurusan, matakuliah.namamk, matakuliah.sks, dosen.namadosen, kontrakmk.nilai
FROM mahasiswa JOIN jurusan ON mahasiswa.idjurusan = jurusan.idjurusan JOIN kontrakmk ON mahasiswa.nim = kontrakmk.nim JOIN matakuliah ON kontrakmk.idmk = matakuliah.idmk JOIN dosen ON kontrakmk.iddosen = dosen.iddosen
WHERE kontrakmk.nilai > 'C';
