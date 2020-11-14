<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Product</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="events-area section-padding-100">
    <div class="container">
        <div class="row">

            <div class="col-12">
                <div class="event-search-form mb-50">
                    <form action="<?= base_url("/shop/search") ?>" method="post">
                        <div class="row align-items-end">
                            <div class="col-12 col-md">
                                <div class="form-group mb-0">
                                    <label for="eventKeyword">Cari Product</label>
                                    <input type="text" class="form-control" id="eventKeyword" name="keyword"
                                        value="<?= $this->session->userdata('keyword') ?>"
                                        placeholder="Tulis disini...">
                                </div>
                            </div>
                            <div class="col-12 col-md-3 col-lg-2">
                                <button type="submit" class="btn crose-btn">Temukan Product</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-12">
                <div class="events-title">
                    <h2>Our Product</h2>
                </div>
            </div>

            <?php foreach ($content as $row) : ?>
            <div class="col-12">
                <div class="single-upcoming-events-area d-flex flex-wrap align-items-center">
                    <div class="upcoming-events-thumbnail">
                        <img src="<?= $row->image ? base_url("/images/product/$row->image") : base_url("/images/product/default.png") ?>"
                            alt="Produk Tigris Fire Indonesia">
                    </div>
                    <!-- Content -->
                    <div class="upcoming-events-content d-flex flex-wrap align-items-center">
                        <div class="events-text">
                            <h4><?= $row->product_title ?></h4>
                            <div class="events-meta">
                                <p><?= $row->product_price ?></p>
                            </div>
                            <p><?= $row->product_intro ?></p>
                            <a href="<?= base_url("/shop/detail/$row->product_slug") ?>">Detail Product <i
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
                                <input type="hidden" name="id_product" value="<?= $row->id ?>">
                                <input type="hidden" name="qty" value="1">
                                <button type="submit" class="btn crose-btn btn-2"><i class="fa fa-shopping-cart"></i>
                                    Add
                                    to Cart</button>
                            </form>
                            <?php endif ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach ?>

            <div class="col-12">
                <div class="pagination-area mt-70">
                    <?= $pagination ?>
                </div>
            </div>
        </div>
    </div>
</div>