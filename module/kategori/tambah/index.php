<?php
if (!isset($_SESSION)) {
    session_start();
}
if (!isset($_SESSION['namauser']) && !isset($_SESSION['passuser'])) {
    include "assets/lib/config.php";
    header("Location: $admin_url./pages/login/");
    exit;
} else {
    include "assets/lib/koneksi.php";
    $query = mysqli_query($koneksi, "SELECT * FROM tbl_kategori ORDER BY id_kategori DESC LIMIT 1");
    $hasil = mysqli_fetch_array($query);
    $lastid = $hasil['id_kategori'];

    if ($lastid == "") {
        $id = "K0001";
    } else {
        $id = substr($lastid, -4);
        $id = intval($id);
        $id = ($id + 1);
        $id = "K" . str_pad($id, 4, '0', STR_PAD_LEFT);
    }
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
                            <h2 class="content-header-title float-left mb-0">Tambah Kategori</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Apps</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#">Kategori</a>
                                    </li>
                                    <li class="breadcrumb-item active"><a href="#">Tambah Kategori</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Basic Horizontal form layout section start -->
                <section id="basic-horizontal-layouts">
                    <div class="row match-height">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Tambah Kategori</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form class="form form-horizontal" action="module/kategori/aksi/aksi_simpan_kategori.php" method="POST">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <span>ID Kategori</span>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <input type="text" id="idkategori" class="form-control" name="idkategori" placeholder="ID Kategori" style="color: #7367F0;" value="<?php echo $id; ?>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <span>Nama Kategori</span>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <input type="text" id="nama" class="form-control" name="nama" placeholder="Nama Kategori">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8 offset-md-4">
                                                        <button type="submit" class="btn btn-primary mr-1 mb-1">Submit</button>
                                                        <button type="reset" class="btn btn-outline-warning mr-1 mb-1">Reset</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic Horizontal form layout section end -->

            </div>
        </div>
    </div>
    <!-- END: Content-->
<?php }?>