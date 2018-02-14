<?php
require_once 'connect.php';
isLogOutGoToHome();
?>
<?php require './header.php'; ?>  

<div class="row">
    <div class="col-sm-4">
        <div class="list-group">
            <a href="addCourse.php" class="list-group-item">add course</a>
            <a href="addBookforsell.php" class="list-group-item">add book for sell</a>
            <a href="addBookforrequest.php" class="list-group-item">add book for request</a>
            <a href="mylistrequest.php" class="list-group-item">My list book for request</a>
            <a href="mylistbooksForsell.php" class="list-group-item">My list book for sell</a>
        </div>
    </div>
</div>

<?php require './footer.php'; ?>

