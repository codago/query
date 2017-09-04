-- nomor 1
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama_jurusan FROM mahasiswa, jurusan where mahasiswa.id_jurusan = jurusan.id_jurusan;

-- nomor 2
alter table mahasiswa add column umur integer;
update mahasiswa set umur = 39 where nim = '1';
update mahasiswa set umur = 19 where nim = '2';

select * from mahasiswa where umur < 20;

-- nomor 3
select mahasiswa.*, mata_kuliah.nama, kontrak.nilai from mahasiswa, kontrak, mata_kuliah
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_mata_kuliah = kontrak.id_mata_kuliah and
kontrak.nilai < 'C';

-- nomor 4
select mahasiswa.nim, mahasiswa.nama, sum (mata_kuliah.sks) as total_sks from mahasiswa, kontrak, mata_kuliah
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_mata_kuliah = kontrak.id_mata_kuliah group by mahasiswa.nim having total_sks > 10

-- nomor 5
select mahasiswa.*, mata_kuliah.nama from mahasiswa, kontrak, mata_kuliah
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_mata_kuliah = kontrak.id_mata_kuliah and
mata_kuliah.nama = 'data_mining'

-- nomor 6
select id_dosen, nama, count(nim) from(select distinct dosen.id_dosen, dosen.nama, mahasiswa.nim from mahasiswa, kontrak, dosen
where kontrak.nim=mahasiswa.nim and
dosen.id_dosen = kontrak.id_dosen) group by id_dosen;

-- nomor 7
select * from mahasiswa
order by umur;

-- nomor 8
select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama_jurusan, mata_kuliah.nama as mata_kuliah, mata_kuliah.sks, dosen.nama as dosen, kontrak.nilai from mahasiswa, kontrak, mata_kuliah, dosen, jurusan
where kontrak.nim=mahasiswa.nim and
mata_kuliah.id_mata_kuliah = kontrak.id_mata_kuliah and
kontrak.id_dosen = dosen.id_dosen and
mahasiswa.id_jurusan = jurusan.id_jurusan and
kontrak.nilai > 'C';


select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama_jurusan, matakuliah.nama as mata_kuliah, mata_kuliah.sks, dosen.nama as dosen, kontrak.nilai from mahasiswa join jurusan on mahasiswa.idjurusan = jurusan.id_jurusan join
kontrak on kontrak.nim=mahasiswa.nim join mata_kuliah on mata_kuliah.id_mata_kuliah = kontrak.id_mata_kuliah join dosen on kontrak.id_dosen = dosen.id_dosen
where kontrak.nilai > 'C';
