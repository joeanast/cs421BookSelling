<!-- 
        File: connect.php
        Contains connection credentials for database
-->
<?php
$host = "localhost";  // ip or domain name default
$username = "book";  // mysql username default
$password = "selling";  // password default for mysql
$database = "book_selling";  // student database


$mysqli = new mysqli($host, $username, $password, $database);
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

session_start();

$token = null;

if (!isset($_SESSION['token'])) {
    // Generate a random token 
    // php.net/manual/en/function.rand.php
    // php.net/manual/en/function.sha1.php
    // php.net/manual/en/function.uniqid.php

    $token = sha1(uniqid(RAND(), TRUE));
    $_SESSION['token'] = $token;
} else {
    $token = $_SESSION['token'];
}

function Redirect($url, $permanent = false) {
    header('Location: ' . $url, true, $permanent ? 301 : 302);

    exit();
}

function isLoginGoToHome() {
    if (isset($_SESSION["CurrentUser"]) && !empty($_SESSION["CurrentUser"]))
        Redirect("index.php");
}
function isLogOutGoToHome() {
    if (!isset($_SESSION["CurrentUser"]) || empty($_SESSION["CurrentUser"]))
        Redirect("index.php");
}
?>


<?php
//GetQuery that grabs and prints each book
function getQuery($query){
if ($stmt = $mysqli->prepare($query)) {
    /* execute query */
    $stmt->execute();
    // Extract result set and loop rows
    $result = $stmt->get_result();
?>
    <div  class="row" >   

            <?php while ($data = $result->fetch_assoc()) { ?>
                <div class="panel panel-default">
                    <div class="panel-heading"> <?php print $data["Title"]; ?></div>
                    <div class="panel-body">
                        <div> <label>Author First: <span><?php print $data["Author_First"]; ?></span></label> </div>
                        <div> <label>Author Last: <span><?php print $data["Author_Last"]; ?></span></label> </div>
                        <div> <label>Book Edition : <span><?php print $data["Book_Edition"]; ?></span></label> </div>
                        <div> <label>ISBN Number: <span><?php print $data["ISBN_Number"]; ?></span></label> </div>
                        <div> <label>Semester: <span><?php print $data["Semester"]; ?></span></label> </div>
                        <div> <label>Professor Name: <span><?php print $data["Professor_Name"]; ?></span></label> </div>
                        <div> <label>Student Name: <span><?php print $data["Full_Name"]; ?></span></label> </div>                   
                    </div>
                </div>
            <?php } ?>
        </div>   

<?php }} ?>