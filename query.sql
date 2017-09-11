-- nomor 1 (seluruh data mahasiswa beserta jurusan)
SELECT * From mahasiswa, jurusan

-- nomor 2 (mahasiswa umur dibawah 20th)
alter table mahasiswa add column umur integer;
update mahasiswa set umur = 40 where nim = '1';
  update mahasiswa set umur = 17 where nim = '2';

    select * from mahasiswa where umur < 20;

    -- nomor 3 (nilai b ke atas / kurang dari C)
    select mahasiswa.*, matakuliah.nama, relationship.nilai from mahasiswa, relationship, matakuliah
    where relationship.nim=mahasiswa.nim and
    matakuliah.idmatkul = relationship.idmatkul and
    relationship.nilai < 'C';

    -- nomor 4 (sks > 10)
    select mahasiswa.nim, mahasiswa.nama, sum (matakuliah.sks) as total_sks from mahasiswa, relationship, matakuliah
    where relationship.nim=mahasiswa.nim and
    matakuliah.idmatkul = relationship.idmatkul group by mahasiswa.nim having total_sks > 10

    -- nomor 5 (kontrak matkul = "data mining")
    select mahasiswa.*, matakuliah.nama from mahasiswa, relationship, matakuliah
    where relationship.nim=mahasiswa.nim and
    matakuliah.idmatkul = relationship.idmatkul and
    matakuliah.nama = 'data_mining'

    -- nomor 6 (jumlah mahasiswa untuk setiap dosen)
    select iddosen, nama, count(nim) from(select distinct dosen.iddosen, dosen.nama, mahasiswa.nim from mahasiswa, relationship, dosen
      where relationship.nim=mahasiswa.nim and
      dosen.iddosen = relationship.iddosen) group by iddosen;

      -- nomor 7 (berdasarkan umur)
      select * from mahasiswa
      order by umur;

      -- nomor 8
      select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama, matakuliah.nama as matakuliah, matakuliah.sks, dosen.nama as dosen, relationship.nilai from mahasiswa, relationship, matakuliah, dosen, jurusan
      where relationship.nim=mahasiswa.nim and
      matakuliah.idmatkul = relationship.idmatkul and
      relationship.iddosen = dosen.iddosen and
      mahasiswa.idjurusan = jurusan.idjurusan and
      relationship.nilai > 'C';


      select mahasiswa.nim, mahasiswa.nama, mahasiswa.alamat, jurusan.nama, matakuliah.nama as matakuliah, matakuliah.sks, dosen.nama as dosen, relationship.nilai from mahasiswa join jurusan on mahasiswa.idjurusan = jurusan.idjurusan join
      relationship on relationship.nim=mahasiswa.nim join matakuliah on matakuliah.idmatkul = relationship.idmatkul join dosen on relationship.iddosen = dosen.iddosen
      where relationship.nilai > 'C';
