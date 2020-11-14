<div class="main-container">
    <?php $this->load->view('layouts/_alert'); ?>
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">

            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-blue h4">Orders</h4>
                </div>
                <div class="pb-20">
                    <table class="data-table table hover multiple-select-row nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus datatable-nosort">No</th>
                                <th>Invoice</th>
                                <th>Tanggal</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; foreach ($content as $row) :  $no++; ?>
                            <tr>
                                <td class="table-plus"><?= $no ?>.</td>
                                <td>
                                    <a href="<?= base_url("/administrator/order/detail/$row->id") ?>"><strong>#<?= $row->invoice ?></strong>
                                </td>
                                <td><?= str_replace('-', '/', date("d-m-Y", strtotime($row->date))) ?></td>
                                <td>Rp <?= number_format($row->total, 0, ',', '.') ?>,-</td>
                                <td><?php $this->load->view('layouts/_status', ['status' => $row->status]);  ?></td>
                            </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="footer-wrap pd-20 mb-20 card-box">
            &copy; 2020 PT Tigris Berkat Sejati
        </div>
    </div>
</div>