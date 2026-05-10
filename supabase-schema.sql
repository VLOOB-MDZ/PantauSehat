-- ═══════════════════════════════════════════════════════════════
--  PantauSehat — Supabase Schema
--  Jalankan seluruh file ini di Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

-- ── Tabel berita / briefings ─────────────────────────────────────
CREATE TABLE IF NOT EXISTS briefings (
  id          BIGSERIAL PRIMARY KEY,
  title       TEXT NOT NULL,
  description TEXT DEFAULT '',
  link        TEXT UNIQUE NOT NULL,
  thumbnail   TEXT DEFAULT '',
  source      TEXT DEFAULT '',
  tag         TEXT DEFAULT 'Laporan Lapangan',
  color       TEXT DEFAULT 'coral',
  pub_date    TIMESTAMPTZ DEFAULT NOW(),
  fetched_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── Statistik nasional (satu baris tetap, id = 1) ────────────────
CREATE TABLE IF NOT EXISTS national_stats (
  id                   INTEGER PRIMARY KEY DEFAULT 1,
  total_alerts         INTEGER DEFAULT 1248,
  change_pct           NUMERIC(5,1) DEFAULT 12.4,
  change_up            BOOLEAN DEFAULT TRUE,
  today_cases          INTEGER DEFAULT 42,
  active_provinces     INTEGER DEFAULT 12,
  primary_disease_rate INTEGER DEFAULT 24,
  updated_at           TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO national_stats (id) VALUES (1) ON CONFLICT (id) DO NOTHING;

-- ── Data surveilans per provinsi ─────────────────────────────────
CREATE TABLE IF NOT EXISTS province_stats (
  province    TEXT PRIMARY KEY,
  risk        TEXT DEFAULT 'normal',
  disease     TEXT DEFAULT 'Tidak Dilaporkan',
  cases       INTEGER DEFAULT 0,
  trend       TEXT DEFAULT '—',
  pop         TEXT DEFAULT '—',
  description TEXT DEFAULT '',
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── Row Level Security (baca publik, tulis hanya service role) ───
ALTER TABLE briefings      ENABLE ROW LEVEL SECURITY;
ALTER TABLE national_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE province_stats ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_briefings"      ON briefings;
DROP POLICY IF EXISTS "read_national_stats" ON national_stats;
DROP POLICY IF EXISTS "read_province_stats" ON province_stats;

CREATE POLICY "read_briefings"      ON briefings      FOR SELECT TO anon USING (true);
CREATE POLICY "read_national_stats" ON national_stats FOR SELECT TO anon USING (true);
CREATE POLICY "read_province_stats" ON province_stats FOR SELECT TO anon USING (true);

-- ── Seed data 34 provinsi ────────────────────────────────────────
INSERT INTO province_stats (province, risk, disease, cases, trend, pop, description) VALUES
('Aceh',                      'moderate', 'Malaria',            45,  '+3%',  '5.3M',  'Aktivitas malaria musiman di komunitas pegunungan. Pengendalian vektor dikerahkan di 4 kabupaten.'),
('Sumatera Utara',            'high',     'Dengue Fever',       112, '+8%',  '15.4M', 'Penularan DBD meningkat di kawasan metropolitan Medan pascahujan lebat musiman.'),
('Sumatera Barat',            'moderate', 'Leptospirosis',      28,  '+1%',  '5.5M',  'Pemantauan pascabanjir aktif di kabupaten pesisir. Tim respons sanitasi telah dikerahkan.'),
('Riau',                      'low',      'ISPA',               15,  '-2%',  '7.2M',  'Klaster infeksi saluran pernapasan terkait kabut asap musiman. Peringatan kualitas udara aktif.'),
('Jambi',                     'normal',   'Tidak Dilaporkan',   3,   '—',    '3.5M',  'Tidak ada wabah signifikan. Surveilans rutin dan kampanye vaksinasi terus berjalan.'),
('Sumatera Selatan',          'moderate', 'Dengue Fever',       67,  '+5%',  '8.6M',  'Aktivitas DBD pada baseline musiman. Pemantauan intensif di zona perkotaan Palembang.'),
('Bengkulu',                  'low',      'Malaria',            8,   '-1%',  '2.0M',  'Malaria menurun pascaoperasi pengendalian vektor. Pemantauan lanjutan tetap berjalan.'),
('Lampung',                   'moderate', 'Dengue Fever',       54,  '+4%',  '9.1M',  'Lonjakan DBD di Bandar Lampung. Kampanye kesadaran masyarakat aktif di wilayah padat penduduk.'),
('Kepulauan Bangka Belitung', 'low',      'Dengue Fever',       12,  '+1%',  '1.5M',  'Aktivitas DBD minor dalam rentang musiman. Surveilans rutin berjalan.'),
('Kepulauan Riau',            'low',      'ISPA',               9,   '0%',   '2.2M',  'Tidak ada wabah besar. Skrining kesehatan pelabuhan aktif di terminal feri internasional Batam.'),
('DKI Jakarta',               'critical', 'Dengue Fever',       342, '+18%', '10.6M', 'Wabah DBD kritis di Jakarta Timur dan Jakarta Utara. Tim respons darurat dikerahkan. Kapasitas RS mencapai 78% di distrik terdampak.'),
('Jawa Barat',                'critical', 'Dengue Fever',       289, '+12%', '49.9M', 'Klaster DBD besar di Bandung dan Bekasi. HFMD juga dilaporkan di klaster sekolah Bogor dan Depok.'),
('Jawa Tengah',               'moderate', 'Typhoid',            98,  '+2%',  '36.8M', 'Tifoid meningkat di dataran Jawa Tengah. Investigasi sanitasi air aktif di 5 kabupaten.'),
('DI Yogyakarta',             'moderate', 'Dengue Fever',       41,  '+6%',  '3.7M',  'Pemantauan DBD aktif. Kasus terkonsentrasi di Sleman dan Bantul.'),
('Jawa Timur',                'high',     'Leptospirosis',      156, '+9%',  '41.1M', 'Wabah leptospirosis di zona pascabanjir. 156 kasus terkonfirmasi, 3 kematian dilaporkan di Jawa Timur.'),
('Banten',                    'high',     'Dengue Fever',       134, '+11%', '12.7M', 'Penularan DBD tinggi di Tangerang dan Serang. Kasus 40% di atas baseline musiman.'),
('Bali',                      'moderate', 'Rabies',             19,  '+5%',  '4.4M',  'Surveilans vektor rabies aktif pascainsiden gigitan anjing. Profilaksis pascapajanan didistribusikan di Gianyar.'),
('Nusa Tenggara Barat',       'low',      'Malaria',            23,  '-3%',  '5.5M',  'Malaria menurun di NTB. Terapi kombinasi artemisinin didistribusikan ke seluruh puskesmas.'),
('Nusa Tenggara Timur',       'moderate', 'Malaria',            87,  '+7%',  '5.4M',  'Malaria meningkat di distrik terpencil NTT. Akses layanan kesehatan terbatas mempersulit logistik respons.'),
('Kalimantan Barat',          'moderate', 'Malaria',            61,  '+4%',  '5.5M',  'Malaria endemik di wilayah perbatasan dengan Malaysia. Protokol koordinasi kesehatan lintas batas aktif.'),
('Kalimantan Tengah',         'low',      'ISPA',               18,  '+1%',  '2.7M',  'Kasus pernapasan terkait kabut asap kebakaran gambut. Peringatan kualitas udara di 3 kabupaten.'),
('Kalimantan Selatan',        'low',      'Dengue Fever',       27,  '+2%',  '4.3M',  'DBD pada baseline musiman. Fogging rutin berjalan di kawasan metropolitan Banjarmasin.'),
('Kalimantan Timur',          'low',      'Dengue Fever',       31,  '+3%',  '3.7M',  'Pemantauan intensif di wilayah ibu kota baru. Surveilans DBD aktif di Balikpapan.'),
('Kalimantan Utara',          'normal',   'Tidak Dilaporkan',   4,   '—',    '0.7M',  'Tidak ada wabah signifikan. Skrining kesehatan perbatasan rutin aktif di pos pemeriksaan Nunukan.'),
('Sulawesi Utara',            'low',      'Dengue Fever',       21,  '+2%',  '2.6M',  'Pemantauan DBD di kawasan perkotaan Manado. Surveilans pelabuhan aktif di terminal maritim Bitung.'),
('Sulawesi Tengah',           'moderate', 'Malaria',            45,  '+3%',  '3.1M',  'Malaria aktif di pesisir dan pegunungan Sulawesi Tengah. Kader kesehatan masyarakat dikirim ke daerah terpencil.'),
('Sulawesi Selatan',          'low',      'Dengue Fever',       38,  '0%',   '9.1M',  'DBD pada baseline. Otoritas kesehatan pelabuhan Makassar menjalankan operasi skrining rutin.'),
('Sulawesi Tenggara',         'low',      'Malaria',            16,  '-2%',  '2.7M',  'Malaria menurun. Program distribusi kelambu antinyamuk baru selesai dilaksanakan.'),
('Gorontalo',                 'normal',   'Tidak Dilaporkan',   5,   '—',    '1.2M',  'Tidak ada wabah aktif. Kampanye vaksinasi rutin dan program kesehatan masyarakat terus berjalan.'),
('Sulawesi Barat',            'low',      'Malaria',            11,  '0%',   '1.4M',  'Aktivitas malaria stabil. Tim surveilans komunitas memantau wilayah pesisir dan pegunungan.'),
('Maluku',                    'moderate', 'Malaria',            72,  '+6%',  '1.9M',  'Malaria meningkat di kepulauan Maluku. Geografi kepulauan mempersulit logistik respons darurat.'),
('Maluku Utara',              'moderate', 'Malaria',            49,  '+4%',  '1.3M',  'Klaster malaria di Maluku Utara. Pengiriman pasokan medis dikoordinasikan melalui transportasi laut.'),
('Papua Barat',               'high',     'Malaria',            143, '+14%', '1.1M',  'Beban malaria tinggi di Papua Barat. Komunitas terpencil dengan akses terbatas menjadi target intervensi prioritas.'),
('Papua',                     'high',     'Malaria',            198, '+11%', '4.3M',  'Provinsi dengan beban malaria tertinggi di Indonesia. Evakuasi udara darurat aktif di 3 distrik terpencil. Tim respons cepat WHO dikerahkan.')
ON CONFLICT (province) DO NOTHING;
