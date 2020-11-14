<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>"><i class="fa fa-home"></i> Home</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="map-area mt-30">
    <div class="container">
        <?php $this->load->view('layouts/_alert') ?>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Checkout Berhasil
                    </div>
                    <div class="card-body">
                        <h5>Nomer Order: <?= $content->invoice ?></h5>
                        <p>Terima kasih, sudah berbelanja.</p>
                        <p>Silakan lakukan pembayaran untuk bisa kami proses selanjutnya dengan cara:</p>
                        <ol>
                            <li>Lakukan pembayaran pada rekening <strong>BCA 009988776655</strong> a/n PD Rumah Api</li>
                            <li>Sertakan keterangan dengan nomor order: <strong><?= $content->invoice ?></strong></li>
                            <li>Total pembayaran:
                                <strong>Rp<?= number_format($content->total, 0, ',', '.') ?>,-</strong>
                            </li>
                        </ol>
                        <p>Jika sudah, silakan kirimkan bukti transfer di halaman konfirmasi atau bisa <a
                                href="<?= base_url("/myorder/detail/$content->invoice") ?>">klik disini</a>!</p>
                        <a href="<?= base_url('/') ?>" class="btn btn-primary"><i class="fa fa-arrow-left"></i>
                            Kembali</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>