<!doctype html>
<html lang=en>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>jQuery Selectables Plugin Demo</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

		<style>
			body
			{
				padding-top: 70px;
			}

			*.unselectable
			{
				-webkit-touch-callout: none;
				  -webkit-user-select: none;
				   -khtml-user-select: none;
				     -moz-user-select: none;
				      -ms-user-select: none;
				          user-select: none;
			}

			.table-striped > tbody > td:nth-child(odd).selected > td
			{
				background-color: #9FAFD1;
			}

			.table-striped > tbody > td:nth-child(even).selected > td
			{
				background-color: #B0BED9;
			}

			.table-striped > tbody > td:nth-child(odd).bnw > td
			{
				background-color: #2b2b2b;
				color: #f2f2f2;
			}

			.table-striped > tbody > td:nth-child(even).bnw > td
			{
				background-color: #f2f2f2;
				color: #2b2b2b;
			}
		</style>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="plugins/jQuery/jquery.rowselector.min.js"></script>
		<script>
			$(document).ready(function ()
			{
				$('#config-form').on('submit', function (evt)
				{
					evt.preventDefault();
				});


				$('#btn-show').on('click', function (evt)
				{
					var selected = [];
					$('#user-table').selectedrows().each(function (idx, el)
					{
						selected.push(el.id);
					});

					alert('Selected Ids:\n' + selected.join(', '));
				});


				$('#select-type').on('change', function (evt)
				{
					$('#user-table').attr('data-rs-type', $(this).val());
				});


				$('#select-class').on('change', function (evt)
				{
					$('#user-table').attr('data-rs-class', $(this).val());
				});


				$('#user-table').on('clicked.rs.row', function (evt)
				{
					var rows = $(this).selectedrows().length;
					$('#num-selected').text(rows);
				});
			});
		</script>
	</head>
	<body>
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<form id="config-form" class="navbar-form navbar-left" role="form">
					<button type="button" id="btn-show" class="btn btn-primary btn-sm">Selected Ids</button>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h4>RowsSelected: <span id="num-selected">0</span></h4>
				<table id="user-table" data-rs-selectable data-rs-type="many" class="table table-striped" cellpadding=0 cellspacing=0 border=0>
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Username</th>
						</tr>
					</thead>
					<tbody>
						<tr id="0"><td>0</td><td>James</td><td>Smith</td><td>jsmith</td></tr>
						<tr id="1"><td>1</td><td>John</td><td>Johnson</td><td>jjohnson</td></tr>
						<tr id="2"><td>2</td><td>Robert</td><td>Williams</td><td>rwilliams</td></tr>
						<tr id="3"><td>3</td><td>Michael</td><td>Jones</td><td>mjones</td></tr>
						<tr id="4"><td>4</td><td>Wiliam</td><td>Brown</td><td>wbrown</td></tr>
						<tr id="5"><td>5</td><td>David</td><td>Davis</td><td>ddavis</td></tr>
						<tr id="6"><td>6</td><td>Richard</td><td>Miller</td><td>rmiller</td></tr>
						<tr id="7"><td>7</td><td>Charles</td><td>Wilson</td><td>cwilson</td></tr>
						<tr id="8"><td>8</td><td>Joseph</td><td>Moore</td><td>jmoore</td></tr>
						<tr id="9"><td>9</td><td>Thomas</td><td>Taylor</td><td>ttaylor</td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
