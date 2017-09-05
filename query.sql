--1
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.umur, mahasiswa.alamat , jurusan.namajurusan FROM mahasiswa, jurusan WHERE mahasiswa.idjurusan = jurusan.idjurusan;

--2
SELECT mahasiswa.nama, mahasiswa.umur  FROM mahasiswa WHERE mahasiswa.umur < 20  ;

--3
SELECT mahasiswa.nama , matakuliah.nama AS matakuliah ,kontrak.nilai FROM  mahasiswa, matakuliah, kontrak
WHERE kontrak.nim = mahasiswa.nim AND matakuliah.idmatakuliah = kontrak.idmatakuliah AND kontrak.nilai <= 'B';

--4
SELECT mahasiswa.nama ,kontrak.idkontrak , matakuliah.sks FROM mahasiswa, kontrak ,matakuliah
WHERE kontrak.nim = mahasiswa.nim AND matakuliah.idmatakuliah = kontrak.idmatakuliah AND matakuliah.sks > 10;

--5
SELECT mahasiswa.nama ,kontrak.idkontrak , matakuliah.nama AS matakuliah FROM mahasiswa, kontrak ,matakuliah
WHERE kontrak.nim = mahasiswa.nim AND matakuliah.idmatakuliah = kontrak.idmatakuliah AND matakuliah.nama = 'data mining';

--6
SELECT nama AS dosen, COUNT(nim) AS jumlahmahasiswa FROM(SELECT DISTINCT dosen.iddosen, dosen.nama, mahasiswa.nim FROM mahasiswa, kontrak, dosen
WHERE kontrak.nim=mahasiswa.nim AND
dosen.iddosen = kontrak.iddosen) GROUP BY iddosen;

--7
SELECT mahasiswa.nama, mahasiswa.umur FROM  mahasiswa ORDER BY umur ASC;

--8
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan, matakuliah.nama AS matakuliah, matakuliah.sks, dosen.nama AS dosen, kontrak.nilai
FROM mahasiswa, kontrak, matakuliah, dosen, jurusan
WHERE kontrak.nim=mahasiswa.nim AND matakuliah.idmatakuliah = kontrak.idmatakuliah AND kontrak.iddosen = dosen.iddosen AND mahasiswa.idjurusan = jurusan.idjurusan AND kontrak.nilai > 'C';

SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan, matakuliah.nama AS matakuliah, matakuliah.sks, dosen.nama AS dosen, kontrak.nilai
FROM mahasiswa JOIN jurusan ON mahasiswa.idjurusan = jurusan.idjurusan JOIN kontrak ON kontrak.nim=mahasiswa.nim JOIN matakuliah ON matakuliah.idmatakuliah = kontrak.idmatakuliah JOIN dosen ON kontrak.iddosen = dosen.iddosen
WHERE kontrak.nilai > 'C';
