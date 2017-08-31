--nomor 1
SELECT mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan FROM mahasiswa, jurusan where mahasiswa.idjurusan = jurusan.idjurusan;

--nomor 2
alter table mahasiswa add column umur integer;
update mahasiswa set umur = 25 where nim = '001';
update mahasiswa set umur = 16 where nim = '002';
select * from mahasiswa where umur < 20;

--nomor 3
select mahasiswa.*, matakuliah.nama, kontrak.nilai from mahasiswa, kontrak, matakuliah
where kontrak.nim=mahasiswa.nim and
matakuliah.idmatakuliah = kontrak.idmatakuliah and
kontrak.nilai < 'C';

--nomor 4
select mahasiswa.nim, mahasiswa.nama, sum (matakuliah.sks) as total_sks from mahasiswa, kontrak, matakuliah
where kontrak.nim=mahasiswa.nim and
matakuliah.idmatakuliah = kontrak.idmatakuliah group by mahasiswa.nim having total_sks > 10

--nomor 5
select mahasiswa.*, matakuliah.nama from mahasiswa, kontrak, matakuliah
where kontrak.nim=mahasiswa.nim and
matakuliah.idmatakuliah = kontrak.idmatakuliah and
matakuliah.nama = 'data mining'

--nomor 6
select iddosen, nama, count(nim) from(select distinct dosen.iddosen, dosen.nama, mahasiswa.nim from mahasiswa, kontrak, dosen
where kontrak.nim=mahasiswa.nim and
dosen.iddosen = kontrak.iddosen) group by iddosen;

--nomor 7
select * from mahasiswa
order by umur;

--nomor 8
select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan, matakuliah.nama as matakuliah, matakuliah.sks, dosen.nama as dosen, kontrak.nilai from mahasiswa, kontrak, matakuliah, dosen, jurusan
where kontrak.nim=mahasiswa.nim and
matakuliah.idmatakuliah = kontrak.idmatakuliah and
kontrak.iddosen = dosen.iddosen and
mahasiswa.idjurusan = jurusan.idjurusan and
kontrak.nilai > 'C';

select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan, matakuliah.nama as matakuliah, matakuliah.sks, dosen.nama as dosen, kontrak.nilai from mahasiswa join jurusan on mahasiswa.idjurusan = jurusan.idjurusan join
kontrak on kontrak.nim=mahasiswa.nim join matakuliah on matakuliah.idmatakuliah = kontrak.idmatakuliah join dosen on kontrak.iddosen = dosen.iddosen
where kontrak.nilai > 'C';
