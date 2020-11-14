<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">About</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="about-us-area about-page section-padding-100">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-12 col-lg-5">
                <div class="about-content">
                    <h2>Welcome To Tigris Fire</h2>
                    <p>Menyediakan berbagai macam peralatan pemadam kebakaran yang berkualitas, serta berpengalaman
                        dalam menentukan dan membangun sistem proteksi kebakaran yang sesuai, PT Tigris Berkat Sejati
                        menjadi
                        pilihan yang tepat untuk melindungi investasi Anda secara menyeluruh.</p>
                    <div class="opening-hours-location mt-30 d-flex align-items-center">
                        <div class="opening-hours">
                            <h6><i class="fa fa-clock-o"></i> Opening Hours</h6>
                            <p>Mon - Sat at 08:00 - 17:00 <br>Sunday Close</p>
                        </div>
                        <div class="location">
                            <h6><i class="fa fa-map-marker"></i> Location</h6>
                            <p>JJl. RA Kartini No. 23 E Margahyu, Bekasi Kota</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <div class="about-thumbnail">
                    <img src="<?= base_url() ?>/assets/img/Company-Profile-Tigris-Fire-YouTube.png" alt="Tentang Tigris Fire Indonesia">
                </div>
            </div>
        </div>
    </div>
</div>

<section class="call-to-action-area section-padding-100 bg-img bg-overlay"
    style="background-image: url(<?= base_url() ?>/assets/img/bg-img/slide-3.jpg)">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="call-to-action-content text-center">
                    <h2>Kami berkomitmen untuk memberikan solusi yang efektif untuk membantu menjaga bisnis dan
                        investasi Anda agar selalu terlindungi.</h2>
                    <?php if (!$this->session->userdata('is_login')) : ?>
                    <a href="<?= base_url('register') ?>" class="btn crose-btn btn-2">Become A Member</a>
                    <?php else : ?>
                    <a type="button" class="btn crose-btn btn-2"
                        onclick="Swal.fire({icon: 'error', title: 'Mohon Maaf', text: 'Server sedang diperbaiki', footer: '<a href>Kami pastikan anda mendapatkan penawaran saat selesai</a>'})">
                        Ambil Penawaran</a>
                    <?php endif ?>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="why-choose-us bg-gray section-padding-100-0">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h2>PT Tigris Berkat Sejati</h2>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <h4>Konsultasi Produk</h4>
                    <p>Konsultasikan produk yang akan anda beli, pastikan barang tersebut benar dan sesuai dengan
                        kebutuhan anda</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <h4>Pengiriman</h4>
                    <p>Sebelum order pastikan ketersediaan barang pesanan, Ada beberapa barang membutuhkan waktu import
                    </p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <h4>Garansi</h4>
                    <p>Pastikan bahwa barang yang Anda beli bergaransi, karena beberapa item barang ada yang tidak
                        bergaransi</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <h4>Pembayaran</h4>
                    <p>Lakukan pembayaran sesuai dengan kesepakatan, Anda akan menerima invoice resmi setelah PO kami
                        terima</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="why-choose-us section-padding-100-0">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h2>Trusted by Many Companies</h2>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/1.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/2.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/3.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/4.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/5.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/6.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/7.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/8.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/9.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/10.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/11.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/client/12.png" alt="Client Tigris Fire Indonesia">
                </div>
            </div>
        </div>
    </div>
</div>