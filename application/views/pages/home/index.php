<section class="hero-area hero-post-slides owl-carousel">

    <div class="single-hero-slide bg-img bg-overlay d-flex align-items-center justify-content-center"
        style="background-image: url(<?= base_url() ?>/assets/img/bg-img/slide-1.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="hero-slides-content">
                        <h2 data-animation="fadeInUp" data-delay="100ms">PT Tigris Berkat Sejati</h2>
                        <p data-animation="fadeInUp" data-delay="300ms">Tigris Fire solusi untuk sistem proteksi
                            kebakaran Anda. Tigris Fire melayani jasa konsultan, distributor, kontraktor, service, hingga
                            perawatan fire hydrant, fire systems, fire alarm, dan fire extinguisher.</p>
                        <a href="<?= base_url('about') ?>" class="btn crose-btn" data-animation="fadeInUp" data-delay="500ms">About Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="single-hero-slide bg-img bg-overlay d-flex align-items-center justify-content-center"
        style="background-image: url(<?= base_url() ?>/assets/img/bg-img/slide-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="hero-slides-content">
                        <h2 data-animation="fadeInUp" data-delay="100ms">Fire System Solutions</h2>
                        <p data-animation="fadeInUp" data-delay="300ms">Tigris Fire solusi untuk sistem proteksi
                            kebakaran Anda. Tigris Fire melayani jasa konsultan, distributor, kontraktor, service, hingga
                            perawatan fire hydrant, fire systems, fire alarm, dan fire extinguisher.</p>
                        <a href="<?= base_url('contact') ?>" class="btn crose-btn" data-animation="fadeInUp" data-delay="500ms">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="why-choose-us bg-white section-padding-100-0">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h2>right choice to secure your assets</h2>
                    <p>Tigris Fire menyediakan produk yang inovatif serta layanan yang komperensif mulai dari
                        perencanaan hingga perawatan. Solusi cerdas untuk perlindungan bisnis dan Investasi Anda.</p>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/core-img/fire-hydrant-icon-1.jpg" alt="Layanan Tigris Fire Indonesia">
                    <h4>Fire Hydrant</h4>
                    <p>Teknisi berpengalaman dengan kualifikasi internasional sertifikasi NFPA.</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/core-img/fire-alarm-icon-1.jpg" alt="Layanan Tigris Fire Indonesia">
                    <h4>Fire Alarm</h4>
                    <p>Perencanaan, instalasi dan perawatan yang tepat, akurat, serta menyeluruh dalam perlindungan.
                    </p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/core-img/fire-system-icon-1.jpg" alt="Layanan Tigris Fire Indonesia">
                    <h4>Fire System</h4>
                    <p>Proteksi kebakaran handal di bawah satu vendor, satu sumber, satu panggilan.</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="single-why-choose-us mb-100">
                    <img src="<?= base_url() ?>/assets/img/core-img/fire-extinguisher-icon-1.jpg" alt="Layanan Tigris Fire Indonesia">
                    <h4>Fire Extiguisher</h4>
                    <p>Alat pemadam api kualifikasi internasional untuk proteksi aset dan bisnis Anda.</p>
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
                    <h6>The Best Extinguisher Product</h6>
                    <h2>Get a Special Access and Offer if join Become member Tigris Fire right now.</h2>
                    <?php if (!$this->session->userdata('is_login')) : ?>
                    <a href="<?= base_url('register') ?>" class="btn crose-btn btn-2">Become A Member</a>
                    <?php else : ?>
                    <a type="button" class="btn crose-btn btn-2"
                        onclick="Swal.fire({icon: 'error', title: 'Mohon Maaf', text: 'Server sedang diperbaiki', footer: '<a href>Kami pastikan anda mendapatkan penawaran saat selesai</a>'})">
                        Ambil Penawaran</button>
                        <?php endif ?>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="latest-sermons-area section-padding-100-0">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading">
                    <h2>What we offer?</h2>
                    <p>Tigris Fire telah berpengalaman mulai dari tahun 2014, banyak sekali layanan dan produk yang kami
                        tawarkan untuk anda yang pasti dengan harga bersaing serta terjamin kualitasnya.</p>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-12 col-md-6 col-lg-3">
                <div class="single-latest-sermons mb-100">
                    <div class="sermons-thumbnail">
                        <img src="<?= base_url() ?>/assets/img/features/features-4.svg" alt="Pelayanan Tigris Fire Indonesia">
                        <div class="sermons-date">
                            <h6><span>ON</span>Time</h6>
                        </div>
                    </div>
                    <div class="sermons-content">
                        <h4>Consultant</h4>
                        <div class="sermons-meta-data">
                            <p><i class="fa fa-user" aria-hidden="true"></i> From: <span>PT Tigris Berkat Sejati</span>
                            </p>
                            <p><i class="fa fa-tag" aria-hidden="true"></i> Categories: <span>Services</span></p>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Time: <span>Everyday</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3">
                <div class="single-latest-sermons mb-100">
                    <div class="sermons-thumbnail">
                        <img src="<?= base_url() ?>/assets/img/features/features-2.svg" alt="Pelayanan Tigris Fire Indonesia">
                        <div class="sermons-date">
                            <h6><span>ON</span>Time</h6>
                        </div>
                    </div>
                    <div class="sermons-content">
                        <h4>Contractor</h4>
                        <div class="sermons-meta-data">
                            <p><i class="fa fa-user" aria-hidden="true"></i> From: <span>PT Tigris Berkat Sejati</span>
                            </p>
                            <p><i class="fa fa-tag" aria-hidden="true"></i> Categories: <span>Services</span></p>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Time: <span>Everyday</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3">
                <div class="single-latest-sermons mb-100">
                    <div class="sermons-thumbnail">
                        <img src="<?= base_url() ?>/assets/img/features/features-3.svg" alt="Pelayanan Tigris Fire Indonesia">
                        <div class="sermons-date">
                            <h6><span>ON</span>Time</h6>
                        </div>
                    </div>
                    <div class="sermons-content">
                        <h4>Distributor</h4>
                        <div class="sermons-meta-data">
                            <p><i class="fa fa-user" aria-hidden="true"></i> From: <span>PT Tigris Berkat Sejati</span>
                            </p>
                            <p><i class="fa fa-tag" aria-hidden="true"></i> Categories: <span>Services</span></p>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Time: <span>Everyday</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3">
                <div class="single-latest-sermons mb-100">
                    <div class="sermons-thumbnail">
                        <img src="<?= base_url() ?>/assets/img/features/features-1.svg" alt="Pelayanan Tigris Fire Indonesia">
                        <div class="sermons-date">
                            <h6><span>ON</span>Time</h6>
                        </div>
                    </div>
                    <div class="sermons-content">
                        <h4>Maintenance</h4>
                        <div class="sermons-meta-data">
                            <p><i class="fa fa-user" aria-hidden="true"></i> From: <span>PT Tigris Berkat Sejati</span>
                            </p>
                            <p><i class="fa fa-tag" aria-hidden="true"></i> Categories: <span>Services</span></p>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Time: <span>Everyday</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="upcoming-events-area section-padding-0-100">
    <div class="upcoming-events-heading bg-img bg-overlay bg-fixed" style="background-image: url(img/bg-img/1.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-left white">
                        <h2>Our Product</h2>
                        <p>The best product and service from tigris fire always ready!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="upcoming-events-slides-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="upcoming-slides owl-carousel">

                        <div class="single-slide">
                            <?php foreach (getHome() as $product) : ?>
                            <div class="single-upcoming-events-area d-flex flex-wrap align-items-center">

                                <div class="upcoming-events-thumbnail">
                                    <img src="<?= base_url() ?>/images/product/<?= $product->image ?>" alt="Produk Tigris Fire Indonesia">
                                </div>

                                <div class="upcoming-events-content d-flex flex-wrap align-items-center">
                                    <div class="events-text">
                                        <h4><?= $product->title ?></h4>
                                        <div class="events-meta">
                                            <p><?= $product->price ?></p>
                                        </div>
                                        <p><?= $product->intro ?></p>
                                        <a href="<?= base_url("/shop/detail/$product->slug") ?>">Detail Product <i
                                                class="fa fa-angle-double-right"></i></a>
                                    </div>
                                    <div class="find-out-more-btn">
                                        <?php if (!$this->session->userdata('is_login')) : ?>
                                        <button class="btn crose-btn btn-2"
                                            onclick="Swal.fire({icon: 'error', title: 'Mohon Maaf', text: 'Silahkan masuk akun terlebih dulu', footer: '<a href>Daftar Akun untuk mendapatkan spesial akses</a>'})"><i
                                                class="fa fa-shopping-cart"></i> Beli
                                            Sekarang</button>
                                        <?php else : ?>
                                        <form action="<?= base_url("/cart/add") ?>" method="POST">
                                            <input type="hidden" name="id_product" value="<?= $product->id ?>">
                                            <input type="hidden" name="qty" value="1">
                                            <button type="submit" class="btn crose-btn btn-2"><i
                                                    class="fa fa-shopping-cart"></i> Add
                                                to Cart</button>
                                        </form>
                                        <?php endif ?>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach ?>
                        </div>

                        <div class="single-slide">
                            <?php foreach (getHome() as $product) : ?>
                            <div class="single-upcoming-events-area d-flex flex-wrap align-items-center">

                                <div class="upcoming-events-thumbnail">
                                    <img src="<?= base_url() ?>/images/product/<?= $product->image ?>" alt="Produk Tigris Fire Indonesia">
                                </div>

                                <div class="upcoming-events-content d-flex flex-wrap align-items-center">
                                    <div class="events-text">
                                        <h4><?= $product->title ?></h4>
                                        <div class="events-meta">
                                            <p><?= $product->price ?></p>
                                        </div>
                                        <p><?= $product->intro ?></p>
                                        <a href="<?= base_url("/shop/detail/$product->slug") ?>">Detail Product <i
                                                class="fa fa-angle-double-right"></i></a>
                                    </div>
                                    <div class="find-out-more-btn">
                                        <?php if (!$this->session->userdata('is_login')) : ?>
                                        <button class="btn crose-btn btn-2"
                                            onclick="Swal.fire({icon: 'error', title: 'Mohon Maaf', text: 'Silahkan masuk akun terlebih dulu', footer: '<a href>Daftar Akun untuk mendapatkan spesial akses</a>'})"><i
                                                class="fa fa-shopping-cart"></i> Beli
                                            Sekarang</button>
                                        <?php else : ?>
                                        <form action="<?= base_url("/cart/add") ?>" method="POST">
                                            <input type="hidden" name="id_product" value="<?= $product->id ?>">
                                            <input type="hidden" name="qty" value="1">
                                            <button type="submit" class="btn crose-btn btn-2"><i
                                                    class="fa fa-shopping-cart"></i> Add
                                                to Cart</button>
                                        </form>
                                        <?php endif ?>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach ?>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="gallery-area d-flex flex-wrap">

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/1.jpg" class="gallery-img" title="Gallery Image 1">
            <img src="<?= base_url() ?>/assets/img/gallery/view1.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/2.jpg" class="gallery-img" title="Gallery Image 2">
            <img src="<?= base_url() ?>/assets/img/gallery/view2.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/3.jpg" class="gallery-img" title="Gallery Image 3">
            <img src="<?= base_url() ?>/assets/img/gallery/view3.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/4.jpg" class="gallery-img" title="Gallery Image 4">
            <img src="<?= base_url() ?>/assets/img/gallery/view4.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/5.jpg" class="gallery-img" title="Gallery Image 5">
            <img src="<?= base_url() ?>/assets/img/gallery/5.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/6.jpg" class="gallery-img" title="Gallery Image 6">
            <img src="<?= base_url() ?>/assets/img/gallery/view6.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/7.jpg" class="gallery-img" title="Gallery Image 7">
            <img src="<?= base_url() ?>/assets/img/gallery/view7.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/8.jpg" class="gallery-img" title="Gallery Image 8">
            <img src="<?= base_url() ?>/assets/img/gallery/view8.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/9.jpg" class="gallery-img" title="Gallery Image 9">
            <img src="<?= base_url() ?>/assets/img/gallery/view9.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>

    <div class="single-gallery-area">
        <a href="<?= base_url() ?>/assets/img/gallery/10.jpg" class="gallery-img" title="Gallery Image 10">
            <img src="<?= base_url() ?>/assets/img/gallery/view10.jpg" alt="Portfolio Tigris Fire Indonesia">
        </a>
    </div>
</div>

<section class="blog-area section-padding-100-0">
    <div class="container">

        <div class="row justify-content-center">

            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-blog-post mb-100">
                    <div class="post-thumbnail">
                        <h1>
                            <center><?= $pengunjungonline ?></center>
                        </h1>
                    </div>
                    <div class="post-content">
                        <a href="https://tigrisfire.com" class="post-title">
                            <h4>
                                <center>Visitors Online</center>
                            </h4>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-blog-post mb-100">
                    <div class="post-thumbnail">
                        <h1>
                            <center><?= $pengunjunghariini ?></center>
                        </h1>
                    </div>
                    <div class="post-content">
                        <a href="https://tigrisfire.com" class="post-title">
                            <h4>
                                <center>Visitors Today</center>
                            </h4>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-blog-post mb-100">
                    <div class="post-thumbnail">
                        <h1>
                            <center><?= $totalpengunjung ?></center>
                        </h1>
                    </div>
                    <div class="post-content">
                        <a href="https://tigrisfire.com" class="post-title">
                            <h4>
                                <center>Visitors Total</center>
                            </h4>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>