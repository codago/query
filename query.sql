--nomer  1
SELECT * from mahasiswa,jurusan

--nomer 2
select nama,umur from mahasiswa where umur<20

--nomer 3
select mahasiswa.nama,kontrak.nilai from mahasiswa , kontrak
where mahasiswa.nim=kontrak.nim and
kontrak. nilai <'B'

--nomer 4
select  mahasiswa.nama, sum (matakuliah.sks) as total_sks from mahasiswa, kontrak, matakuliah
where kontrak.nim=mahasiswa.nim and
matakuliah.idmk = kontrak.idmk group by mahasiswa.nim having total_sks > 10


--nomer 5
select mahasiswa.nama, matakuliah.namamk from mahasiswa, kontrak, matakuliah
where kontrak.nim=mahasiswa.nim and
matakuliah.idmk= kontrak.idmk and
matakuliah.namamk= 'data_mining'


--nomer 6
select iddosen, namadosen, count(nim) from(select distinct dosen.iddosen, dosen.namadosen, mahasiswa.nim from mahasiswa, kontrak, dosen
  where kontrak.nim=mahasiswa.nim and
  dosen.iddosen = kontrak.iddosen) group by iddosen;

  --nomer 7
  select nama,umur from mahasiswa
  order by umur

  --nomer 8
  --ok
  select  mahasiswa.nama, jurusan.namajurusan, matakuliah.namamk as matakuliah,  dosen.namadosen as dosen, kontrak.nilai from mahasiswa, kontrak, matakuliah, dosen, jurusan
  where kontrak.nim=mahasiswa.nim and
  matakuliah.idmk = kontrak.idmk and
  kontrak.iddosen = dosen.iddosen and
  mahasiswa.idjurusan = jurusan.idjurusan and
  kontrak.nilai > 'C';

  select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.namajurusan, matakuliah.namamk , matakuliah.sks, dosen.namadosen , kontrak.nilai
  from mahasiswa join jurusan on mahasiswa.idjurusan = jurusan.idjurusan join
  kontrak on kontrak.nim=mahasiswa.nim join
  matakuliah on matakuliah.idmk = kontrak.idmk join
  dosen on kontrak.iddosen = dosen.iddosen
  where kontrak.nilai > 'C';
