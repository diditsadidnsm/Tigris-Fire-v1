<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Certificate</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<section class="latest-sermons-area">
    <div class="container">
        <div class="row">
          
            <div class="col-12">
                <div class="section-heading">
                    <h2>Certificate Tigris Fire</h2>
                </div>
            </div>
        </div>

        <div class="row">
           <?php foreach ($content as $row) : ?>
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="single-latest-sermons mb-100">
                    <div class="sermons-thumbnail">
                        <img src="<?= $row->image ? base_url("/images/certificate/$row->image") : base_url("/images/certificate/default.png") ?>" width="300px" alt="Certificate Tigris Fire Resmi">
                        <!-- Date -->
                        <div class="sermons-date">
                            <h6><span class="fa fa-check"></span>Valid</h6>
                        </div>
                    </div>
                    <div class="sermons-content">
                        <div class="sermons-cata">
                            <a href="<?= $row->link ?>" target="_blank" data-toggle="tooltip" data-placement="top" title="Download"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>
                        </div>
                        <h4><?= $row->certificate_name ?></h4>
                        <div class="sermons-meta-data">
                            <p><i class="fa fa-user" aria-hidden="true"></i> From: <span><?= $row->from ?></span></p>
                            <p><i class="fa fa-tag" aria-hidden="true"></i> Give Date: <span><?= $row->tgl ?></span></p>
                            <p><i class="fa fa-clock-o" aria-hidden="true"></i> Valid on <span><?= $row->exp ?></span></p>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach ?>

        </div>
    </div>
</section>