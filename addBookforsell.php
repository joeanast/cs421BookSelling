<?php
require './connect.php';
isLogOutGoToHome();
?> 

<?php
if (isset($_POST['title'])) {

    if (empty($_POST['title']) || empty($_POST['edition']) || empty($_POST['ISBN']) || empty($_POST['Author_First']) || empty($_POST['Author_Last']) || empty($_POST['course']) || empty($_POST['semester']) || empty($_POST['prof'])) {
        $msgWarning = "All fields are required";
    } else {
        $title = $_POST['title'];
        $edition = $_POST['edition'];
        $ISBN = $_POST['ISBN'];
        $Author_First = $_POST['Author_First'];
        $Author_Last = $_POST['Author_Last'];
        $course = $_POST['course'];
        $semester = $_POST['semester'];
        $prof = $_POST['prof'];

        $query = "INSERT INTO `author_id`( `Author_First`, `Author_Last`)  " .
                " VALUES (?,?)";
        if ($stmt = $mysqli->prepare($query)) {

            /* bind parameters for markers */

            $stmt->bind_param("ss", $Author_First, $Author_Last);
            /* execute query */
            $stmt->execute();

            if ($mysqli->insert_id > 0) {
                $Author_id = $mysqli->insert_id;

                $query = "INSERT INTO `book`(`Author_ID`, `Title`, `Book_Edition`, `ISBN_Number`)  " .
                        " VALUES (?,?,?,?)";
                if ($stmt = $mysqli->prepare($query)) {

                    /* bind parameters for markers */

                    $stmt->bind_param("isis", $Author_id, $title, $edition, $ISBN);
                    /* execute query */
                    $stmt->execute();

                    if ($mysqli->insert_id > 0) {
                        $book_id = $mysqli->insert_id;

                        $query = "INSERT INTO `sem_book`(`Course_ID`, `Book_ID`, `Student_ID`, `Semester`, `Professor_Name`, `Trans_Type`, `Time`)  " .
                                " VALUES (?,?,?,?,?,?,?)";
                        if ($stmt = $mysqli->prepare($query)) {

                            /* bind parameters for markers */
                            $student_id=$_SESSION["CurrentUser"]["ID"];
                            $type="1";
                            $time=date("Y-m-d");
                            $stmt->bind_param("iiissis", $course, $book_id,$student_id,$semester,$prof,$type , $time);
                            /* execute query */
                            $stmt->execute();

                            if ($mysqli->insert_id > 0) {
                                $msgSuccess="Your offer has been successfully added";
                            }
                        }
                    }
                }
            }
        } else {
            $msgWarning = "The operation was not performed due to a technical error";
        }
    }
}
?>

<?php require './header.php'; ?>  
<?php if (!empty($msgSuccess)) { ?>
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> <?php print $msgSuccess; ?>.
    </div>
<?php } ?>
<?php if (!empty($msgInfo)) { ?>
    <div class="alert alert-info">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Info!</strong>  <?php print $msgInfo; ?>.
    </div>
<?php } ?>
<?php if (!empty($msgWarning)) { ?>
    <div class="alert alert-warning">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Warning!</strong> <?php print $msgWarning; ?>.
    </div>
<?php } ?>
<?php if (!empty($msgDanger)) { ?>
    <div class="alert alert-danger">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Danger!</strong> <?php print $msgDanger; ?>.
    </div>
<?php } ?>


<div class="loginmodal-container Book-form">
    <h1>add new Book for sell </h1><br>
    <form  method="post" data-toggle="validator">
        <div class="row border-bloc"> 
            <div class="col-sm-12">
                <div class="col-sm-12">
                    <div class="form-group">
                        <input type="name"  name="title" class="form-control" placeholder="Enter Title" required> 
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <div class="form-group">
                        <input type="number"  name="edition" class="form-control" placeholder="Enter Edition" required> 
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <input type="name"  name="ISBN" class="form-control" placeholder="Enter ISBN" required> 
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <div class="form-group">
                        <input type="name"  name="Author_First" class="form-control" placeholder="Enter First Author" required> 
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <input type="name"  name="Author_Last" class="form-control" placeholder="Enter Last Author" required> 
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-bloc"> 
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Course</label>
<?php
$query = "select Course_ID,`Course_Name` from `course`";
if ($stmt = $mysqli->prepare($query)) {

    /* execute query */
    $stmt->execute();
    // Extract result set and loop rows
    $result = $stmt->get_result();
    ?>
                            <select  name="course" class="form-control" placeholder="Enter Title" required>
                            <?php while ($data = $result->fetch_assoc()) { ?>
                                    <option value="<?php print $data["Course_ID"]; ?>"> <?php print $data["Course_Name"]; ?> </option>
                            <?php } ?>
                            </select>
                            <?php } ?>

                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Semester</label>
                        <select  name="semester" class="form-control" placeholder="Enter Title" required>
                            <option value="FA"> FA</option>                                   
                            <option value="SP"> SP</option>
                            <option value="SU"> SU</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label>Professor Name</label>
                        <input type="name"  name="prof" class="form-control" placeholder="Enter Edition" required> 
                    </div>
                </div>

            </div>
        </div>
        <input type="submit" name="login"   class="login loginmodal-submit" value="add Book">
    </form>
</div>

<?php require './footer.php'; ?>
