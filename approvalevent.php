<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="style.css">

	<title>AdminHub</title>
</head>
<body>

	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<span class="text">Thrive.org</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="landingpage.php">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="approvalkomunitas.php">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Komunitas</span>
				</a>
			</li>
			<li>
				<a href="approvalevent.php">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Event</span>
				</a>
			</li>
		</ul>
	</section>

    <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <style type="text/css">


        .wrapper{
            width: 650px;
            margin: 0 auto;
        }
        .page-header h2{
            margin-top: 0;
        }
        table tr td:last-child a{
            margin-right: 5px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>

<div class="wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="page-header clearfix">
                    <h2 class="pull-left">Komunitas</h2>
                    <div class="pull-right">
                        <form method="GET" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </div>
                <?php
                // Include config1 file
                require_once "config2.php";

                // Process search query
                $search = isset($_GET['search']) ? $_GET['search'] : '';
                if (!empty($search)) {
                    $sql = "SELECT * FROM events WHERE name LIKE '%$search%' OR description LIKE '%$search%' OR category LIKE '%$search%'";
                } else {
                    $sql = "SELECT * FROM events";
                }

                if($result = mysqli_query($link, $sql)){
                    if(mysqli_num_rows($result) > 0){
                        echo "<table class='table table-bordered table-striped'>";
                        echo "<thead>";
                        echo "<tr>";
                        echo "<th>Event Id</th>";
                        echo "<th>Nama Event</th>";
                        echo "<th>Tanggal</th>";
                        echo "<th>Waktu</th>";
                        echo "<th>Lokasi</th>";
                        echo "<th>Pengaturan</th>";
                        echo "</tr>";
                        echo "</thead>";
                        echo "<tbody>";
                        while($row = mysqli_fetch_array($result)){
                            echo "<tr>";
                            echo "<td>" . $row['event_id'] . "</td>";
                            echo "<td>" . $row['nama_event'] . "</td>";
                            echo "<td>" . $row['tanggal'] . "</td>";
                            echo "<td>" . $row['waktu'] . "</td>";
                            echo "<td>" . $row['lokasi'] . "</td>";
                            echo "<td>";
                            echo "<a href='terima.php?id=". $row['id'] ."' title='Terima' data-toggle='tooltip'>Terima</a>";
                            echo "<a href='tolakkomunitas.php?id=". $row['id'] ."' title='Tolak' data-toggle='tooltip'>Tolak</a>";
                            echo "</td>";
                            echo "</tr>";
                        }
                        echo "</tbody>";
                        echo "</table>";

                        // Free result set
                        mysqli_free_result($result);
                    } else{
                        echo "<p class='lead'><em>No records were found.</em></p>";
                    }
                } else{
                    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
                }
                ?>
            </div>
        </div>
    </div>
</div>
