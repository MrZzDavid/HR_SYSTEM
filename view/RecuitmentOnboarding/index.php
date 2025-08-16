<?php
include("../../Config/conect.php");
session_start();

// Fetch only recruited applicants who have not been onboarded
$sql = "SELECT * FROM rcmapplicant WHERE Recruited = 1 AND (Remark IS NULL OR Remark NOT LIKE '%[ONBOARDED]%') ORDER BY ID DESC";
$result = $con->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruitment Onboarding</title>
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
        .status-recruited { 
            color: #28a745;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container-fluid mt-4 mb-4">
        <?php if (isset($_GET['success'])): ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?php echo htmlspecialchars(urldecode($_GET['success'])); ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php elseif (isset($_GET['error'])): ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <?php echo htmlspecialchars(urldecode($_GET['error'])); ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Recruitment Onboarding</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="onboardTable" class="table table-striped table-bordered table-hover">
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
                                    <td>
                                        <button class="btn btn-success btn-sm announce-btn" 
                                                data-id="<?php echo htmlspecialchars($row['ID']); ?>">
                                            <i class="fas fa-bullhorn me-1"></i>Announce to HR
                                        </button>
                                    </td>
                                    <td><?php echo htmlspecialchars($row['AppId']); ?></td>
                                    <td><?php echo htmlspecialchars($row['AppName']); ?></td>
                                    <td><?php echo htmlspecialchars($row['Gender']); ?></td>
                                    <td><?php echo htmlspecialchars($row['ApplyPost']); ?></td>
                                    <td><?php echo date('d M Y', strtotime($row['Dob'])); ?></td>
                                    <td><?php echo htmlspecialchars($row['Education']); ?></td>
                                    <td><?php echo htmlspecialchars($row['Experience']); ?></td>
                                    <td><span class="status-recruited">Recruited</span></td>
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
            // SweetAlert2 for success/error messages
            <?php if (isset($_GET['success'])): ?>
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: '<?php echo htmlspecialchars(urldecode($_GET['success']), ENT_QUOTES); ?>',
                    confirmButtonColor: '#28a745'
                });
            <?php elseif (isset($_GET['error'])): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '<?php echo htmlspecialchars(urldecode($_GET['error']), ENT_QUOTES); ?>',
                    confirmButtonColor: '#dc3545'
                });
            <?php endif; ?>

            // Initialize DataTable with custom options
            $('#onboardTable').DataTable({
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

            // Handle announce button click
            $('.announce-btn').click(function() {
                const id = $(this).data('id');
                Swal.fire({
                    title: 'Announce to HR?',
                    text: 'This will onboard the applicant to HR Staff Profile.',
                    icon: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: '<i class="fas fa-bullhorn me-2"></i>Yes, announce!',
                    cancelButtonText: '<i class="fas fa-times me-2"></i>Cancel',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `../../action/RecuitmentOnboarding/announce.php?id=${encodeURIComponent(id)}`;
                    }
                });
            });
        });
    </script>
</body>
</html>