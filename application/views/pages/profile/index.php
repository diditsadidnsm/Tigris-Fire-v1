<section class="hero-wrap hero-wrap-2" style="background-image: url('<?= base_url() ?>/assets/images/bg_1.jpg');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="<?= base_url('') ?>">Home <i
                                class="fa fa-chevron-right"></i></a></span> <span>User <i
                            class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-3 bread">Profile</h1>
            </div>
        </div>
    </div>
</section>


<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('layouts/_menu'); ?>
        </div>
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="<?= $content->image ? base_url("/images/user/$content->image") : base_url("/images/user/avatar.png") ?>"
                                alt="Profile Member Tigris Indonesia" height="200">
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <p>Nama: <?= $content->name ?></p>
                            <p>E-Mail: <?= $content->email ?></p>
                            <a href="<?= base_url("/profile/update/$content->id") ?>" class="btn btn-primary">Edit</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>