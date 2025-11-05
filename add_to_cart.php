<?php
session_start();
include 'config.php'; // Pastikan koneksi database sudah benar

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

error_log(print_r($_SESSION['cart'], true)); // Debug: Melihat isi session
// Debug POST data
error_log(print_r($_POST, true)); // Akan log data POST ke error_log server

// Debug session cart
error_log(print_r($_SESSION['cart'], true)); // Log keranjang


// Baca data JSON dari fetch
$data = json_decode(file_get_contents('php://input'), true);// Validasi data POST
if (isset($_POST['id'], $_POST['nama'], $_POST['harga'], $_POST['foto'])) {
    $product_id = $_POST['id'];
    $product_name = $_POST['nama'];
    $product_price = $_POST['harga'];
    $product_photo = $_POST['foto'];
    
    // Jika session keranjang belum ada, buat array kosong
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = array();
    }

    // Cek apakah produk sudah ada di keranjang
    $found = false;
    foreach ($_SESSION['cart'] as $key => $item) {
        if ($item['id'] == $product_id) {
            $_SESSION['cart'][$key]['quantity'] += 1; // Tambah kuantitas
            $found = true;
            break;
        }
    }

// Ambil data dari URL
$product_id = $_GET['id'];
$product_name = urldecode($_GET['name']);
$product_price = $_GET['price'];

// Cek apakah produk sudah ada di cart
$check = $conn->query("SELECT * FROM cart WHERE product_id = '$product_id'");
if ($check->num_rows > 0) {
    // Update jumlah jika produk sudah ada
    $conn->query("UPDATE cart SET quantity = quantity + 1 WHERE product_id = '$product_id'");
} else {
    // Tambahkan produk baru
    $conn->query("INSERT INTO cart (product_id, product_name, price, quantity) VALUES ('$product_id', '$product_name', '$product_price', 1)");
}

// Redirect kembali ke halaman cart
header('Location: cart.php');

    // Jika produk belum ada, tambahkan ke keranjang
    if (!$found) {
        $_SESSION['cart'][] = array(
            'id' => $product_id,
            'name' => $product_name,
            'price' => $product_price,
            'photo' => $product_photo,
            'quantity' => 1
        );
    }
    
    // Kirim respons sederhana
    echo "Product added to cart";
} else {
    // Kirim respons error
    echo "Error adding product to cart";
}
exit;

?>
    



