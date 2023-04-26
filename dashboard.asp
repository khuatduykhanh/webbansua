<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
    <title>My Custom Dashboard</title>
    <style>
        /* Change the background color of the sidebar */
        .sidebar {
            background-color: #222;
        }

        /* Change the font size and color of the sidebar links */
        .sidebar a {
            font-size: 20px;
            color: #fff;
        }

        /* Change the background color of the cards */
        .card {
            background-color: #f0f0f0;
        }

        /* Change the font size and color of the card headings */
        .card-title {
            font-size: 24px;
            color: #222;
        }

        /* Change the font size and color of the card text */
        .card-text {
            font-size: 18px;
            color: #555;
        }

        /* Change the background color and font color of the table */
        table {
            background-color: #fff;
            color: #222;
        }

        /* Change the font size of the table headers */
        th {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2 sidebar">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Orders</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Customers</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Products</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-lg-10">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total Sales</h5>
                               
                            <p class="card-text">$10,000</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Orders</h5>
                            <p class="card-text">50</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Customers</h5>
                            <p class="card-text">100</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-lg-12">
                    <h2>Recent Orders</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order Number</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>12345</td>
                                <td>John Smith</td>
                                <td>April 20, 2023</td>
                                <td>$500</td>
                            </tr>
                            <tr>
                                <td>12346</td>
                                <td>Jane Doe</td>
                                <td>April 19, 2023</td>
                                <td>$1000</td>
                            </tr>
                            <tr>
                                <td>12347</td>
                                <td>Bob Johnson</td>
                                <td>April 18, 2023</td>
                                <td>$250</td>
                            </tr>
                            <tr>
                                <td>12348</td>
                                <td>Sara Wilson</td>
                                <td>April 17, 2023</td>
                                <td>$750</td>
                            </tr>
                            <tr>
                                <td>12349</td>
                                <td>Mike Brown</td>
                                <td>April 16, 2023</td>
                                <td>$100</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Link to Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>