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
    <link rel="stylesheet" type="text/css"
        href="<?= base_url() ?>/theme/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css"
        href="<?= base_url() ?>/theme/src/plugins/datatables/css/responsive.bootstrap4.min.css">
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

<body>
    <div class="pre-loader">
        <div class="pre-loader-box">
            <div class="loader-logo"><img src="<?= base_url() ?>/theme/vendors/images/logo-tigris.png" alt=""></div>
            <div class='loader-progress' id="progress_div">
                <div class='bar' id='bar1'></div>
            </div>
            <div class='percent' id='percent1'>0%</div>
            <div class="loading-text">
                Loading...
            </div>
        </div>
    </div>