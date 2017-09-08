-- Table Untuk menampilkan table Mahasiswa dan jurusan

select Mahasiswa.MahasiswaID, Mahasiswa.NIM, Mahasiswa.Nama_Mahasiswa, Mahasiswa.Alamat, Jurusan.Nama_Jurusan
from Mahasiswa
inner join Jurusan on Mahasiswa.MahasiswaID = Jurusan.JurusanID;

-- Table untuk menampilkan mahasiswa yang memiliki umur di bawah 20 tahun
select Mahasiswa.Nama_Mahasiswa, Mahasiswa.umur
from mahasiswa
where Mahasiswa.umur < 20;


-- Table mahasiswa yang memiliki nilai 'B' ke atas
select Mahasiswa.Nama_Mahasiswa, Relationship.Grade
from Mahasiswa JOIN Relationship
ON mahasiswa.MahasiswaID = Relationship.Mahasiswa where Relationship.nilai >= 85;


-- Table untuk menampilkan mahasiswa yang memiliki jumlah SKS lebih dari 10
select Mahasiswa.Nama_Mahasiswa,SUM(MataKuliah.SKS) as total_sks
from Mahasiswa
inner join Relationship ON Relationship.Mahasiswa = Mahasiswa.MahasiswaID;
inner join MataKuliah ON MataKuliah.Mahasiswa = Relationship.MataKuliah;
group by Mahasiswa.Nama_Mahasiswa;
having total_sks > 10;

-- Table untuk mahasiswa yang mengambil MAata Kuliah "data minning"
select  Mahasiswa.Nama_Mahasiswa, MataKuliah.Nama_Mahasiswa
from Mahasiswa
inner join Relationship ON Relationship.Mahasiswa = Mahasiswa.MahasiswaID;
inner join MataKuliah ON MataKuliah.MataKuliahID = Relationship.MataKuliah;
where MataKuliah.Nama_Matkul = "Data Minning";

-- Table untuk menampilkan jumlah mahasiswa untuk setiap Dosen
select Dosen.Nama_Dosen,count(Dosen.Nama_Dosen) as Jumlah_Mahasiswa
from Dosen
inner join Relationship ON Relationship.Dosen = Dosen.DosenID;
inner join Mahasiswa ON Mahasiswa.MahasiswaID = Relationship.Mahasiswa;
group by Dosen.Nama_Dosen;

--  Table untuk mengurutkan umur mahasiswa
select *
from Mahasiswa
order by Mahasiswa.Umur;

-- Table untuk matakuliah yang harus diulang(nilai D dan E),serta tampilkan data mahasiswa jurusan dari dosen secara lengkap
select Relationship.Grade, Mahasiswa.Nama_Mahasiswa, Dosen.Nama_Dosen as Dosen, jurusan.Nama_Jurusan as jurusan
from Relationship
inner join Mahasiswa ON Mahasiswa.MahasiswaID = Relationship.Mahasiswa;
inner join Dosen ON Dosen.DosenID = Relationship.Dosen;
inner join Jurusan ON Jurusan.JurusanID = Mahasiswa.Jurusan;
where Relationship.Nilai <=64;
