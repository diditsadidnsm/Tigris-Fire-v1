<header class="header-area">

    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="top-header-content d-flex flex-wrap align-items-center justify-content-between">
                        <div class="top-header-meta d-flex flex-wrap">
                            <a href="#" class="open" data-toggle="tooltip" data-placement="bottom"
                                title="08 AM to 05 PM"><i class="fa fa-clock-o" aria-hidden="true"></i> <span>Opening
                                    Hours - 08 AM to 05 PM</span></a>
                            <div class="top-social-info">
                                <a href="https://www.facebook.com/tigrisfire/"><i class="fa fa-facebook" target="_blank"
                                        aria-hidden="true"></i></a>
                                <a href="https://twitter.com/tigrisfire"><i class="fa fa-twitter" target="_blank"
                                        aria-hidden="true"></i></a>
                                <a href="https://www.instagram.com/tigrisfire/"><i class="fa fa-instagram"
                                        target="_blank" aria-hidden="true"></i></a>
                                <a href="https://www.youtube.com/channel/UCBVGmKr6VMxaHjpLPCL7-_w"><i
                                        class="fa fa-youtube-play" target="_blank" aria-hidden="true"></i></a>
                                <a href="https://www.linkedin.com/company/tigris-fire-safety/"><i class="fa fa-linkedin"
                                        target="_blank" aria-hidden="true"></i></a>
                                <a href="mailto:sales@rumahapi.com"><i class="fa fa-google-plus" target="_blank"
                                        aria-hidden="true"></i></a>
                            </div>
                        </div>
                        <div class="top-header-meta">

                            <?php if (!$this->session->userdata('role') == 'admin') : ?>
                            <a href="mailto:sales@rumahapi.com" class="email-address"><i class="fa fa-envelope"
                                    aria-hidden="true"></i> <span>sales@tigrisfire.com</span></a>
                            <a href="tel:021-8835-3000" class="phone"><i class="fa fa-phone" aria-hidden="true"></i>
                                <span>021-8835-3000</span></a>
                            <?php else : ?>
                            <a href="<?= base_url('administrator/dashboard') ?>" class="email-address"><i
                                    class="fa fa-user" aria-hidden="true"></i>
                                <span><?= $this->session->userdata('name') ?></span></a>
                            <?php endif ?>

                            <?php if (!$this->session->userdata('is_login')) : ?>
                            <?php else : ?>
                            <a href="<?= base_url('cart') ?>" class="email-address"><i class="fa fa-shopping-cart"
                                    aria-hidden="true"></i>
                                <span><?= getCart(); ?></span></a>
                            <a href="<?= base_url('logout') ?>" class="email-address"><i class="fa fa-sign-out"
                                    aria-hidden="true"></i>
                                <span>Keluar Akun</span></a>
                            <?php endif ?>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="crose-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <nav class="classy-navbar justify-content-between" id="croseNav">

                    <a href="<?= base_url('/') ?>" class="nav-brand"><img
                            src="<?= base_url() ?>/assets/img/core-img/tigris.png" alt="Logo Tigris Fire Indonesia"></a>

                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <div class="classy-menu">

                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <div class="classynav">
                            <ul>
                                <li><a href="<?= base_url('/') ?>">Home</a></li>
                                <li><a href="<?= base_url('shop') ?>">Product</a>
                                    <ul class="dropdown">
                                        <?php foreach (getCategories() as $category) : ?>
                                        <li><a href="<?= base_url("/shop/category/$category->slug") ?>"><?= $category->title ?></a></li>
                                        <?php endforeach ?>
                                    </ul>
                                </li>
                                <li><a href="<?= base_url('maintenance') ?>">Service</a>
                                    <ul class="dropdown">
                                        <?php foreach (getCatserv() as $category) : ?>
                                        <li><a href="<?= base_url("/maintenance/catserv/$category->slug") ?>"><?= $category->title ?></a></li>
                                        <?php endforeach ?>
                                    </ul>
                                </li>
                                <li><a href="<?= base_url('about') ?>">About Us</a></li>
                                <li><a href="<?= base_url('contact') ?>">Contact Us</a></li>
                                <li><a href="<?= base_url('cert') ?>">Certificate</a></li>
                            </ul>

                            <?php if (!$this->session->userdata('is_login')) : ?>
                            <a href="<?= base_url('login') ?>" class="btn crose-btn header-btn">Masuk / Daftar</a>
                            <?php else : ?>
                            <a href="<?= base_url('user/dashboard') ?>" class="btn crose-btn header-btn"><i
                                    class="fa fa-user"></i> <?= $this->session->userdata('name') ?></a>
                            <?php endif ?>

                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <div class="search-form-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="searchForm">
                            <form action="#" method="post">
                                <input type="search" name="search" id="search"
                                    placeholder="Enter keywords &amp; hit enter...">
                                <button type="submit" class="d-none"></button>
                            </form>
                            <div class="close-icon" id="searchCloseIcon"><i class="fa fa-close" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>