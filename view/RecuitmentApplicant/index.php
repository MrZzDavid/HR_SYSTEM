<?php
include("../../Config/conect.php");
session_start();

// Fetch recruitment applicant data
$sql = "SELECT * FROM rcmapplicant ORDER BY ID DESC";
$result = $con->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruitment Applicant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../style/career.css" rel="stylesheet">
    <style>
        .status-pending { 
            color: #ffc107;
            font-weight: 600;
        }
        .status-recruited { 
            color: #28a745;
            font-weight: 600;
        }
        .status-rejected { 
            color: #dc3545;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container-fluid mt-4 mb-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Recruitment Applicant List</h4>
                            <a href="create.php" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>New Applicant
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="applicantTable" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Actions</th>
                                    <th>Applicant ID</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Apply Position</th>
                                    <th>Date of Birth</th>
                                    <th>Education</th>
                                    <th>Experience</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while($row = $result->fetch_assoc()): ?>
                                <tr>
                                    <td class="action-buttons">
                                        <a href="edit.php?id=<?php echo htmlspecialchars($row['ID']); ?>" 
                                           class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn btn-sm btn-danger delete-btn" 
                                                data-id="<?php echo htmlspecialchars($row['ID']); ?>">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                    <td><?php echo htmlspecialchars($row['AppId']); ?></td>
                                    <td><?php echo htmlspecialchars($row['AppName']); ?></td>
                                    <td><?php echo htmlspecialchars($row['Gender']); ?></td>
                                    <td><?php echo htmlspecialchars($row['ApplyPost']); ?></td>
                                    <td><?php echo date('d M Y', strtotime($row['Dob'])); ?></td>
                                    <td><?php echo htmlspecialchars($row['Education']); ?></td>
                                    <td><?php echo htmlspecialchars($row['Experience']); ?></td>
                                    <td>
                                        <?php 
                                            $statusText = $row['Recruited'] == 1 ? 'Recruited' : $row['Status'];
                                            $statusClass = $row['Recruited'] == 1 ? 'status-recruited' : 
                                                        ($row['Status'] == 'Pending' ? 'status-pending' : 'status-rejected');
                                            echo "<span class='{$statusClass}'>" . htmlspecialchars($statusText) . "</span>";
                                        ?>
                                    </td>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            // Initialize DataTable with custom options
            $('#applicantTable').DataTable({
                pageLength: 10,
                order: [[1, 'desc']], // Sort by Applicant ID by default
                responsive: true,
                language: {
                    search: "<i class='fas fa-search'></i> Search:",
                    lengthMenu: "_MENU_ records per page",
                },
                columnDefs: [
                    { orderable: false, targets: 0 }, // Disable sorting on action column
                ]
            });

            // Check for success message
            const urlParams = new URLSearchParams(window.location.search);
            const successMsg = urlParams.get('success');
            if (successMsg) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: decodeURIComponent(successMsg),
                    timer: 3000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
            }

            // Handle delete button click
            $('.delete-btn').click(function() {
                const id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: 'var(--danger-color)',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: '<i class="fas fa-trash-alt me-2"></i>Yes, delete it!',
                    cancelButtonText: '<i class="fas fa-times me-2"></i>Cancel',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `../../action/RecuitmentApplicant/delete.php?id=${encodeURIComponent(id)}`;
                    }
                });
            });
        });
    </script>
</body>
</html>