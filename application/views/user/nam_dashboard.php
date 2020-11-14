<div class="main-container">
    <?php $this->load->view('layouts/_alert'); ?>
    <div class="pd-ltr-20">
        <div class="card-box pd-20 height-100-p mb-30">
            <div class="row align-items-center">
                <div class="col-md-4">
                    <img src="<?= base_url() ?>/theme/vendors/images/banner-img.png" alt="">
                </div>
                <div class="col-md-8">
                    <h4 class="font-20 weight-500 mb-10 text-capitalize">
                        Selamat Datang <div class="weight-600 font-30 text-blue">
                            <?= $this->session->userdata('name') ?>!</div>
                    </h4>
                    <p class="font-18 max-width-600">
                        1. Peraturan Administrator<br>
                        2. Peraturan Administrator<br>
                        3. Peraturan Administrator<br>
                        4. Peraturan Administrator<br>
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart"></div>
                        </div>
                        <div class="widget-data">
                            <div class="h4 mb-0"><?= $visitorTotal ?></div>
                            <div class="weight-600 font-14">Visitors</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart2"></div>
                        </div>
                        <div class="widget-data">
                            <div class="h4 mb-0"><?= $orders ?></div>
                            <div class="weight-600 font-14">Orders</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart3"></div>
                        </div>
                        <div class="widget-data">
                            <div class="h4 mb-0"><?= $product ?></div>
                            <div class="weight-600 font-14">Product</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart4"></div>
                        </div>
                        <div class="widget-data">
                            <div class="h4 mb-0"><?= $activity ?></div>
                            <div class="weight-600 font-14">Users</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            &copy; 2020 PT Tigris Berkat Sejati
        </div>
    </div>
</div>