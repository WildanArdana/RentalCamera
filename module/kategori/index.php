<?php
if (!isset($_SESSION)) {
    session_start();
}
if (!isset($_SESSION['namauser']) && !isset($_SESSION['passuser'])) {
    include "assets/lib/config.php";
    header("Location: $admin_url./pages/login/");
    exit;
} else {
    ?>
<!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">List Kategori</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Apps</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Kategori</a>
                                    </li>
                                    <li class="breadcrumb-item active"><a href="#">List Kategori</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Zero configuration table -->
                <section id="basic-datatable">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">List Kategori</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body card-dashboard">
                                        <div class="table-responsive">
                                            <table class="table zero-configuration table-hover">
                                                <thead class="thead-light">
                                                    <tr class="text-center">
                                                        <th>NO</th>
                                                        <th>ID Kategori</th>
                                                        <th>Nama Kategori</th>
                                                        <th width="170">Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
$kuerikategori = mysqli_query($koneksi, "SELECT * FROM tbl_kategori");
    $i = 1;
    while ($row = mysqli_fetch_array($kuerikategori)) {
        ?>
                                                    <tr class="text-center">
                                                        <td><?=$i;?></td>
                                                        <td><?=$row['id_kategori'];?></td>
                                                        <td><?=$row['nama'];?></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <a href="?module=editkategori&idkategori=<?=$row['id_kategori'];?>" class="btn btn-warning"><i class="feather icon-edit"></i></a>
                                                                <a href="module/kategori/aksi/aksi_hapus_kategori.php?idkategori=<?=$row['id_kategori'];?>" class="btn btn-danger"><i class="feather icon-trash-2"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <?php
$i++;
    }
    ?>
                                                </tbody>
                                                <tfoot>
                                                    <tr class="text-center">
                                                        <th>NO</th>
                                                        <th>ID Kategori</th>
                                                        <th>Nama Kategori</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--/ Zero configuration table -->
            </div>
        </div>
    </div>
    <!-- END: Content-->
                                                <?php }?>