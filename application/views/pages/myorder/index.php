<section class="hero-wrap hero-wrap-2" style="background-image: url('<?= base_url() ?>/assets/images/bg_1.jpg');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="<?= base_url('') ?>">Home <i
                                class="fa fa-chevron-right"></i></a></span> <span>User <i
                            class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-3 bread">My Order</h1>
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
                    Daftar Orders
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nomor</th>
                                <th>Tanggal</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($content as $row) : ?>
                            <tr>
                                <td>
                                    <a
                                        href="<?= base_url("/myorder/detail/$row->invoice") ?>"><strong>#<?= $row->invoice ?></strong></a>
                                </td>
                                <td><?= str_replace('-', '/', date("d-m-Y", strtotime($row->date))) ?></td>
                                <td>Rp<?= number_format($row->total, 0, ',', '.') ?>,-</td>
                                <td>
                                    <?php $this->load->view('layouts/_status', ['status' => $row->status]);  ?>
                                </td>
                            </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>