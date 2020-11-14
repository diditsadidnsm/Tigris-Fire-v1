<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>"><i class="fa fa-home"></i> Home</a>
                        </li>
                        <li class="breadcrumb-item"><a href="<?= base_url('shop') ?>">Product</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><?= $rows->title ?></li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="sermons-details-area section-padding-100">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-12 col-lg-8">
                <div class="sermons-details-area">

                    <div class="single-post-details-area">
                        <div class="post-content">
                            <h2 class="post-title mb-30"><?= $rows->title ?></h2>
                            <img class="mb-30" src="<?= base_url() ?>/images/product/<?= $rows->image ?>" alt="Produk Tigris Fire Indonesia">
                            <div
                                class="catagory-share-meta d-flex flex-wrap justify-content-between align-items-center">
                                <div class="share">
                                    <span>Share:</span>
                                    <a href="http://www.facebook.com/sharer.php?u=https://tigrisfire.com/shop/detail/<?= $rows->slug ?>" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                    <a href="http://twitter.com/share?url=https://tigrisfire.com/shop/detail/<?= $rows->slug ?>" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    <a href="https://plus.google.com/share?url=https://tigrisfire.com/shop/detail/<?= $rows->slug ?>" target="_blank"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                    <a href="http://www.linkedin.com/shareArticle?mini=true&url=https://tigrisfire.com/shop/detail/<?= $rows->slug ?>&summary=" target="_blank"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <h6><?= $rows->price ?></h6>
                            <p><?= $rows->description ?></p>
                        </div>
                    </div>

                    <div class="comment_area clearfix">
                        <ol>
                            <li class="single_comment_area">
                                <div class="comment-wrapper d-flex">
                                    <div class="comment-content">
                                        <?php if (!$this->session->userdata('is_login')) : ?>
                                        <button class="btn crose-btn btn-2"
                                            onclick="Swal.fire({icon: 'error', title: 'Mohon Maaf', text: 'Silahkan masuk akun terlebih dulu', footer: '<a href>Daftar Akun untuk mendapatkan spesial akses</a>'})"><i
                                                class="fa fa-shopping-cart"></i> Beli
                                            Sekarang</button>
                                        <?php else : ?>
                                        <form action="<?= base_url("/cart/add") ?>" method="POST">
                                            <input type="hidden" name="id_product" value="<?= $rows->id ?>">
                                            <input type="hidden" name="qty" value="1">
                                            <button type="submit" class="btn crose-btn btn-2"><i
                                                    class="fa fa-shopping-cart"></i> Add
                                                to Cart</button>
                                        </form>
                                        <?php endif ?>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>

                    <div class="leave-comment-area mt-50 clearfix">
                        <div class="comment-form">
                            <h4 class="headline">Leave A Comment</h4>
                            <div class="contact-form-area">
                                <?php $uri = $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>
                                <div class="fb-comments" data-href="<?php echo $uri; ?>" data-numposts="10">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-9 col-md-6 col-lg-3">
                <div class="post-sidebar-area">

                    <div class="single-widget-area">
                        <div class="search-form">
                            <form action="#" method="get">
                                <input type="search" name="search" placeholder="Search Here">
                                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>

                    <div class="single-widget-area">
                        <div class="widget-title">
                            <h6>Feature Product</h6>
                        </div>

                        <?php foreach (getProduct() as $product) : ?>
                        <div class="single-latest-post">
                            <h6><?= $product->title ?></h6>
                            <div class="sermons-meta-data">
                                <a href="<?= base_url("/shop/detail/$product->slug") ?>">Detail Product <i
                                        class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                        <?php endforeach ?>

                    </div>

                    <div class="single-widget-area">
                        <div class="widget-title">
                            <h6>Category Product</h6>
                        </div>
                        <ol class="crose-catagories">
                            <?php foreach (getCategories() as $category) : ?>
                            <li><a href="<?= base_url("/shop/category/$category->slug") ?>"><i class="fa fa-angle-right" aria-hidden="true"></i> <?= $category->title ?></a></li>
                            <?php endforeach ?>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>