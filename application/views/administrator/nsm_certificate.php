<div class="main-container">
    <?php $this->load->view('layouts/_alert'); ?>
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Product</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= base_url('') ?>">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Certificate</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                        <div class="dropdown">
                            <a class="btn btn-primary" href="<?= base_url('administrator/certificate/create') ?>">
                                <i class="fa fa-plus"></i> Create Certificate
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-blue h4">Product Primary</h4>
                </div>
                <div class="pb-20">
                    <table class="data-table table hover multiple-select-row nowrap">
                        <thead>
                            <tr>
                                <th class="table-plus datatable-nosort">No</th>
                                <th>Images</th>
                                <th>Name</th>
                                <th>From</th>
                                <th>give date</th>
                                <th>Exp</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; foreach ($content as $row) :  $no++; ?>
                            <tr>
                                <td class="table-plus"><?= $no ?>.</td>
                                <td>
                                    <img src="<?= $row->image ? base_url("images/certificate/$row->image") : base_url("images/certificate/default.png") ?>"
                                        alt="" width="50px">
                                </td>
                                <td><?= $row->certificate_name ?></td>
                                <td><?= $row->from ?></td>
                                <td><?= $row->tgl ?></td>
                                <td><?= $row->exp ?></td>
                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                            href="#" role="button" data-toggle="dropdown">
                                            <i class="dw dw-more"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                            <?= form_open("administrator/certificate/delete/$row->id", ['method' => 'POST']) ?>
                                            <?= form_hidden('id', $row->id) ?>
                                            <a class="dropdown-item"
                                                href="<?= base_url("administrator/certificate/edit/$row->id") ?>"><i
                                                    class="dw dw-edit2"></i> Edit</a>
                                            <button class="dropdown-item" 
                                                onclick="return confirm('Apakah yakin ingin menghapus?')"><i
                                                    class="dw dw-delete-3"></i> Delete</button>
                                            <?= form_close() ?>
                                        </div>
                                    </div>
                                </td>
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