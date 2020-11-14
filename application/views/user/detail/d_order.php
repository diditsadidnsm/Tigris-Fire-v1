<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Confirmation Orders</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('/') ?>">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Orders</li>
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
            <div class="invoice-wrap">
                <div class="invoice-box">
                    <div class="invoice-header">
                        <div class="logo text-center">
                            <img src="vendors/images/deskapp-logo.png" alt="">
                        </div>
                    </div>
                    <h4 class="text-center mb-30 weight-600">#<?= $order->invoice ?></h4>
                    <div class="row pb-30">
                        <div class="col-md-6">
                            <h5 class="mb-15"><?= $order->name ?></h5>
                            <p class="font-14 mb-5">Date Issued: <strong
                                    class="weight-600"><?= str_replace('-', '/', date("d-m-Y", strtotime($order->date))) ?></strong>
                            </p>
                        </div>
                        <div class="col-md-6">
                            <div class="text-right">
                                <p class="font-14 mb-5"><?= $order->phone ?></p>
                                <p class="font-14 mb-5"><?= $order->address ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="invoice-desc pb-30">
                        <div class="invoice-desc-head clearfix">
                            <div class="invoice-sub">Product</div>
                            <div class="invoice-rate">Price</div>
                            <div class="invoice-hours">Qty</div>
                            <div class="invoice-subtotal">Subtotal</div>
                        </div>
                        <div class="invoice-desc-body">
                            <ul>
                                <?php foreach ($order_detail as $row) : ?>
                                <li class="clearfix">
                                    <div class="invoice-sub"><?= $row->title ?></div>
                                    <div class="invoice-rate">Rp <?= number_format($row->price, 0, ',', '.') ?>,-</div>
                                    <div class="invoice-hours"><?= $row->qty ?></div>
                                    <div class="invoice-subtotal"><span
                                            class="weight-600">Rp<?= number_format($row->subtotal, 0, ',', '.') ?>,-</span>
                                    </div>
                                </li>
                                <?php endforeach ?>
                            </ul>
                        </div>
                        <div class="invoice-desc-footer">
                            <div class="invoice-desc-head clearfix">
                                <div class="invoice-sub">Date Created</div>
                                <div class="invoice-subtotal">Total</div>
                            </div>
                            <div class="invoice-desc-body">
                                <ul>
                                    <li class="clearfix">
                                        <div class="invoice-rate font-20 weight-600">
                                            <?= str_replace('-', '/', date("d-m-Y", strtotime($order->date))) ?></div>
                                        <div class="invoice-subtotal"><span class="weight-600 font-40 text-danger">Rp
                                                <?= number_format(array_sum(array_column($order_detail, 'subtotal')), 0, ',', '.') ?>,-</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <form action="<?= base_url("administrator/order/update/$order->id") ?>" method="POST">
                        <input type="hidden" name="id" value="<?= $order->id ?>">
                        <div class="input-group">
                            <select name="status" id="" class="form-control">
                                <option value="waiting" <?= $order->status == 'waiting' ? 'selected' : '' ?>>Menunggu
                                    Pembayaran
                                </option>
                                <option value="paid" <?= $order->status == 'paid' ? 'selected' : '' ?>>
                                    Dibayar</option>
                                <option value="delivered" <?= $order->status == 'delivered' ? 'selected' : '' ?>>Dikirim
                                </option>
                                <option value="cancel" <?= $order->status == 'cancel' ? 'selected' : '' ?>>
                                    Batal</option>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit"><i class="fa fa-check"></i>
                                    Confirm</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <?php if (isset($order_confirm)) : ?>
        <div class="row mb-3">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        Bukti Transfer
                    </div>
                    <div class="card-body">
                        <p>No Rekening: <?= $order_confirm->account_number ?></p>
                        <p>Atas Nama: <?= $order_confirm->account_name ?></p>
                        <p>Nominal: Rp<?= number_format($order_confirm->nominal, 0, ',', '.') ?>,-</p>
                        <p>Catatan: <?= $order_confirm->note ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <img src="<?= base_url("/images/confirm/$order_confirm->image") ?>" alt="" height="200">
            </div>
        </div>
        <?php endif ?>
        <div class="footer-wrap pd-20 mb-20 card-box">
            &copy; 2020 PT Tigris Berkat Sejati
        </div>
    </div>
</div>