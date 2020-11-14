<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Form Certificate</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                                <li class="breadcrumb-item"><a
                                        href="<?= base_url('administrator/certificate') ?>">Certificate</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Form Certificate</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                        <div class="dropdown">
                            <a href="javascript:history.back()" class="btn btn-danger">
                                <i class="fa fa-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pd-20 card-box mb-30">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Form Certificate</h4>
                        <p class="mb-30">Create and Edit</p>
                    </div>
                </div>
                <?= form_open_multipart($form_action, ['method' => 'POST']) ?>
                <?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
                <div class="form-group">
                    <label>Name</label>
                    <?= form_input('name', $input->name, ['class' => 'form-control', 'required' => true]) ?>
                    <?= form_error('name') ?>
                </div>
                <div class="form-group">
                    <label>From</label>
                    <?= form_input('from', $input->from, ['class' => 'form-control', 'required' => true]) ?>
                    <?= form_error('from') ?>
                </div>
                <div class="form-group">
                    <label>Give Date</label>
                    <?= form_input(['type' => 'date', 'name' => 'tgl', 'value' => $input->tgl, 'class' => 'form-control', 'required' => true]) ?>
                    <?= form_error('tgl') ?>
                </div>
                <div class="form-group">
                    <label>Exp</label>
                    <?= form_input(['type' => 'date', 'name' => 'exp', 'value' => $input->exp, 'class' => 'form-control', 'required' => true]) ?>
                    <?= form_error('exp') ?>
                </div>
                <div class="form-group">
                    <label>Link Download</label>
                    <?= form_input('link', $input->link, ['class' => 'form-control']) ?>
                    <?= form_error('link') ?>
                </div>
                <div class="form-group">
                    <?= form_upload('image') ?>
                    <?php if ($this->session->flashdata('image_error')) : ?>
                    <small class="form-text text-danger"><?= $this->session->flashdata('image_error') ?></small>
                    <?php endif ?>
                    <?php if ($input->image) : ?>
                    <img src="<?= base_url("/images/certification/$input->image") ?>" alt="" height="150">
                    <?php endif ?>
                    <?= form_error('image') ?>
                </div>
                <div class="form-group">
                    <label></label>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Create
                        Now</button>
                </div>
                <?= form_close() ?>
            </div>
        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            &copy; 2020 PT Tigris Berkat Sejati
        </div>
    </div>
</div>