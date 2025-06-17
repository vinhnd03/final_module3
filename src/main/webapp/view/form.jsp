<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm mới</title>
    <link rel="stylesheet" href="/assets/bootstrap-5.3.6-dist/css/bootstrap.min.css">
</head>

<body>
<div class="container-fluid d-flex justify-content-center align-items-center bg-warning py-2">
    <h1 class="">Hệ thống quản lý</h1>
</div>
<div class="container d-flex justify-content-between align-items-center w-50">
    <div class="w-100 vh-100 bg-body-tertiary">
        <h2 class="text-center pt-lg-5 text-warning">Thêm mới</h2>
        <form method="post" id="input-form" class="px-5">
            <div class="mb-3">
                <label class="form-label">Tên</label>
                <input name="name" type="text" class="form-control" id="name" placeholder="">
                <div id="error-name" class="text-danger small mt-1"></div>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá</label>
                <input name="price" type="number" class="form-control" id="price" placeholder="">
                <div id="error-price" class="text-danger small mt-1"></div>
            </div>
            <div class="mb-3">
                <label class="form-label">Giảm giá</label>
                <select name="discount" id="typeId" class="form-control">
                    <option value="5">5%</option>
                    <option value="10">10%</option>
                    <option value="15">15%</option>
                    <option value="20">20%</option>
                </select>
                <div id="error-discount" class="text-danger small mt-1"></div>
            </div>
            <div class="mb-3">
                <label class="form-label">Số lượng</label>
                <input name="stock" type="number" class="form-control" id="stock" placeholder="">
                <div id="error-stock" class="text-danger small mt-1"></div>
            </div>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-warning form-control">Thêm</button>
                <a type="button" class="btn btn-warning form-control" href="/product"> Trở về</a>
            </div>
        </form>
        <script>
            document.querySelector("#input-form").addEventListener("submit", function (e) {
                let isValid = true;
                document.querySelectorAll(".text-danger").forEach(el => el.textContent = "");

                let name = document.getElementById("name");
                if (name.value.trim() === "") {
                    document.getElementById("error-name").textContent = "Tên không được để trống";
                    isValid = false;
                }

                let price = document.getElementById("price");
                if (price.value < 100) {
                    document.getElementById("error-price").textContent = "Giá phải lớn hơn 100"
                    isValid = false;
                } else if (price.value.trim() === "") {
                    document.getElementById("error-price").textContent = "Giá không được để trống"
                    isValid = false;
                }

                let stock = document.getElementById("stock");
                if (stock.value.trim() === "") {
                    document.getElementById("error-stock").textContent = "Tồn kho không được để trống"
                    isValid = false;
                }else if(stock.value < 10){
                    document.getElementById("error-stock").textContent = "Tồn kho phải lớn hơn 10"
                    isValid = false;
                }
                if (!isValid) {
                    e.preventDefault();
                }
            });
        </script>
    </div>
</div>
<div class="container-fluid d-flex justify-content-center align-items-center bg-dark-subtle py-2">
    <p class="text-dark">Nguyễn Đức Vĩnh</p>
</div>
<script src="/assets/bootstrap-5.3.6-dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>