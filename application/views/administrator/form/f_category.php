<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Form Category</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                                <li class="breadcrumb-item"><a
                                        href="<?= base_url('administrator/category') ?>">Category</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Form Category</li>
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
                        <h4 class="text-blue h4">Form Category Product</h4>
                        <p class="mb-30">Create and Edit</p>
                    </div>
                </div>
                <?= form_open($form_action, ['method' => 'POST']) ?>
                <?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
                <div class="form-group row">
                    <label class="col-sm-12 col-md-2 col-form-label">Title</label>
                    <div class="col-sm-12 col-md-10">
                        <?= form_input('title', $input->title, ['class' => 'form-control', 'id' => 'title', 'onkeyup' => 'createSlug()', 'required' => true, 'autofocus' => true]) ?>
                    </div>
                    <?= form_error('title') ?>
                </div>
                <div class="form-group row">
                    <label class="col-sm-12 col-md-2 col-form-label">Slug</label>
                    <div class="col-sm-12 col-md-10">
                        <?= form_input('slug', $input->slug, ['class' => 'form-control', 'id' => 'slug', 'required' => true]) ?>
                    </div>
                    <?= form_error('slug') ?>
                </div>
                <div class="form-group row">
                    <label class="col-sm-12 col-md-2 col-form-label"></label>
                    <div class="col-sm-12 col-md-10">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Create
                            Now</button>
                    </div>
                </div>
                <?= form_close() ?>
            </div>
        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            &copy; 2020 PT Tigris Berkat Sejati
        </div>
    </div>
</div>