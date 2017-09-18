--soal no. 1 menampilkan seluruh data mahasiswa beserta jurusannya
select mahasiswa.nim, mahasiswa.nama,mahasiswa.id_jurusan,mahasiswa.alamat, jurusan.namajurusan from mahasiswa,jurusan
where mahasiswa.id_jurusan=jurusan.id_jurusan

--soal no. 2 menampilkan mahasiswa yang umurnya di bawah 20th
select * from mahasiswa
where umur<20

--soal no. 3 tampilkan mahasiswa yang memiliki nilai B ke atas
select mahasiswa.nim,mahasiswa.nama,mahasiswa.id_jurusan,mahasiswa.alamat,mahasiswa.umur,kontrak.nilai
from mahasiswa, kontrak
where mahasiswa.nim =kontrak.nim and
kontrak.nilai < 'B'

--soal no. 4 tampilkan mahasiswa yg jumlah sks nya lebih dari 10
select  mahasiswa.nim, mahasiswa.nama,sum (mata_kuliah.sks) as total_sks from mahasiswa, kontrak, mata_kuliah
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_matkul = kontrak.id_matkul group by mahasiswa.nim having total_sks > 10

-- soal no. 5 tampilkan mahasiswa yang mengambil mata kuliah 'data mining'
select mahasiswa.nim, mahasiswa.nama,mata_kuliah.nama from mahasiswa, kontrak, mata_kuliah
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_matkul= kontrak.id_matkul and
mata_kuliah.nama= 'Data Mining'

--soal no. 6 tampilkan jumlah mahasiswa untuk setiap dosen

select id_dosen, nama, count(nim) from(select distinct dosen.id_dosen, dosen.nama, mahasiswa.nim from mahasiswa, kontrak, dosen
  where kontrak.nim=mahasiswa.nim and
  dosen.id_dosen = kontrak.id_dosen) group by id_dosen;


--soal no.7
select nim, nama,umur from mahasiswa
order by umur ASC

-- soal no. 8 tampilkan kontrak matkul yg harus diulang, serta tampilkan data
--mahasiswa jurusan dan dosen



select  mahasiswa.nama, jurusan.namajurusan, mata_kuliah.nama as matakuliah,  dosen.nama as dosen, kontrak.nilai from mahasiswa, kontrak, mata_kuliah, dosen, jurusan
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_matkul = kontrak.id_matkul and
kontrak.id_dosen = dosen.id_dosen and
mahasiswa.id_jurusan = jurusan.id_jurusan and
kontrak.nilai > 'C';

select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama, mata_kuliah.nama , mata_kuliah.sks, dosen.nama , kontrak.nilai
from mahasiswa join jurusan on mahasiswa.id_jurusan = jurusan.id_jurusan join
kontrak on kontrak.nim=mahasiswa.nim join
mata_kuliah on mata_kuliah.id_matkul = kontrak.id_matkul join
dosen on kontrak.id_dosen = dosen.id_dosen
where kontrak.nilai > 'C';
