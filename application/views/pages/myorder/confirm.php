<section class="hero-wrap hero-wrap-2" style="background-image: url('<?= base_url() ?>/assets/images/bg_1.jpg');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="<?= base_url('') ?>">Home <i
                                class="fa fa-chevron-right"></i></a></span> <span>User <i
                            class="fa fa-chevron-right"></i></span> <span>Order <i
                            class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-3 bread">Konfirmasi</h1>
            </div>
        </div>
    </div>
</section>

<main role="main" class="container">
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('layouts/_menu'); ?>
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    Konfirmasi Order #<?= $order->invoice ?>
                    <div class="float-right">
                        <?php $this->load->view('layouts/_status', ['status' => $order->status]); ?>
                    </div>
                </div>
                <?= form_open_multipart($form_action, ['method' => 'POST']) ?>
                <?= form_hidden('id_orders', $order->id); ?>
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Transaksi</label>
                        <input type="text" class="form-control" value="<?= $order->invoice ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="">Dari Rekening a/n</label>
                        <input type="text" name="account_name" value="<?= $input->account_name ?>" class="form-control">
                        <?= form_error('account_name') ?>
                    </div>
                    <div class="form-group">
                        <label for="">No Rekening</label>
                        <input type="text" name="account_number" value="<?= $input->account_number ?>"
                            class="form-control">
                        <?= form_error('account_number') ?>
                    </div>
                    <div class="form-group">
                        <label for="">Sebesar</label>
                        <input type="number" name="nominal" value="<?= $input->nominal ?>" class="form-control">
                        <?= form_error('nominal') ?>
                    </div>
                    <div class="form-group">
                        <label for="">Catatan</label>
                        <textarea name="note" id="" cols="30" rows="5" class="form-control">-</textarea>
                    </div>
                    <div class="form-group">
                        <label for="">Bukti Transfer</label> <br>
                        <input type="file" name="image" id="">
                        <?php if ($this->session->flashdata('image_error')) : ?>
                        <small class="form-text text-danger"><?= $this->session->flashdata('image_error') ?></small>
                        <?php endif ?>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-success">Konfirmasi Pembayaran</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</main>