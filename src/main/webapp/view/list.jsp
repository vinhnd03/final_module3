<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm mới</title>
    <link rel="stylesheet" href="/assets/bootstrap-5.3.6-dist/css/bootstrap.min.css">
    <!-- DataTables CSS + JS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</head>

<body>
<div class="container-fluid d-flex justify-content-center align-items-center bg-warning py-2">
    <h1 class="">Hệ thống quản lý</h1>
</div>
<div class="container d-flex justify-content-between align-items-center">
    <div class="w-100 vh-100 bg-body-tertiary">
        <div class="gap-3 p-3">
            <form method="get" action=""

                  class="d-flex align-items-center justify-content-center gap-3 p-3 form-control">
                <div class="d-flex gap-2 w-50">
                    <a href="/product?action=add" type="button" class="btn btn-outline-success">Thêm mới
                    </a>
                </div>
                <input type="hidden" name="action" value="search">
                <div class="d-flex gap-2 w-100">
                    <select name="top" class="form-select" style="width: 200px;">
                        <option value="10000">Top</option>
                        <option value="3">
                            3
                        </option>
                        <option value="5">
                            5
                        </option>
                        <option value="10">
                            10
                        </option>
                    </select>
                    <button type="submit" class="btn btn-warning">Tìm kiếm</button>
                </div>
                <div class="d-flex gap-2 w-100">
                    <div class="mb-3">
                        <label class="form-label">Ngày đặt từ</label>
                        <input name="from" type="date" class="form-control" id="dateOut" placeholder=""
                               value="${pig.dateOut}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Đến ngày</label>
                        <input name="to" type="date" class="form-control" id="dateOut" placeholder=""
                               value="${pig.dateOut}">
                        <%--                    <div id="error-content" class="text-danger small mt-1"></div>--%>
                    </div>
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>

            </form>
        </div>

        <!-- Bảng sản phẩm -->
        <div class="m-5">
            <table id="tableProduct" class="table table-hover table-bordered">
                <thead class="table-light">
                <tr style="background-color: #e3b159">
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Giảm giá</th>
                    <th scope="col">Tồn kho</th>

                </tr>
                </thead>
                <tbody style="background-color: #fff4e5">
                <c:forEach var="product" items="${productList}" varStatus="index">
                    <tr>
                        <td>
                                ${index.count}
                        </td>
                        <td>
                                ${product.name}
                        </td>
                        <td>
                                ${product.price}
                        </td>
                        <td>
                                ${product.discount}
                        </td>

                        <td>
                                ${product.stock}
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <form method="post" action="/lesson?action=delete">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa tiết học</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input hidden="hidden" id="deleteId" name="deleteId">
                            <span>Bạn có muốn xoá tiết học </span> "<span id="deleteName"></span>"
                            không?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                            <button class="btn btn-primary">Xoá</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid d-flex justify-content-center align-items-center bg-dark-subtle py-2">
    <p class="text-dark">Nguyễn Đức Vĩnh</p>
</div>
<script>
    function deleteInfo(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/assets/bootstrap-5.3.6-dist/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableProduct').DataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "info": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                "infoEmpty": "Không có dữ liệu",
                "emptyTable": "Không có dữ liệu",
                "paginate": {
                    "next": "Sau",
                    "previous": "Trước"
                }
            }
        });
    });
</script>
</body>

</html>