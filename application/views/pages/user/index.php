<section class="hero-wrap hero-wrap-2" style="background-image: url('<?= base_url() ?>/assets/images/bg_1.jpg');"
    data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="<?= base_url('') ?>">Home <i
                                class="fa fa-chevron-right"></i></a></span> <span>Produk <i
                            class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-3 bread">User</h1>
            </div>
        </div>
    </div>
</section>

<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('layouts/_item'); ?>
        </div>
        <div class="col-md-9 mx-auto">
            <div class="card mb-3">
                <div class="card-header">
                    <span>Pengguna</span>
                    <a href="<?= base_url('user/create') ?>" class="btn btn-sm btn-secondary">Tambah</a>

                    <div class="float-right">
                        <form action="<?= base_url("user/search") ?>" method="POST">
                            <div class="input-group">
                                <input type="text" name="keyword" class="form-control form-control-sm text-center"
                                    placeholder="Cari" value="<?= $this->session->userdata('keyword') ?>">
                                <div class="input-group-append">
                                    <button class="btn btn-info btn-sm" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Pengguna</th>
                                <th scope="col">E-Mail</th>
                                <th scope="col">Role</th>
                                <th scope="col">Status</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0;
                            foreach ($content as $row) : $no++; ?>
                            <tr>
                                <td><?= $no ?></td>
                                <td>
                                    <p>
                                        <img src="<?= $row->image ? base_url("images/user/$row->image") : base_url("images/user/avatar.png") ?>"
                                            alt="Member Tigris Fire Indonesia" height="50">
                                        <?= $row->name ?>
                                    </p>
                                </td>
                                <td><?= $row->email ?></td>
                                <td><?= $row->role ?></td>
                                <td><?= $row->is_active ? 'Aktif' : 'Tidak Aktif' ?></td>
                                <td>
                                    <?= form_open(base_url("user/delete/$row->id"), ['method' => 'POST']) ?>
                                    <?= form_hidden('id', $row->id) ?>
                                    <a href="<?= base_url("user/edit/$row->id") ?>" class="btn btn-sm">
                                        <i class="fa fa-edit text-info"></i>
                                    </a>
                                    <button class="btn btn-sm" type="submit"
                                        onclick="return confirm('Apakah yakin ingin menghapus?')">
                                        <i class="fa fa-trash text-danger"></i>
                                    </button>
                                    <?= form_close() ?>
                                </td>
                            </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>

                    <nav aria-label="Page navigation example">
                        <?= $pagination ?>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</main>