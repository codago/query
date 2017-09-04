--Nomer 1
SELECT * FROM Mahasiswa,Jurusan where Mahasiswa.Nama_Jurusan = MataKuliah.Nama_Jurusan;

--Nomer 2
SELECT * FROM Mahasiswa, where Umur < 20;

--nomer 3
SELECT Mahasiswa.*, MataKuliah.Nama_Jurusan, Kontrak.Nilai from Mahasiswa, MataKuliah, Kontrak
where Kontrak.Nim = Mahasiswa.Nim and MataKuliah.ID_Mata_Kuliah = kontrak.ID_Mata_Kuliah and Kontrak.Nilai < 'C'

--nomer 4
SELECT Mahasiswa.Nim, Mahasiswa.Nama, sum (MataKuliah.SKS) as Total_SKS from Mahasiswa, Kontrak, MataKuliah
where Kontrak.Nim = Mahasiswa.Nim and MataKuliah.ID_Mata_Kuliah = Kontrak.ID_Mata_Kuliah group by Mahasiswa.Nim having Total_SKS > 10

--nomer 5
SELECT Mahasiswa.Nama_Mahasiswa, MataKuliah.Nama_Jurusan from Mahasiswa, MataKuliah, Kontrak
where Kontrak.Nim = Mahasiswa.Nim and MataKuliah.ID_Mata_Kuliah = Kontrak.ID_Mata_Kuliah and MataKuliah.Nama_Mata_Kuliah = 'data mining'

--nomer 6
SELECT ID_Dosen, Nama_Dosen, count(Nim) from (SELECT DISTINCT Dosen.ID_Dosen, Dosen.Nama_Dosen, Mahasiswa.Nim from Mahasiswa, Kontrak, Dosen
where Kontrak.Nim = Mahasiswa.Nim and Dosen.ID_Dosen = Kontrak.ID_Dosen) group by ID_Dosen;

--nomer 7
SELECT * FROM Mahasiswa
order by Umur

--nomer 8
SELECT Mahasiswa.Nim, Mahasiswa.Nama, Mahasiswa.Alamat, Jurusan.Nama_Jurusan, MataKuliah.Nama_Mata_Kuliah as MataKuliah,
MataKuliah.SKS, Dosen.Nama_Dosen as Dosen, Kontrak.Nilai from Mahasiswa, Kontrak, MataKuliah, Dosen, Jurusan
where Kontrak.Nim = Mahasiswa.Nim and MataKuliah.ID_Mata_Kuliah = Kontrak.ID_Mata_Kuliah and Kontrak.ID_Dosen = Dosen.ID_Dosen and Mahasiswa.ID_Jurusan = Jurusan.ID_Jurusan and Kontrak.Nilai > 'C';

SELECT Mahasiswa.Nim, Mahasiswa.Nama, Mahasiswa.Alamat, Jurusan.Nama_Jurusan, MataKuliah.Nama_Mata_Kuliah as MataKuliah,
MataKuliah.SKS, Dosen.Nama_Dosen as Dosen, Kontrak.Nilai from Mahasiswa join Jurusan on Mahasiswa.ID_Jurusan = Mahasiswa.ID_Jurusan join Kontrak on Kontrak.Nim = Mahasiswa.Nim join MataKuliah on MataKuliah.ID_Mata_Kuliah = Kontrak.ID_Mata_Kuliah join Dosen on Kontrak.ID_Dosen = Dosen.ID_Dosen
where Kontrak.Nilai > 'C';
