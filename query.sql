-- tampilkan seluruh data mahasiswa beserta nama jurusannya
SELECT mahasiswa.mahasiswa_id,mahasiswa.nim,mahasiswa.nama,mahasiswa.alamat,jurusan.nama 
FROM mahasiswa JOIN jurusan on mahasiswa.mahasiswa_id = jurusan.jurusan_id;

-- tampilkan mahasiswa yang memiliki umur dibawah 20 tahun

SELECT mahasiswa.nama,mahasiswa.umur FROM mahasiswa WHERE mahasiswa.umur < 20;

-- tampilkan mahasiswa yang memiliki nilai 'B' ke atas

SELECT mahasiswa.nama,kontrak.grade 
FROM mahasiswa JOIN kontrak 
ON mahasiswa.mahasiswa_id = kontrak.mahasiswa WHERE kontrak.nilai >=85;

-- tampilkan mahasiswa yang memiliki jumlah SKS lebih dari 10

SELECT mahasiswa.nama,SUM(matakuliah.sks) as total_sks FROM mahasiswa
INNER JOIN kontrak ON kontrak.mahasiswa = mahasiswa.mahasiswa_id
INNER JOIN matakuliah ON matakuliah.matakuliah_id = kontrak.matakuliah
GROUP BY mahasiswa.nama
HAVING total_sks > 10;

-- tampilkan mahasiswa yang mengontrak mata kuliah 'data mining'

SELECT mahasiswa.nama,matakuliah.nama FROM mahasiswa
INNER JOIN kontrak on kontrak.mahasiswa = mahasiswa.mahasiswa_id
INNER JOIN matakuliah on matakuliah.matakuliah_id = kontrak.matakuliah
WHERE matakuliah.nama = "Data Mining";

-- tampilkan jumlah mahasiswa untuk setiap dosen

SELECT dosen.nama,count(dosen.nama) as jumlah_mahasiswa FROM dosen
INNER JOIN kontrak ON kontrak.dosen = dosen.dosen_id
INNER JOIN mahasiswa ON mahasiswa.mahasiswa_id = kontrak.mahasiswa
GROUP BY dosen.nama;


-- urutkan mahasiswa berdasarkan umurnya

SELECT mahasiswa.nama, mahasiswa.umur FROM mahasiswa
GROUP BY mahasiswa.umur;

-- tampilkan kontrak matakuliah yang harus diulang(nilai D dan E),serta tampilkan data mahasiswa jurusan dari dosen secara lengkap

SELECT kontrak.grade,mahasiswa.nama,dosen.nama as dosen,jurusan.nama as jurusan FROM kontrak
INNER JOIN mahasiswa ON mahasiswa.mahasiswa_id = kontrak.mahasiswa
INNER JOIN dosen ON dosen.dosen_id = kontrak.dosen
INNER JOIN jurusan ON jurusan.jurusan_id = mahasiswa.jurusan
WHERE kontrak.nilai <=64;
