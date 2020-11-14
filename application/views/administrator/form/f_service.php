<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Form Service</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                                <li class="breadcrumb-item"><a
                                        href="<?= base_url('administrator/service') ?>">Service</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Form Service</li>
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
                        <h4 class="text-blue h4">Form Primary Product</h4>
                        <p class="mb-30">Create and Edit</p>
                    </div>
                </div>
                <?= form_open_multipart($form_action, ['method' => 'POST']) ?>
                <?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
                <?= form_input(['type' => 'hidden', 'name' => 'writer', 'value' => $this->session->userdata('name'), 'class' => 'form-control']) ?>
                <div class="form-group">
                    <label>Title</label>
                    <?= form_input('title', $input->title, ['class' => 'form-control', 'id' => 'title', 'onkeyup' => 'createSlug()', 'required' => true, 'placeholder' => 'Product Title']) ?>
                    <?= form_error('title') ?>
                </div>
                <div class="form-group">
                    <label>Slug</label>
                    <?= form_input('slug', $input->slug, ['class' => 'form-control', 'id' => 'slug', 'required' => true, 'placeholder' => 'Slug']) ?>
                    <?= form_error('slug') ?>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <?= form_input(['type' => 'text', 'name' => 'price', 'value' => $input->price, 'class' => 'form-control', 'required' => true, 'placeholder' => 'Product Price']) ?>
                    <?= form_error('price') ?>
                    <span style="color: red;">*tulis lengkap bila ada ada harga. contoh penulisan Rp 3.000.000; -> Rp 3.000.000;</span>
                </div>
                <div class="form-group">
                    <label>Intro</label>
                    <?= form_textarea(['name' => 'intro', 'value' => $input->intro, 'row' => 4, 'class' => 'form-control', 'placeholder' => 'Product Intro']) ?>
                    <?= form_error('intro') ?>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <?= form_textarea(['name' => 'description', 'value' => $input->description, 'row' => 4, 'class' => 'form-control', 'placeholder' => 'Product Description']) ?>
                    <?= form_error('description') ?>
                </div>
                <div class="form-group">
                    <label>Prepare</label>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'is_available', 'value' => 1, 'checked' => $input->is_available == 1 ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Ready</label>
                    </div>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'is_available', 'value' => 0, 'checked' => $input->is_available == 0 ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Not Ready</label>
                    </div>
                    <?= form_error('is_available') ?>
                </div>
                <div class="form-group">
                    <?= form_upload('image') ?>
                    <?php if ($this->session->flashdata('image_error')) : ?>
                    <small class="form-text text-danger"><?= $this->session->flashdata('image_error') ?></small>
                    <?php endif ?>
                    <?php if ($input->image) : ?>
                    <img src="<?= base_url("/images/service/$input->image") ?>" alt="" height="150">
                    <?php endif ?>
                    <?= form_error('image') ?>
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <?= form_dropdown('id_catserv', getDropdownList('catserv', ['id', 'title']), $input->id_catserv, ['class' => 'form-control']) ?>
                    <?= form_error('id_catserv') ?>
                </div>
                <div class="form-group">
                    <label>Sub Category</label>
                    <?= form_dropdown('id_subserv', getDropdownList('subserv', ['id', 'title']), $input->id_subserv, ['class' => 'form-control']) ?>
                    <?= form_error('id_subserv') ?>
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