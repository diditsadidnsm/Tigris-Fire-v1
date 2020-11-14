<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Form Users</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                                <li class="breadcrumb-item"><a href="<?= base_url('administrator/user') ?>">Users</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Form Users</li>
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
                        <h4 class="text-blue h4">Form Users</h4>
                        <p class="mb-30">Create and Edit</p>
                    </div>
                </div>
                <?= form_open_multipart($form_action, ['method' => 'POST']) ?>
                <?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
                <div class="form-group">
                    <label>Name User</label>
                    <?= form_input('name', $input->name, ['class' => 'form-control', 'required' => true, 'autofocus' => true]) ?>
                    <?= form_error('name') ?>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <?= form_input(['type' => 'email', 'name' => 'email', 'value' => $input->email, 'class' => 'form-control', 'placeholder' => 'Masukkan alamat email aktif', 'required' => true]) ?>
                    <?= form_error('email') ?>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <?= form_password('password', '', ['class' => 'form-control', 'placeholder' => 'Masukkan password minimal 8 karakter']) ?>
                    <?= form_error('password') ?>
                </div>
                <div class="form-group">
                    <label>Role</label>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'role', 'value' => 'admin', 'checked' => $input->role == 'admin' ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Admin</label>
                    </div>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'role', 'value' => 'member', 'checked' => $input->role == 'member' ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Member</label>
                    </div>
                    <?= form_error('is_available') ?>
                </div>
                <div class="form-group">
                    <label>Activity</label>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'is_active', 'value' => 1, 'checked' => $input->is_active == 1 ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Aktif</label>
                    </div>
                    <div class="fm-checkbox">
                        <?= form_radio(['name' => 'is_active', 'value' => 0, 'checked' => $input->is_active == 0 ? true : false, 'form-check-input']) ?>
                        <label for="" class="form-check-label">Tidak Aktif</label>
                    </div>
                    <?= form_error('is_available') ?>
                </div>
                <div class="form-group">
                    <?= form_upload('image') ?>
                    <?php if ($this->session->flashdata('image_error')) : ?>
                    <small class="form-text text-danger"><?= $this->session->flashdata('image_error') ?></small>
                    <?php endif ?>
                    <?php if (isset($input->image)) : ?>
                    <img src="<?= base_url("/images/user/$input->image") ?>" alt="" height="150">
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