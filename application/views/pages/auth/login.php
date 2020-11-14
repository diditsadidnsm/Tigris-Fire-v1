<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title><?= $title; ?></title>
    <link rel="apple-touch-icon" sizes="180x180" href="<?= base_url() ?>/theme/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?= base_url() ?>/theme/vendors/images/favicon.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?= base_url() ?>/theme/vendors/images/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= base_url() ?>/theme/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="<?= base_url() ?>/theme/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="<?= base_url() ?>/theme/vendors/styles/style.css">
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());

    gtag('config', 'UA-119386393-1');
    </script>
</head>

<body class="login-page">
    <div class="login-header box-shadow">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <div class="brand-logo">
                <a href="<?= base_url('/') ?>">
                    <img src="<?= base_url() ?>/theme/vendors/images/logo-tigris.png" alt="Logo Tigris Fire">
                </a>
            </div>
            <div class="login-menu">
                <ul>
                    <li><a href="<?= base_url('register') ?>">Daftar Akun</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
        <div class="container">
            <?php $this->load->view('layouts/_alert') ?>
            <div class="row align-items-center">
                <div class="col-md-6 col-lg-7">
                    <img src="<?= base_url() ?>/theme/vendors/images/login-page-img.png" alt="Masuk Akun Tigris Fire">
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="login-box bg-white box-shadow border-radius-10">
                        <div class="login-title">
                            <h2 class="text-center text-primary">Masuk Tigris Fire</h2>
                        </div>
                        <?= form_open('login', ['method' => 'POST']) ?>
                        <div class="select-role">
                            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn active">
                                    <input type="radio" name="options" id="admin">
                                    <div class="icon"><img src="<?= base_url() ?>/theme/vendors/images/briefcase.svg"
                                            class="svg" alt="Admin Tigris Fire">
                                    </div>
                                    <span>Saya</span>
                                    Admin
                                </label>
                                <label class="btn">
                                    <input type="radio" name="options" id="user" required="true">
                                    <div class="icon"><img src="<?= base_url() ?>/theme/vendors/images/person.svg"
                                            class="svg" alt="Member Tigris Fire"></div>
                                    <span>Saya</span>
                                    Member
                                </label>
                            </div>
                        </div>
                        <div class="input-group custom">
                            <?= form_input(['type' => 'email', 'name' => 'email', 'value' => $input->email, 'class' => 'form-control form-control-lg', 'placeholder' => 'Masukkan alamat email', 'required' => true]) ?>
                            <div class="input-group-append custom">
                                <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
                            </div>
                            <?= form_error('email') ?>
                        </div>
                        <div class="input-group custom">
                            <?= form_password('password', '', ['class' => 'form-control form-control-lg', 'placeholder' => '********', 'required' => true]) ?>
                            <div class="input-group-append custom">
                                <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                            </div>
                            <?= form_error('password') ?>
                        </div>
                        <div class="row pb-30">
                            <div class="col-6">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Ingat Saya</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="forgot-password"><a href="forgot-password.html">Lupa Password</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="input-group mb-0">
                                    <input class="btn btn-primary btn-lg btn-block" type="submit" value="Masuk">
                                </div>
                                <div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">ATAU
                                </div>
                                <div class="input-group mb-0">
                                    <a class="btn btn-outline-primary btn-lg btn-block"
                                        href="<?= base_url('register') ?>">Daftar
                                        Akun Baru</a>
                                </div>
                            </div>
                        </div>
                        <?= form_close() ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?= base_url() ?>/theme/vendors/scripts/core.js"></script>
    <script src="<?= base_url() ?>/theme/vendors/scripts/script.min.js"></script>
    <script src="<?= base_url() ?>/theme/vendors/scripts/process.js"></script>
    <script src="<?= base_url() ?>/theme/vendors/scripts/layout-settings.js"></script>
</body>

</html>